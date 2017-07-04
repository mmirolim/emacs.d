;;; golang --- Summary golang dev config
;;; Commentary:
;;; golang configuration

(require 'go-mode)
(require 'go-guru)
(require 'go-eldoc)
(require 'yasnippet)
(require 'flycheck)
(require 'go-direx)

;;; Code:
;; TODO should be able to get from ENV but does not work
(setenv "GOPATH" "/home/me/go")
(setq exec-path (append exec-path '("/home/me/go/bin")))

;; Goflymake
;; TODO remove using flycheck
;;(add-to-list 'load-path (concat (getenv "GOPATH") "/src/github.com/dougm/goflymake"))
;;(require 'go-flymake)
; Golint
(add-to-list 'load-path (concat (getenv "GOPATH")
"/src/github.com/golang/lint/misc/emacs"))
(require 'golint)
(defun my-go-mode-hook ()
	;; Use goimports instead of go-fmt
	(setq gofmt-command "goimports")
	;; Call gofmt before saving
	(add-hook 'before-save-hook 'gofmt-before-save)
	;; Customize compile command to run go build
	(if (not (string-match "go" compile-command))
		(set (make-local-variable 'compile-command)
			;; "go build -v && go test -v"))
			;; go vet not working
			"go build -v && go test -v && go vet"))
	;; Godef jump key binding
	(local-set-key (kbd "M-.") 'godef-jump))

(add-hook 'go-mode-hook 'my-go-mode-hook)
; kbd to godoc
(add-hook 'go-mode-hook '(lambda ()
	(local-set-key (kbd "C-c C-k") 'godoc)))
; godoc autocomplete
(add-hook 'go-mode-hook 'company-mode)
(add-hook 'go-mode-hook (lambda ()
	(set (make-local-variable 'company-backends) '(company-go))
	(company-mode)))
(add-hook 'go-mode-hook 'go-eldoc-setup)
(setq company-tooltip-limit 20)                      ; bigger popup window
(setq company-idle-delay .3)                         ; decrease delay before autocompletion popup shows
(setq company-echo-delay 0)                          ; remove annoying blinking
(setq company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
(yas-reload-all)
(add-hook 'go-mode-hook 'yas-minor-mode)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; flycheck configuration
(setq flycheck-gometalinter-vendor t)
;;; go.el ends here
