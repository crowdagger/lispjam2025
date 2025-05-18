(use-modules (hoot ffi)
             (web dom)
             (sif ui)
             (sif main)
             (sif character)
             (sif scene))


(define story (get-element-by-id "story"))
(define toto (make-character "Toto" "#FF0000"))

(define-scene scene-0
  (message "Foo!")
  (toto "Bar!")
  (message "Plop")
  (toto "Coin"))

(sif-init scene-0)
(sif-main)
;(append-child! story (make-text-node "Hello, world!"))

;(append-html! story (format #f "<b>POUET</b> ~a" f))
