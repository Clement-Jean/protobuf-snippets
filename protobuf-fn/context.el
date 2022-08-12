(defun protobuf-in-class(keyword)
	(cond
		; check if keyword is not in c-class-decl-kwds
		; in this case return null
		((not (member keyword (c-lang-const c-class-decl-kwds))) nil)
  	; otherwise
  	(t (setq paren-state (c-parse-state))
  		 (setq least-enclosing (c-least-enclosing-brace paren-state))

			 (cond (least-enclosing ; if found a block
				(goto-char (car paren-state)) ; go to parent scope
				(c-beginning-of-decl-1) ; go to the beginning of declaration
				(looking-at keyword)) ; check if we are looking at $keyword
				(t nil))))) ; otherwise nil