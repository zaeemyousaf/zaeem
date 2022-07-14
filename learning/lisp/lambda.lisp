;; for clisp
;; make an object of circle
;; constructor (dispatcher)
;; can modifiy its radius
;; getArea
;; getPerimeter

(defun circle (&optional (r 0))
  (let (
	(radius r))
    (labels (
	     (modifiy-radius (r)
			     (setf radius r))
	     (get-radius ()
			 radius)
	     (getArea ()
		      (* 3.142 (* radius radius)))
	     (getPerimeter ()
			   (* 2 (* 3.142 radius)))
	     (get-description ()
			      (format t "the area of circle with radius ~A is ~A~%"
				      radius (getArea))
			      (format t "the perimeter of circle with radius ~A is ~A~%"
				      radius (getPerimeter))
			      (format t "=========================~%")
			      )
	     );; end of let block
	    
	    (lambda (method &optional r)
	      (cond
	       ((equalp method 'modifiy-radius)
		(modifiy-radius r))
	       ((equalp method 'getArea)
		(getArea))
	       ((equalp method 'getPerimeter)
		(getPerimeter))
	       ((equalp method 'get-radius)
		(get-radius))
	       ((equalp method 'get-description)
		(get-description))
	       (t(format t "wrong method")))))))

(defmacro modifiy-radius (circle r)
  `(funcall ,circle 'modifiy-radius ,r))

(defmacro get-description (circle)
  `(funcall ,circle 'get-description))

(defvar c1 (circle)) ;; dispather
(modifiy-radius c1 1)
(get-description c1)

(defvar c2 (circle 2))
(get-description c2)

