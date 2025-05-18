(import (cards card)
        (sif ui)
        (sif main)
        (sif scene)
        (sif state)
        (sif character)
        (ice-9 format)
        (script start))

(sif-init start-scene)

(while (sif-main)
  '())

(display "End!")
(newline)
