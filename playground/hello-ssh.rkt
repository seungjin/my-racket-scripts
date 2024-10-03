#lang racket

(require remote-shell/ssh)

(define myhost (remote #:host "2.sel.dev.seungjin.net"))

(ssh myhost "uname -a")
(ssh myhost "uptime")

(scp myhost (string->path "/tmp/foo.txt") (at-remote myhost "foo.txt"))



;; get racket
;; https://download.racket-lang.org/releases/8.13/installers/racket-minimal-8.13-x86_64-linux-cs.sh
;; SHA256: f73a5a1f4c3d5ef77f401d1e2e3f3294ad7d9075ff6fe8a16489c1eee91cd81c

;; 
;; send 

