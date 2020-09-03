;;; c_cpp --- Summary c/c++ dev config
;;; Commentary:
;;; clang configuration

(require 'cc-mode)
(require 'lsp-mode)
(require 'lsp-ui)
(require 'ccls)
(require 'use-package)

(use-package lsp-mode
  :commands lsp
  :ensure t
  :custom
  (lsp-prefer-flymake t))

(use-package lsp-ui
  :commands lsp-ui-mode
  :ensure t
  :custom
  (lsp-ui-flycheck-enable nil)
    (lsp-ui-sideline-enable nil)
    (lsp-ui-imenu-enable t)
    (lsp-ui-imenu-kind-position 'top))

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "ccls")
  (setq lsp-prefer-flymake nil)
  (setq-default flycheck-disabled-checkers '(c/c++-clang c/c++-cppcheck c/c++-gcc))
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp) (yas-minor-mode 1))))
;;; c_cpp.el ends here
