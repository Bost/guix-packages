# Tracing common utilities

Import the tracing controls from `(bost common utils)` or `(bost common core)`:

```scheme
(use-modules (bost common utils))
```

Use `trc` at the points you want to inspect:

```scheme
(trc "args:" args)
(trc "exit-status:" exit-status)
```

Enabled tracing prints the label and a quoted representation of the value,
including available caller bindings `m` and `f`. Disabled or excluded calls
skip evaluation of both the label and value expressions. Tracing does not use
`test-type` or inspect input ports for EOF.

`trc` marks individual diagnostic points; it does not automatically log every
procedure entry and exit.

## Put parameterize around the operation you want to trace

The Scheme form is spelled `parameterize`. Its settings apply throughout the
execution of its body, including nested calls. Previous settings are restored
when the body returns or raises an exception.

In a fresh Guile REPL:

```scheme
(use-modules (bost common utils))

;; No tracing by default.
(exec-system* "echo this-echo-is-not-traced")

;; Trace this procedure during this call.
(parameterize ((tracing-procedures '(exec-system*)))
  (exec-system* "echo this-echo-is-traced"))

;; The temporary setting has ended.
(exec-system* "echo this-echo-is-no-longer-traced")
```

The traced call prints lines such as:

```text
[bost common exec:exec-system*] #:verbose: #f
[bost common exec:exec-system*] #:ignore-errors: #f
[bost common exec:exec-system*] #:split-whitespace: #t
[bost common exec:exec-system*] args: ("echo this-echo-is-traced")
this-echo-is-traced
```

Depending on output buffering, `this-echo-is-traced` may appear before the trace lines,
especially when output is redirected.

For `def` and `def*` procedures, the prefix combines the module and procedure
names with `:`. Colon has no special meaning in regular expressions. Characters
in the names themselves, such as the `*` in `exec-system*`, still have their
ordinary regular-expression meaning.

Inside your own procedure, wrap the operations you are investigating:

```scheme
(define (do-work)
  (display "Starting work\n")

  (parameterize ((tracing-procedures '(exec-system*)))
    (exec-system* "echo this-echo-is-traced")
    (exec-system* "echo this-second-echo-is-traced"))

  (display "Finished work\n"))
```

Both commands inside the body use the temporary setting. Alternatively, wrap
an entry-point call to trace selected procedures throughout a script's run:

```scheme
(parameterize ((tracing-procedures '(exec-system* exec-foreground)))
  (apply main (command-line)))
```

Use this in a script where `main` is defined and accepts those command-line
arguments. The selected procedures are traced wherever they are called during
`main`, including indirectly through other procedures.

## Select outer and nested procedures separately

`exec-system*-new` calls `exec-or-dry-run-new`. To trace only the outer procedure:

```scheme
(parameterize ((tracing-procedures '(exec-system*-new)))
  (exec-system*-new "echo this-echo-is-traced"))
```

To trace both:

```scheme
(parameterize ((tracing-procedures
                '(exec-system*-new exec-or-dry-run-new)))
  (exec-system*-new "echo this-echo-is-traced"))
```

`exec-system*-new` exits the process when it finishes. Run these examples in a
separate Guile process rather than a REPL you want to keep open.

Automatic selection by name is available for procedures defined using `def`,
`def-public`, `def*`, and `def*-public`. Ordinary `define` procedures do not
receive the automatic procedure-name binding. Their `trc` calls can still be
shown by enabling tracing for all procedures.

## Trace everything or temporarily silence tracing

The controls have these meanings:

| Setting                                   | Behavior                            |
|-------------------------------------------|-------------------------------------|
| `tracing-procedures` is `#f`              | `tracing-enabled?` controls tracing |
| `tracing-procedures` is a list of symbols | Only those procedures are traced    |
| `tracing-procedures` is `'()`             | Tracing is disabled                 |

A procedure list takes precedence over `tracing-enabled?`. Selecting procedures
does not also require setting `tracing-enabled?` to `#t`. Conversely, setting
`tracing-enabled?` to `#f` does not disable a selected procedure list; use an
empty list to silence tracing regardless of the surrounding settings.

Enable every `trc` call in a body:

```scheme
(parameterize ((tracing-enabled? #t)
               (tracing-procedures #f))
  (exec-system* "echo this-echo-is-traced"))
```

Temporarily silence tracing inside an already traced operation:

```scheme
(parameterize ((tracing-enabled? #t)
               (tracing-procedures #f))
  (exec-system* "echo this-echo-is-traced")       ; traced

  (parameterize ((tracing-procedures '()))
    (exec-system* "echo this-echo-is-not-traced"))    ; silent

  (exec-system* "echo this-echo-is-traced-again"))      ; traced again
```

## Run a traced command from a shell

From the channel root, pass the Scheme expression to Guile:

```sh
guile --no-auto-compile -L src -c '
(use-modules (bost common utils))
(parameterize ((tracing-procedures (quote (exec-system*))))
  (exec-system* "echo this-echo-is-traced"))
'
```

`quote` is used instead of the Scheme apostrophe shorthand because the shell
already encloses the expression in single quotes.
