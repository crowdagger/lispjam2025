(define-module (script start)
  #:use-module (sif scene)
  #:use-module (sif ui)
  #:use-module (script characters)
  #:export (start-scene))

(define-scene start-scene
  (message "It was pretty early in the morning when Naomi woke up.")
  (naomi "Huuuuuh")
  (naomi "Hum, what time is it?")
  (message "Or at least, it was pretty early according to her standards.")
  (naomi "Oh, it's not even 1:00 PM")
  (menu "Go back to bed?"
            `(("Yes" ,(lambda* (#:optional (input #f)) (naomi "Hum, maybe not")))
              ("No" ,(lambda* (#:optional (input #f)) (naomi "Let's get moving")))))
  )


