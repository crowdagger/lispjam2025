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
            (("Yes" (jump sleep-scene))
             ("No"  (jump awake-scene))))
  )


(define-scene sleep-scene
  (naomi "Oh, well")
  (message "The young woman closed her eyes again and used a pillow to hide from the light.")
  (message "When she awoke again, it was definitely not early, even according to her sloppy standards.")
  (jump awake-scene))

(define-scene awake-scene
  (naomi "Let's get moving")
  (message "She got up."))
