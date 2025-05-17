(use-modules (hoot ffi)
             (web dom)
             (ui ui)
             (sif scene))


(message "Foo!")
(message "Bar")
(append-child! (document-body) (make-text-node "Hello, world!"))

(append-html! (document-body) (format #f "<b>POUET</b> ~a" f))
