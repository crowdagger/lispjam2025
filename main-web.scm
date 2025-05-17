(use-modules (hoot ffi)
             (web dom)
             (sif scene))


(append-child! (document-body) (make-text-node "Hello, world!"))

(set-html! (document-body) (format #f "<b>POUET</b> ~a" f))
