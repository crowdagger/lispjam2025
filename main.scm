(import (sif main)
        (ice-9 readline)
        (ice-9 format)
        (ice-9 match)
        (script start))

(sif-init start-scene)

(display (vector-ref start-scene 0))
(newline)

(display "Press enter to start")
(let main-loop ([ret 'continue])
  (let ([input (readline)])
    (display ret)
    (newline)
    (match ret
      (#f (display "End!"))
      ('repeat (main-loop (sif-main input)))
      (else (main-loop (sif-main))))))
(newline)
