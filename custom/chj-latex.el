;; Latex Path setup

;; Auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq reftex-plug-into-AUCTeX t)
(setq TeX-PDF-mode t)

;; TexMode Hooks
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)  ; with AUCTeX LaTeX mode
(add-hook 'pandoc-mode-hook 'turn-on-reftec) ; with Pandoc Mode

;; Make RefTeX faster
(setq reftex-enable-partial-scans t)
(setq regtex-save-parse-info t)
(setq reftex-use-multipel-selection-buffers t)
(setq reftex-plug-into-AUCTeX t)

(defun org-mode-reftex-setup ()
  (load-library "reftex")
  (and (buffer-file-name)
       (file-exists-p (buffer-file-name))
       (reftex-parse-all))
  (define-key org-mode-map (kbd "C-c (") 'refte-citation))

;; RefTex formats for biblatex (not natbib), and for pandoc
(setq reftex-cite-format
      '(
        (?\C-m . "\\cite[]{%l}")
        (?t    . "\\texcite{%l}")
        (?a    . "\\autocite[]{%l}")
        (?p    . "\\parencite{%l}")
        (?f    . "\\footcite[][]{%l}")
        (?F    . "\\fullcite[]{%l}")
        (?P    . "[@%l]")
        (?T    . "@%l [p. ]")
        (?x    . "[]{%l}")
        (?X    . "{%l}")
))

(setq font-latex-match-reference-keywords
      '(("cite" "[{")
        ("cites" "[{}]")
        ("footcite" "[{")
        ("footcites" "[{")
        ("parencite" "[{")
        ("textcite" "[{")
        ("fullcite" "[{") 
        ("citetitle" "[{") 
        ("citetitles" "[{") 
        ("headlessfullcite" "[{")))

(setq reftex-cite-prompt-optional-args nil)
(setq reftex-cite-cleanup-optional-args t)

;; Configure ebib
;; ebib is a bibtex db mananger that works inside Emacs. It can talk to
;; org-mode.  When ebib is loaded, you can run it with M-x ebib

;; (autoload 'ebib "ebib" "Ebib, a BibTeX database manager." t)
;; The location of the LaTeX executables is system dependent.  AUCTeX calls everythin through a shell,
;; so you may or may not need this.

;; (setq ebib-preload-bib-files
;;      '("/path/to/bib/files/mybib.bib"))
 ;;(add-hook 'LaTeX-mode-hook #'(lambda ()
;;                               (local-set-key "\C-cb" 'ebib-insert-bibtex-key)))
 


;; Use latexmk for compilation by default
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("latexmk" "latexmk -synctex=1 -shell-escape -pdf %s" TeX-run-TeX nil t 
                                    :help "Process file with latexmk")))
(eval-after-load "tex"
  '(add-to-list 'TeX-command-list '("xelatexmk" "latexmk -synctex=1 -shell-escape -xelatex %s" TeX-run-TeX nil t 
                                    :help "Process file with xelatexmk")))
(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))

;; Use Skim as viewer, enable source <-> PDF sync
;; make latexmk available via C-c C-c
;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
;;(add-hook 'LaTeX-mode-hook (lambda ()
;;  (push
;;    '("latexmk" "latexmk -pdf %s" TeX-run-TeX nil t
;;      :help "Run latexmk on file")
;;    TeX-command-list)))
;;(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
 
;; use Skim as default pdf viewer
;; Skim's displayline is used for forward search (from .tex to .pdf)
;; option -b highlights the current line; option -g opens Skim in the background  
(setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
     '(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b")))


;; Add LaTeX to a list of languages that Org-babel will recognize
;; (require 'ob-latex)
;; (add-to-list 'org-babel-noweb-error-langs "latex")

(provide 'chj-latex)
