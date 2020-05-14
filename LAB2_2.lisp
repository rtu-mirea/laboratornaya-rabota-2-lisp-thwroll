;;Путь к файлу
(defun FilePath()
    `("test.txt")
)

(defun show_file (path)
    (let ((in (open path :if-does-not-exist nil)))
        (when in
            (loop for line = (read-line in nil)
            while line do (format t "~a~%" line))
            (close in)
         )
     )
)

;;Вывод пути к файлу
(format t "~a~%" (FilePath))

 (set `N (FilePath))

;;Вывод содержимого файла
(show_file N)
