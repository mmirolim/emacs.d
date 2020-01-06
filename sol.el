;;; Solidity configuration
;;; https://github.com/ethereum/emacs-solidity
(require 'solidity-mode)
(require 'company-solidity)
(require 'solidity-flycheck)
(setq solidity-flycheck-solc-checker-active t)
(setq solidity-flycheck-solium-checker-active t)
(add-hook 'solidity-mode-hook
	(lambda ()
	(set (make-local-variable 'company-backends)
		(append '((company-solidity company-capf company-dabbrev-code))
			company-backends))))
;;; sol ends here
