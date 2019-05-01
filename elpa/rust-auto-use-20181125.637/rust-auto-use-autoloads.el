;;; rust-auto-use-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "rust-auto-use" "rust-auto-use.el" (0 0 0 0))
;;; Generated autoloads from rust-auto-use.el

(autoload 'rust-auto-use "rust-auto-use" "\
Attempts to insert a required `use` statement for the symbol at point.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "rust-auto-use" '("rust-auto-use-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; rust-auto-use-autoloads.el ends here
