(defun game-repl ()
  (let ((cmd (game-read)))
    (unless (eq (car cmd) 'quit)
      (game-print (game-eval cmd))
      (game-repl))))


(defun game-read ()
  (let ((cmd (read-from-string (
          (concatenate 'string "(" (read-line) ")"))))
        (flet ((quote-it (x)
          (list 'quote x)))
          (cons (car cmd) (mapcar #'quote-it (cdr cmd)))
        )
      )
  )
)