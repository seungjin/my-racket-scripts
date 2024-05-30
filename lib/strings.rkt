#lang racket


(define a "ars")

;; (substring "Apple" 1 2)
;; (substring "Apple" 2 -2)
;; (substring "Apple" -2)
;; (substring "Apple" 2)

(define (substring str start end)

  ;; (string->list str)
  (cond
    [(equal? start end) (apply string (list (list-ref (string->list str) start)))]
    [(< start end) '()]
    [(< start end) '()])
 )

(provide substring)


(substring "apple" 3 4)

