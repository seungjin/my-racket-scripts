#lang racket

(require aws)
(require aws/s3)
 
(public-key "akid") 
(private-key "secret")
 
(s3-host "nyc3.digitaloceanspaces.com")
(s3-region "nyc3")
(s3-scheme "https")
 
(define bucket+path "unixcasts/10.mp4")
(define method "GET")
(define expires 900)
(sign-uri bucket+path method expires '())
