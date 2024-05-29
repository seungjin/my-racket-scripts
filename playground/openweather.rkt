#lang racket

(require net/http-client json)
(require json/format/simple)
(require math/flonum)

(define apikey (getenv "OPENWEATHERMAP_API"))

(define (weather city_name)
  (define-values (status header response)
                 (http-sendrecv "api.openweathermap.org"
                 (format "/data/2.5/weather?q=~a&appid=~a" city_name apikey)
                 #:method #"GET" 
                 #:ssl? #t
                 ))
  (define data (read-json response))
  ;;(pretty-print-jsexpr data)
  data
)

(define (temp city_name)
  (define w (weather city_name))
  (define temp (hash-ref (hash-ref w 'main) 'temp))
  (define temp_max (hash-ref (hash-ref w 'main) 'temp_max))
  (define temp_min (hash-ref (hash-ref w 'main) 'temp_min))
  (list (kel_to_cel temp_max) (kel_to_cel temp) (kel_to_cel temp_min))
  )

(define (roundn k n)
  (/ (round (* (expt 10 n) k)) (expt 10 n)))

(define (kel_to_cel k)
  ;;  (/ (round (* 100 (- k 273.15))) 100))
  (roundn (- k 273.15) 2))

(temp 'seoul)

