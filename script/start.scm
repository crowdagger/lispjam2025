(define-module (script start)
  #:use-module (sif scene)
  #:use-module (sif ui)
  #:use-module (script characters)
  #:export (start-scene))

(define *time* 1)

(define-scene start-scene
  (message "It was pretty early in the morning when Naomi woke up.")
  (naomi "Huuuuuh")
  (naomi "Hum, what time is it?")
  (message "Or at least, it was pretty early according to her standards.")
  (naomi "Oh, it's not even 1:00 PM")
  (#:menu "Go back to bed?"
          (("Yes" (jump sleep-scene))
           ("No"  (jump awake-scene))))
  )


(define-scene sleep-scene
  (clear-screen)
  (naomi "Oh, well")
  (message "The young woman closed her eyes again and used a pillow to hide from the light.")
  (set! *time* (+ 4 *time*))
  (message "When she awoke again, it was definitely not early, even according to her sloppy standards.")
  (naomi (format #f "Oh, it's ~a:00, f███!"
                 *time*))
  (jump awake-scene))

(define-scene awake-scene
  (clear-screen)
  (naomi "Let's get moving")
  (message "She got up.")
  (jump end-scene))


(define-scene end-scene
  (clear-screen)
  (message "THE END")
  (clear-screen)
  (lizzie "Thanks for playing!")
  (lizzie "I offer my apologies for the lack of actual game content")
  (lizzie "However, I still wanted to submit something to partcipate")
  (lizzie "This was a nice experience, kudos to David Thompson and Technomancy for organizing this jam 💜")
  (clear-screen)
  (message "THE END (for real)"))
