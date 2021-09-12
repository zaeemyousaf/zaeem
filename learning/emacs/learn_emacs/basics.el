;;arithmatic operators
(+ 2 2); 2+2
(- 7 2); 7-2
(* 7 2); 7*2
(/ 8 3); 8/3

;; while loop
(setq i 0); i=0
(while (< i 10)
  ;; while i < 10
  (princ (format "the squre of %d is %d\n" i (* i i)))
  (setq i (+ i 1)); i = i+1
  )

;; setting variable
(setq x 10)
;; define function
(defun add(a b)
  (+ a b))

;; install emacs manual 
sudo apt-get install emacs-common-non-dfsg
;; lambda and add-hook
(add-hook 'c-mode-common-hook
  (lambda() 
    (local-set-key  (kbd "C-c o") 'ff-find-other-file)))
