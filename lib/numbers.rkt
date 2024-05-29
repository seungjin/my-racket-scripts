#lang racket


  (define (roundn k n)
    (/ (round (* (expt 10 n) k)) (expt 10 n)))

  (provide roundn)




