#lang racket

(require db)

(sqlite3-connect #:database "/tmp/my.db")
