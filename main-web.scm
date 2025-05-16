(use-modules (hoot ffi))

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

(append-child! (document-body) (make-text-node "Hello, world!"))

(set-html! (document-body) "<b>POUET</b>")
