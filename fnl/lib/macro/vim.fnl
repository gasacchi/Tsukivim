(fn set! [opt value]
	"Set editor options (behave like :set). Invalid options is an error."
	`(tset vim.o ,opt ,value))

(fn set-global! [opt value]
	"Set an options. Invalid options is an error."
	`(tset vim.go ,opt ,value))
	
(fn let-global! [opt value]
    "Set global variable (behave like let:g in vimscript)"
    `(tset vim.g ,opt ,value))

(fn set-buffer! [opt value]
	"Set buffer scoped options. Invalid options is an error."
	`(tset vim.bo ,opt ,value))

(fn set-window! [opt value]
	"Set window scoped options. Invalid options is an error."
	`(tset vim.wo ,opt ,value))
(fn run! [cmd]
  "Accept string and run as vim command" 
	`(vim.cmd ,cmd))


{ : set!
  : set-global!
  : set-buffer!
  : set-window!
  : let-global!
	: run!}
