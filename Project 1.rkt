;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |Project 1|) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp")) #f)))
(define-struct editor [pre post])
; An Editor is a structure:
;   (make-editor String String)
; interpretation (make-editor s t) describes an editor
; whose visible text is (string-append s t) with 
; the cursor displayed between s and t

(define ed1 (make-editor "hello" "world"))

;TEMPLATES
;fon-editor: editor -> ???
;Purpose: ???
#;(define (fon-editor  ed)
    ;INVENTORY:
    ;(editor-pre ed): editor-pre is the pre of the editor
    ;(editor-post ed): editor-post is the post of the editor
    ())

;CONSTANTS:
(define e-scene (empty-scene 200 40))
(define cursor (rectangle 3 40 'solid 'red))


;Render: editor -> image
;Purpose: takes in a editor to produce an image

(define (render ed)
  ;INVENTORY:
  ;(editor-pre ed): editor-pre is the pre of the editor
  ;(editor-post ed): editor-post is the post of the editor
  (overlay/align "left" "center"
                 (beside(text (editor-pre ed) 16 "black")
                        cursor (text (editor-post ed) 16 'black))
                 e-scene))

(check-expect (render ed1) (overlay/align "left" "center"
                                          (beside(text "hello" 16 'black)
                                                 cursor (text "world" 16 'black))
                                          e-scene))


;Edit: editor key -> editor
;Purpose: to receive inputs and output a editor

(define (edit ed key)
  (cond [(key=? key "left") (move-left ed)]
        [(key=? key "right") (move-right ed)]
        [(key=? key "\b") (move-back ed)]
        [(key=? key "\t") ed]
        [(key=? key "\r") ed]
        [(= (string-length key) 1) (add-let ed key)]
        [else ed]))
         
  

(check-expect (edit ed1 "\b") (make-editor "hell" "world"))
(check-expect (edit ed1 "\t") (make-editor "hello" "world"))
(check-expect (edit ed1 "\r") (make-editor "hello" "world"))
(check-expect (edit ed1 "left") (make-editor "hell" "oworld"))
(check-expect (edit ed1 "right") (make-editor "hellow" "orld"))
(check-expect (edit ed1 "up") (make-editor "hello" "world"))
(check-expect (edit ed1 "a") (make-editor "helloa" "world"))

;move-left: editor -> editor
;Purpose: moving cursor to left

(define (move-left ed)
  (make-editor (string-remove-last (editor-pre ed))
               (string-append (string-last (editor-pre ed))
               (editor-post ed))))

(check-expect (move-left ed1) (make-editor "hell" "oworld"))

;move-right: editor -> editor
;Pupose: moving cursor to right

(define (move-right ed)
  (make-editor (string-append (editor-pre ed) (string-first (editor-post ed)))
               (string-rest (editor-post ed))))

(check-expect (move-right ed1) (make-editor "hellow" "orld"))

;move-back: editor -> editor
;Purpose: moving cursor back and deleting the character behind the cursor

(define (move-back ed)
  (make-editor (string-remove-last (editor-pre ed))
               (editor-post ed)))


(check-expect (move-back ed1) (make-editor "hell" "world"))

;add-let: editor key -> editor
;Purpose: add a letter at the given cursor position

(define (add-let ed key)
  (make-editor (string-append (editor-pre ed) key)
               (editor-post ed)))


(check-expect (add-let ed1 "a") (make-editor "helloa" "world"))


;string-remove-last: string number -> string
;Purpose: Deletes given position from the given string
(define (string-remove-last str)
   (substring str 0 (sub1 (string-length str))))

(check-expect (string-remove-last "car") "ca")
(check-expect (string-remove-last "truck") "truc")
(check-expect (string-remove-last "steering") "steerin")

;string-last: string -> 1String
;Purpose: taking last letter from the given string

(define (string-last s7)
  (string-ith s7 (- (string-length s7) 1)))

(check-expect (string-last "POGGERS") "S")
(check-expect (string-last "omegalul") "l")
(check-expect (string-last "xqcL") "L")

;string-rest: string number -> string
;Purpose: Deletes given position from the given string

(define (string-rest str)
   (substring str 1))


(check-expect (string-rest "bottle") "ottle")
(check-expect (string-rest "clock") "lock")
(check-expect (string-rest "cluck") "luck")

;string-first: string -> 1String
;Purpose: taking first letter from the given string

(define (string-first s1)
  (string-ith s1 0))

(check-expect (string-first "hello") "h")
(check-expect (string-first "Pog") "P")
(check-expect (string-first "-ed") "-")


;run: editor -> editor
;Purpose: to run the editor

(define (run ed)
  (big-bang ed
    (to-draw render)
    (on-key edit)))














