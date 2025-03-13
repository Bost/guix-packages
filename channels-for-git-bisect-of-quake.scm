(list 
      (channel
        (name 'bost)
        (url "https://github.com/Bost/guix-packages")
        (branch "master")
        ;; (commit "1b92a433e8673861bb690e1691e08b028d40a394")
        )
      (channel
        (name 'guix)
        (url "https://git.savannah.gnu.org/git/guix.git")
        (branch "master")
        ;; (commit "477895ad22e478180b5446c7ee80de74f4bbb22b")
        (introduction
          (make-channel-introduction
            "9edb3f66fd807b096b48283debdcddccfea34bad"
            (openpgp-fingerprint
              "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA")))))
