;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Learning Structures|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))


;DATA DEFINITION


;A rectangle is a structure (make-rect l w) where l is a number and w is a number
(define-struct rect (length width))
;A cube is a structure (make-cube l w h) where l, h, and w are a number
(define-struct cube (length width height)) 

;Templates

;f-on-rect: rect -> ??
;Purpose:
#;(define (f-on-rect rec)
    ;INVENTORY
    ;(rect-length rec) returns the length of the given rect structure
    ;(rect-width rec) returns the width of the given rect structure 
    ;(rect? rec)  returns true if the given structure is a rec structure
    (...))

;f-on-cube: cube -> ???
;Purpose: who knows now a days
#;(define (f-on-cube cube)
    ;INVENTORY
    ;(cube-length cube) returns the length of the given cube structure
    ;(cube-width cube) returns the width of the given cube structure
    ;(cube-height cube) returns the height of the given cube structure
    ;(cube? cube) returns true if the given structure is a cube structure
    (...))


;Examples

(define R1 (make-rect 20 10))
(define R2 (make-rect 30 100))


;rec-area: rect -> number
;Purpose: to return the area of the given rect structure
(define (rec-area rec)
  ;INVENTORY
  ;(rect-length rec) returns the length of the given rect structure
  ;(rect-width rec) returns the width of the given rect structure
  (* (rect-length rec) (rect-width rec)))

(check-expect (rec-area R1) 200)
(check-expect (rec-area R2) 3000)

;Examples

(define C1 (make-cube 10 10 10))
(define C2 (make-cube 20 20 20))
(define C3 (make-cube 420 420 420))


;cube-area: a fancy cube -> an even fancier number
;Purpose: return the area of the given cube structure
(define (cube-area cube)
  ;INVENTORY
  ;(cube-length cube) returns the length of the given cube structure
  ;(cube-width cube) returns the width of the given cube structure
  ;(cube-height cube) returns the height of the given cube structure
  (* (cube-length cube) (cube-width cube) (cube-height cube)))

(check-expect (cube-area C1) 1000)
(check-expect (cube-area C2) 8000)
(check-expect (cube-area C3) 74088000)

;shape-structure: structure -> string
;Purpose: return whether the structure is a rect or a cube
(define (shape-structure struc)
  ;INVENTORY
  ;(rect? rec)  returns true if the given structure is a rec structure
  ;(cube? cube) returns true if the given structure is a cube structure
  (if (rect? struc) "rect" "cube"))

(check-expect (shape-structure C1) "cube")
(check-expect (shape-structure R1) "rect")










