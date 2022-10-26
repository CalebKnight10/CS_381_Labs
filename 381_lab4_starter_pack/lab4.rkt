#lang racket
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;     CS 381 - Programming Lab #4	;
;					;
;  < Caleb Knight >			;
;  < knightca@oregonstate.edu >	        ;
;					;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; your code here

(define (member? e lst)
  (cond
    [(null? lst) #f] ;; Check if the list is empty and return false
    [(equal? e (car lst)) #t] ;; Check if the element is the same as the first element
    [else (member? e (cdr lst))] ;; Recursively check the rest of the list
    )
  )
 

(define (set? lst)
  (cond
    [(null? lst) #t] ;; If the list is null, it is a valid set
    [(member? (car lst) (cdr lst)) #f] ;; If there is a member? in the set, then it is false
    [else (set? (cdr lst))] ;; Recursively check the remainder of the list, knocking off the prev element each time
    )
)

(define (union lst1 lst2)
  (cond
    [(empty? lst1) lst2] ;; If lst1 is empty, then return lst2
    [(member? (car lst1) lst2) (union (cdr lst1) lst2)] ;; Check to see if the first element of lst 1 is a dup of lst2, if so call union with the remainder of lst1 and discard the dup from lst1
    [else (append (list (car lst1)) (union (cdr lst1) lst2))] ;; Create a list out of the curr element from lst1 and append it to lst2 and recursively call union to repeat this until we hit base case
    )
  )

(define (intersect lst1 lst2)
  (cond
    [(empty? lst1) lst1] ;; Check if the first list is empty, if it is, return that since we want to compare based on lst1
    [(member? (car lst1) lst2) (append (list (car lst1)) (intersect (cdr lst1) lst2))] ;; Check if the first element of lst1 is in lst2, if so, essentially hold that element to append to the list and go through function with the leftovers from lst1
    [else (intersect (cdr lst1) lst2)] ;; The element didn't match in both lists so restart with next element
    )
  )

(define (difference lst1 lst2)
  (cond
    [(empty? lst1) lst1] ;; If the lst1 is empty, then we want to return that
    [(member? (car lst1) lst2) (difference (cdr lst1) lst2)] ;; Check to see if the first element of lst1 is in lst2, if so start over with the rest of lst1
    [else (append (list (car lst1)) (difference (cdr lst1) lst2))] ;; If the element isn't in lst2, we are going to append it and recurse through until all elements have been checked.  Appending each element in reverse order to lst2
    )
  )

;;;;;;;;;;;;;;;;;
;  DO NOT EDIT  ;
;;;;;;;;;;;;;;;;;
; enables testing via piping in stdin
(define-namespace-anchor anc)
(define ns (namespace-anchor->namespace anc))
(let loop ()
  (define line (read-line (current-input-port) 'any))
  (if (eof-object? line)
    (display "")
    (begin (print (eval (read (open-input-string line)) ns)) (newline) (loop))))