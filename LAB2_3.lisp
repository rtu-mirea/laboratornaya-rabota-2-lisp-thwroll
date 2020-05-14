;;Исходный список
(defun tst_lst()
`(6 6 3 0 2 2 2 4 4 5 6 6)
)

(defun comprsf (all i)
    (if (= (nth 1 i) (nth 1 (car all)))
        (append (list (list (+ 1 (nth 0 (car all))) (nth 1 i))) (cdr all))
        (append (list i) all)
    )
)
(defun mapf (i) 
    (list 1 i)
)
(defun unmapf (i) 
    (if (= (nth 0 i) 1)
        (nth 1 i)
        i
    )
)
(defun list_of (cnt item)
    (if (= cnt 0)
        `()
        (cons item (list_of (- cnt 1) item))
    )
)
(defun deccomprsf (all i)
    (append 
        (if (consp i)
            (list_of (nth 0 i) (nth 1 i))
            (list i)
        )
        all
    )
)
;;Функция сжатия списка
(defun compress (lst)
    (map 'list #'unmapf
        (cdr
            (reverse
                (reduce
                    #'comprsf
                    (map 'list #'mapf lst)
                    :initial-value (list(list 1 -1))
                 )
             )
         )
    )
)

;;Функция разжатия списка
(defun decompress (lst)
    (reverse(reduce #'deccomprsf lst :initial-value (list)))
)

;;Вывод данных

(format t "Исходный список:       ~a~%"(tst_lst))

(format t "Сжатый список:         ~a~%"(compress (tst_lst))) 

(format t "Список после разжатия: ~a~%"(decompress (compress (tst_lst))))


