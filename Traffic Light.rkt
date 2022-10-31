;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Traffic Light|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
;Constants
(define Bwidth 80)(define Bheight 220)
(define background (rectangle Bwidth Bheight 'solid 'black))

(define solidc-r (circle 30 'solid 'red))
(define outlinec-r (circle 30 'outline 'red))
(define solidc-y (circle 30 'solid 'yellow))
(define outlinec-y (circle 28 'outline 'yellow))
(define solidc-g (circle 30 'solid 'green))
(define outlinec-g (circle 30 'outline'green))
(define border-r (circle 33 'solid 'yellow))
(define border-y (circle 33 'solid 'yellow))
(define border-g (circle 33 'solid 'yellow))
(define lightb-r (circle 30.1 'solid 'black))
(define lightb-y (circle 30.1 'solid 'black))
(define lightb-g (circle 30.1 'solid 'black))
(define arrow-g (overlay/offset (rectangle 30 15 'solid 'green)
                                   -28 0
                                  (rotate 90 (triangle 30 'solid 'green))))
(define Stop-R (place-image solidc-r (/ Bwidth 2) 40
                          (place-image outlinec-y (/ Bwidth 2) 110 (place-image outlinec-g (/ Bwidth 2) 180
                          (place-image lightb-r (/ Bwidth 2) 40 (place-image lightb-y (/ Bwidth 2) 110 (place-image lightb-g (/ Bwidth 2) 180
                          (place-image border-r (/ Bwidth 2) 40 (place-image border-y (/ Bwidth 2) 110 (place-image border-g (/ Bwidth 2) 180 background))))))))))
(define Slow-Y (place-image solidc-y (/ Bwidth 2) 110
                          (place-image outlinec-r (/ Bwidth 2) 40 (place-image outlinec-g (/ Bwidth 2) 180
                          (place-image lightb-r (/ Bwidth 2) 40 (place-image lightb-g (/ Bwidth 2) 180
                          (place-image border-r (/ Bwidth 2) 40 (place-image border-y (/ Bwidth 2) 110 (place-image border-g (/ Bwidth 2) 180 background)))))))))
(define Go-G (place-image solidc-g (/ Bwidth 2) 180
                          (place-image outlinec-y (/ Bwidth 2) 110 (place-image outlinec-r (/ Bwidth 2) 40
                          (place-image lightb-r (/ Bwidth 2) 40 (place-image lightb-y (/ Bwidth 2) 110 (place-image lightb-g (/ Bwidth 2) 180
                          (place-image border-r (/ Bwidth 2) 40 (place-image border-y (/ Bwidth 2) 110 (place-image border-g (/ Bwidth 2) 180 background))))))))))
(define Left-Go (place-image arrow-g (/ Bwidth 2) 180
                          (place-image outlinec-y (/ Bwidth 2) 110 (place-image outlinec-r (/ Bwidth 2) 40
                          (place-image lightb-r (/ Bwidth 2) 40 (place-image lightb-y (/ Bwidth 2) 110 (place-image lightb-g (/ Bwidth 2) 180
                          (place-image border-r (/ Bwidth 2) 40 (place-image border-y (/ Bwidth 2) 110 (place-image border-g (/ Bwidth 2) 180 background))))))))))
(define Yellow-Border (place-image border-r (/ Bwidth 2) 40
                                   (place-image border-y (/ Bwidth 2) 110 (place-image border-g (/ Bwidth 2) 180 background))))
(define Black-Border (place-image lightb-r (/ Bwidth 2) 40 (place-image lightb-y (/ Bwidth 2) 110 (place-image lightb-g (/ Bwidth 2) 180 background))))

(define-struct world (img ticks))
(define Init-State (make-world Stop-R 0))
(define SlowWorld (make-world Slow-Y 3))
(define GoWorld (make-world Go-G 2))
(define ArrowWorld (make-world Left-Go 1))

;f-on-world: world ->
;Purpose:
#;(define (f-on-world w)
;INVENTORY
;(world-imgw) = the image of the traffic light
;(world-ticks w) = the number of ticks
...)

;draw-world: world -> image
;Purpose: To return an image of the traffic light
(define (draw-world w)
;INVENTORY
;(world-img w) = the image of the traffic light
;(world-ticks w) = the number of ticks
(world-img w))
(check-expect (draw-world Init-State) Stop-R)
(check-expect (draw-world SlowWorld) Slow-Y)
(check-expect (draw-world GoWorld) Go-G)
(check-expect (draw-world ArrowWorld) Left-Go)

;update-world: world -> world
;Purpose: To update the world after a clock tick
#;(define (update-world w)
; INVENTORY
; (world-img w) = the image of the traffic light
; (world-ticks w) = the number of ticks
(world-ticks w)) 
#;(check-expect (update-world Init-State) ArrowWorld)
#;(check-expect (update-world SlowWorld) Init-State)
#;(check-expect (update-world GoWorld) SlowWorld)
#;(check-expect (update-world ArrowWorld) GoWorld)

;update-world: world -> world
;Purpose: To update the world after a tick
(define (update-world w)
  (cond [(image=? (world-img w) Stop-R)
           (make-world Left-Go (add1 (world-ticks w)))]
        [(image=? (world-img w) Go-G)
           (make-world Slow-Y (add1 (world-ticks w)))]
        [(image=? (world-img w) Left-Go)
           (make-world Go-G (add1 (world-ticks w)))]
         [else (make-world Stop-R (add1 (world-ticks w)))]))
         
(check-expect (update-world Init-State) ArrowWorld)
(check-expect (update-world ArrowWorld) GoWorld)
(check-expect (update-world GoWorld) SlowWorld)
(check-expect (update-world SlowWorld) (make-world Stop-R 4))

;TrafficLight -> TrafficLight
;simulates a clock-based American traffic light
(define (traffic-light-simulation initial-state)
 (big-bang initial-state
 [to-draw draw-world]
 [on-tick update-world 5]))

(traffic-light-simulation Init-State)

