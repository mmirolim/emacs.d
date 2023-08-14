;;; golang --- Summary golang dev config
;;; Commentary:
;;; golang configuration

(require 'go-mode)
(require 'go-guru)
(require 'yasnippet)
(require 'flycheck)
(require 'go-direx)
(require 'company)

;;; Code:
;; TODO should be able to get from ENV but does not work
;;(setenv "GOPATH" "/home/mm/go")
;;(setq exec-path (append exec-path '("/home/mm/go/bin")))


(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; optional - provides fancy overlay information
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :config (progn
            ;; disable inline documentation
            ;; (setq lsp-ui-sideline-enable nil)
            ;; disable showing docs on hover at the top of the window
            (setq lsp-ui-doc-enable nil))
  )

(setq lsp-go-env '((GOFLAGS . "-tags=integration_test,integration_benchmark")))

;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

; kbd to godoc
(add-hook 'go-mode-hook '(lambda ()
	(local-set-key (kbd "C-c C-k") 'godoc)))
; godoc autocomplete
(add-hook 'go-mode-hook 'company-mode)
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
