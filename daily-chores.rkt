#lang racket

(require racket/system)
(require gregor)

(define output-str (with-output-to-string (λ () (system "systemctl --user show daily-chores.service"))))

(define (remove-timestamp time_str)
  (string-join (reverse (rest (reverse (string-split(first time_str) " " #:trim? #t #:repeat? #t)))))
  )

(define now (current-seconds))

(define (time-str->epoch time-str)
  (define parsed_time (parse-datetime time-str "E yyyy-MM-dd HH:mm:ss"))
  (->posix parsed_time)
)

(define (run-daily-chores)
  (println "Runs daily-chores.service")
  (system "systemctl --user start daily-chores.service")
)

(define (foo val)
  (define ago (- (time-str->epoch (remove-timestamp val)) (current-seconds)))
  (if (> ago  (* 60 60 24))
      (run-daily-chores)
      (println "nothing to do")
  )
)

(for ([e (in-list (string-split output-str "\n" #:trim? #t #:repeat? #t))])
  (define key (first (string-split e "=" #:trim? #t #:repeat? #f)))
  (define val (rest (string-split e "=" #:trim? #t #:repeat? #f)))
 
  (if (equal? key "ExecMainExitTimestamp")
      (foo val)
      '()
  )
    
)

;; raco exe -o daily-chores-checker ./daily-chores.rkt






