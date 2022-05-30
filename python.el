;;; python --- dev config
;;; Commentary:
;;;
;;; https://www.mattduck.com/lsp-python-getting-started.html

(require 'lsp-mode)
(require 'lsp-ui)
(require 'ccls)
(require 'use-package)


(use-package lsp-mode
  :commands lsp
  :ensure t
  :hook ((python-mode . lsp))
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

;;; python ends here
