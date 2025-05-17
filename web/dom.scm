(define-module (web dom)
  #:use-module (hoot ffi)
  #:export (document-body
        make-text-node
        set-html!
        append-child!))

(define-foreign document-body
  "document" "body"
  -> (ref null extern))

(define-foreign make-text-node
  "document" "createTextNode"
  (ref string) -> (ref null extern))

(define-foreign set-html!
  "element" "setHtml"
  (ref null extern) (ref string) -> (ref null extern))

(define-foreign append-child!
  "element" "appendChild"
  (ref null extern) (ref null extern) -> (ref null extern))
