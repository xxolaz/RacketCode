;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |smile code|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp")) #f)))
;;;;; Smiley Face

(define face (underlay/offset (circle 40 "solid" "yellow")
                   0 -10
                   (underlay/offset (circle 10 "solid" "black")
                                   -30 0
                                   (circle 10 "solid" "black"))))
(define eyes (underlay/offset (star 10 "solid" "yellow")
                                     -30 0
                                     (star 10 "solid" "yellow")))
(define nose (square 12 "solid" "black"))

(define dimples (underlay/offset (square 10 "solid" "black")
                                 -30 0
                                 (square 10 "solid" "black")))
(define mouth (rectangle 25 8 "solid" "black"))

(define eface (overlay/xy eyes -17 -22 face))

(define neface (overlay/xy nose -33.5 -40 eface))

(define nemface (overlay/xy mouth -27.5 -60 neface))

(define nemdface (overlay/xy dimples -20 -53 nemface))

;;;;; Alien Ship

(define alien (overlay/offset (rectangle 60 15 "solid" "orange")
                 0 0
                 (circle 18 "solid" "orange")))

;;;;; Name Banner

(define name(text/font "TWINKLE" 12 "black"
             "Gill Sans" 'default 'normal 'light #f))
(define rec(rectangle 64 20 "solid" "light green"))

(define namebanner (overlay name rec))

;;; Shadowed Triangle

(define rec1 (rectangle 48 80 "solid" "Black"))

(define tri1 (triangle 48 "solid" "dark orange"))

(define tri2 (flip-vertical
              (triangle 48 "solid" "white")))

(define rt (overlay/xy tri1 0 0 rec1))

(define rtt (overlay/xy tri2 0 -41 rt))