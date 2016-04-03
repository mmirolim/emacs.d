(add-to-list 'load-path "/home/me/.emacs.d/elpa/elm-mode-20141202.916/")
(require 'elm-mode)
(setenv "PATH" (concat (getenv "PATH") ":~/.cabal/bin"))
(setq exec-path (append exec-path '("~/.cabal/bin"))
