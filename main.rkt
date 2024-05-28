#lang racket

(load "http-get.rkt")

(define (roundn k n)
  (/ (round (* (expt 10 n) k)) (expt 10 n)))






