
;;Исходный список
(defun tst_lst()
    `(122 3 66 -10 0 15 69 232 485)
    )

;;Вставка эл-та
(defun insNode (lst num elt)
  (if (zerop num) (return-from insNode (cons elt lst)))
  (rplacd (nthcdr (- num 1) lst) (cons elt (nthcdr num lst)))
  lst)

;;Удаление эл-та
(defun rmNode (lst &optional (n x))
  (cond ((zerop n) (cdr lst))
        (t (cons (car lst) (rmNode (cdr lst) (- n 1))))))
  
;;Поиск эл-та
;;(defun findNode (x s)
;;   (cond ((null s) nil)
;;         ((equal x (car s)) 0)
;;         (t (+ 1 (findNode x (cdr s))))))

;;Поиск эл-та (исправленный)
(defun findNode(x s position)
    (cond ((eq s nil) "Элемент не найден")
          ((= x (car s)) position)
          (T (findNode x (cdr s) (+ position 1)))
))


;;Вывод данных
(format t "Исходный список:                         ~a~%" (tst_lst))
 
(format t "Список после вставки '33' после 5 эл-та: ~a~%" (insNode  (tst_lst) 5 33))
 
(format t "Список после удаления '-10':             ~a~%" (rmNode (tst_lst) 3))

;;(format t "Индекс элемента 232:                     ~a~%" (findNode 2 (tst_lst))) 

(format t "Результат поиска элемента 69:            ~a~%" (findNode 69 (tst_lst) 0))
(format t "Результат поиска элемента 669:           ~a~%" (findNode 669 (tst_lst) 0))
