(define-module (dwl-guile patches)
               #:use-module (guix gexp)
               #:use-module (srfi srfi-1)
               #:export (
                         %patch-base
                         %patch-xwayland
                         %patch-alpha
                         %patch-smartborders
                         %patch-attachabove
                         %patch-vanitygaps
                         %patch-monitor-config
                         %patch-focusmonpointer
                         %patch-cyclelayouts
                         %patch-movestack
                         %patch-swallow
                         make-patch
                         list-of-local-files?))

; Find the absolute path to home-dwl-service by looking in the load path.
(define %dwl-guile-root-dir
  (find (lambda (path)
          (file-exists? (string-append path "/dwl-guile/patches/dwl-guile.patch")))
        %load-path))

(define (list-of-local-files? val) (every local-file? val))

(define (make-patch file-name)
  (local-file (string-append %dwl-guile-root-dir "/dwl-guile/patches/" file-name ".patch")))

(define %patch-base (make-patch "dwl-guile"))
(define %patch-xwayland (make-patch "xwayland"))
(define %patch-alpha (make-patch "alpha"))
(define %patch-smartborders (make-patch "smartborders"))
(define %patch-attachabove (make-patch "attachabove"))
(define %patch-vanitygaps (make-patch "vanitygaps"))
(define %patch-monitor-config (make-patch "monitor-config"))
(define %patch-focusmonpointer (make-patch "focusmonpointer"))
(define %patch-cyclelayouts (make-patch "cyclelayouts"))
(define %patch-movestack (make-patch "movestack"))
(define %patch-swallow (make-patch "swallow"))
