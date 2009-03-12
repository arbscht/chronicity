(cl:in-package #:chronicity-repeater-test)

(define-test week-next-future
  (let* ((now (make-datetime 2006 8 16 14))
         (weeks (create-tag 'repeater-week :week :now now))
         (next-week))

    (setf next-week (r-next weeks :future))
    (assert-datetime= (make-datetime 2006 8 20) (span-start next-week))
    (assert-datetime= (make-datetime 2006 8 27) (span-end next-week))

    (setf next-week (r-next weeks :future))
    (assert-datetime= (make-datetime 2006 8 27) (span-start next-week))
    (assert-datetime= (make-datetime 2006 9 3) (span-end next-week))))

(define-test week-next-past
  (let* ((now (make-datetime 2006 8 16 14))
         (weeks (create-tag 'repeater-week :week :now now))
         (next-week))

    (setf next-week (r-next weeks :past))
    (assert-datetime= (make-datetime 2006 8 6) (span-start next-week))
    (assert-datetime= (make-datetime 2006 8 13) (span-end next-week))

    (setf next-week (r-next weeks :past))
    (assert-datetime= (make-datetime 2006 7 30) (span-start next-week))
    (assert-datetime= (make-datetime 2006 8 6) (span-end next-week))))

(define-test week-this-future
  (let* ((now (make-datetime 2006 8 16 14))
         (weeks (create-tag 'repeater-week :week :now now))
         (this-week))

    (setf this-week (r-this weeks :future))
    (assert-datetime= (make-datetime 2006 8 16 15) (span-start this-week))
    (assert-datetime= (make-datetime 2006 8 20) (span-end this-week))))

(define-test week-this-past
  (let* ((now (make-datetime 2006 8 16 14))
         (weeks (create-tag 'repeater-week :week :now now))
         (this-week))

    (setf this-week (r-this weeks :past))
    (assert-datetime= (make-datetime 2006 8 13 0) (span-start this-week))
    (assert-datetime= (make-datetime 2006 8 16 14) (span-end this-week))))

(define-test week-offset
  (let* ((now (make-datetime 2006 8 16 14))
         (span (make-span now (datetime-1+ now :sec)))
         (offset-span (r-offset (create-tag 'repeater-week :week)
                                span 3 :future)))
    (assert-datetime= (make-datetime 2006 9 6 14) (span-start offset-span))
    (assert-datetime= (make-datetime 2006 9 6 14 0 1) (span-end offset-span))))





