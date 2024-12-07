(define-module (bost gnu packages clojure)
  #:use-module (gnu packages java)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix packages)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system ant)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system clojure)

  #:use-module (ice-9 match))

(define-public clojure
  (let* ((lib (lambda (prefix version hash)
                (origin (method url-fetch)
                        (uri (string-append "https://github.com/clojure/"
                                            prefix version ".tar.gz"))
                        (sha256 (base32 hash)))))
         ;; The libraries below are needed to run the tests.
         (libraries
          `(("core-specs-alpha-src"
             ,(lib "core.specs.alpha/archive/v"
                   "0.2.62"
                   "0v6nhghsigpzm8y7dykfm318q5dvk5l8sykmn1hr0qgs1jsjqh9j"))
            ("data-generators-src"
             ,(lib "data.generators/archive/data.generators-"
                   "1.0.0"
                   "0s3hf1njvs68b8igasikvzagzqxl0gbri7w2qhzsypkhfh60v2cp"))
            ("java-classpath-src"
             ,(lib "java.classpath/archive/java.classpath-"
                   "1.0.0"
                   "178zajjsc9phk5l61r8w9hcpk0wgc9a811pl7kjgvn7rg4l7fh7j"))
            ("spec-alpha-src"
             ,(lib "spec.alpha/archive/v"
                   "0.3.218"
                   "0h5nd9xlind1a2vmllr2yfhnirgj2pm5dndgqzrly78l5iwcc3wa"))
            ("test-check-src"
             ,(lib "test.check/archive/v"
                   "1.1.1"
                   "0kx8l79mhpnn94rpsgc7nac7gb222g7a47mzrycj8crfc54wf0c1"))
            ("test-generative-src"
             ,(lib "test.generative/archive/test.generative-"
                   "1.0.0"
                   "0yy2vc38s4j5n94jdcjx1v7l2gdq0lywam31id1jh07sx37lv5il"))
            ("tools-namespace-src"
             ,(lib "tools.namespace/archive/tools.namespace-"
                   "1.0.0"
                   "1ifpk93m33rj2xm1qnnninlsdvm1liqmsp9igr63pjjwwwjw1cnn"))
            ("tools-reader-src"
             ,(lib "tools.reader/archive/tools.reader-"
                   "1.3.2"
                   "1n4dhg61iyypnjbxmihhqjb7lfpc0lzfvlk4jd8w0yr6za414f3a"))))
         (library-names (match libraries
                          (((library-name _) ...)
                           library-name))))

    (package
      (name "clojure")
      (version "1.11.1")
      (source (let ((name+version (string-append name "-" version)))
                (origin
                  (method git-fetch)
                  (uri (git-reference
                        (url "https://github.com/clojure/clojure")
                        (commit name+version)))
                  (file-name (string-append name+version "-checkout"))
                  (sha256
                   (base32 "1xbab21rm9zvhmw1i2h5lqm7612vrdkxprq0rgb2i3sbgsxcdsn4")))))
      (build-system ant-build-system)
      (inputs
       `(("jre" ,icedtea)))
      (arguments
       `(#:imported-modules ((guix build clojure-utils)
                             (guix build clojure-build-system)
                             (guix build guile-build-system)
                             ,@%ant-build-system-modules)
         #:modules ((guix build ant-build-system)
                    ((guix build clojure-build-system) #:prefix clj:)
                    (guix build clojure-utils)
                    (guix build java-utils)
                    (guix build utils)
                    (ice-9 match)
                    (ice-9 regex)
                    (srfi srfi-26))
         #:test-target "test"
         #:phases
         (modify-phases %standard-phases
           (add-after 'unpack 'unpack-library-sources
             (lambda* (#:key inputs #:allow-other-keys)
               (define (extract-library name)
                 (mkdir-p name)
                 (with-directory-excursion name
                   (invoke "tar"
                           "--extract"
                           "--verbose"
                           "--file" (assoc-ref inputs name)
                           "--strip-components=1")))
               (for-each extract-library ',library-names)
               (copy-recursively "core-specs-alpha-src/src/main/clojure"
                                 "src/clj/")
               (copy-recursively "spec-alpha-src/src/main/clojure"
                                 "src/clj/")
               #t))
           (add-after 'unpack-library-sources 'fix-manifest-classpath
             (lambda _
               (substitute* "build.xml"
                 (("<attribute name=\"Class-Path\" value=\".\"/>") ""))
               #t))
           (add-after 'unpack-library-sources 'clojure-spec-skip-macros
             ;; Disable spec macro instrumentation when compiling clojure.spec
             ;; See: https://clojure.atlassian.net/browse/CLJ-2254
             (lambda _
               (substitute* "build.xml"
                 (("<sysproperty key=\"java.awt.headless\" value=\"true\"/>")
                  ,(string-join
                    '("<sysproperty key=\"java.awt.headless\" value=\"true\"/>"
                      "<sysproperty key=\"clojure.spec.skip-macros\" value=\"true\"/>\n")
                    "\n")))
               #t))
           (add-after 'unpack-library-sources 'clojure-spec-compile
             ;; Compile and include clojure.spec.alpha & clojure.core.specs.alpha
             (lambda _
               (substitute* "build.xml"
                 (("<arg value=\"clojure.math\"/>")
                  ,(string-join
                    '("<arg value=\"clojure.math\"/>"
                      "<arg value=\"clojure.spec.alpha\"/>"
                      "<arg value=\"clojure.spec.gen.alpha\"/>"
                      "<arg value=\"clojure.spec.test.alpha\"/>"
                      "<arg value=\"clojure.core.specs.alpha\"/>"))))
               #t))
           (add-before 'build 'maven-classpath-properties
             (lambda _
               (define (make-classpath libraries)
                 (string-join (map (lambda (library)
                                     (string-append library "/src/main/clojure"))
                                   libraries) ":"))
               (with-output-to-file "maven-classpath.properties"
                 (lambda ()
                   (let ((classpath (make-classpath ',library-names)))
                     (display (string-append "maven.compile.classpath=" classpath "\n"))
                     (display (string-append "maven.test.classpath=" classpath "\n")))))
               #t))
           (add-after 'build 'build-javadoc ant-build-javadoc)
           (replace 'install (install-jars "./"))
           (add-after 'install-license-files 'install-doc
             (cut install-doc #:doc-dirs '("doc/clojure/") <...>))
           (add-after 'install-doc 'install-javadoc
             (install-javadoc "target/javadoc/"))
           (add-after 'reset-gzip-timestamps 'reset-class-timestamps clj:reset-class-timestamps))))
      (native-inputs libraries)
      (home-page "https://clojure.org/")
      (synopsis "Lisp dialect running on the JVM")
      (description "Clojure is a dynamic, general-purpose programming language,
combining the approachability and interactive development of a scripting
language with an efficient and robust infrastructure for multithreaded
programming.  Clojure is a compiled language, yet remains completely dynamic
– every feature supported by Clojure is supported at runtime.  Clojure
provides easy access to the Java frameworks, with optional type hints and type
inference, to ensure that calls to Java can avoid reflection.

Clojure is a dialect of Lisp, and shares with Lisp the code-as-data philosophy
and a powerful macro system.  Clojure is predominantly a functional programming
language, and features a rich set of immutable, persistent data structures.
When mutable state is needed, Clojure offers a software transactional memory
system and reactive Agent system that ensure clean, correct, multithreaded
designs.")
      ;; Clojure is licensed under EPL1.0
      ;; ASM bytecode manipulation library is licensed under BSD-3
      ;; Guava Murmur3 hash implementation is licensed under APL2.0
      ;; src/clj/repl.clj is licensed under CPL1.0

      ;; See readme.html or readme.txt for details.
      (license (list license:epl1.0
                     license:bsd-3
                     license:asl2.0
                     license:cpl1.0)))))

(define-public clojure-tools ;; PR sent
  (package
    (name "clojure-tools")
    (version "1.12.0.1488")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://download.clojure.org/install/clojure-tools-"
                           version
                           ".tar.gz"))
       (sha256 (base32 "0hh78b22shj530armm9850cqr85wqdxyqfzx4qf45w5y200bw6dw"))))
    (build-system copy-build-system)
    (arguments
     `(#:install-plan
       '(("deps.edn" "lib/clojure/")
         ("example-deps.edn" "lib/clojure/")
         ("tools.edn" "lib/clojure/")
         ("exec.jar" "lib/clojure/libexec/")
         (,(string-append "clojure-tools-" version ".jar") "lib/clojure/libexec/")
         ("clojure" "bin/")
         ("clj" "bin/"))
       #:modules ((guix build copy-build-system)
                  (guix build utils)
                  (srfi srfi-1)
                  (ice-9 match))
       #:phases
       (modify-phases %standard-phases
         (add-after 'unpack 'fix-paths
           (lambda* (#:key outputs #:allow-other-keys)
             (substitute* "clojure"
               (("PREFIX") (string-append (assoc-ref outputs "out") "/lib/clojure")))
             (substitute* "clj"
               (("BINDIR") (string-append (assoc-ref outputs "out") "/bin"))
               (("rlwrap") (which "rlwrap"))))))))
    (inputs (list
             (@(gnu packages readline) rlwrap)
             (@(gnu packages clojure) clojure)
             (@(gnu packages clojure) clojure-tools-deps)
             (@(gnu packages java) java-commons-logging-minimal)))
    (home-page "https://clojure.org/releases/tools")
    (synopsis "CLI tools for the Clojure programming language")
    (description "The Clojure command line tools can be used to start a
Clojure repl, use Clojure and Java libraries, and start Clojure programs.")
    (license license:epl1.0)))

