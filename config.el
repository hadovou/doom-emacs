(setq
 user-full-name "Hamid Davoudkhani"
 user-mail-address "h.davoudkhani@gmail.com"

 org-directory "/Users/hamid/Documents/org_folder"

 )

    ;; insert a new line
   (map!
     (:after evil
      :m  "] SPC" #'evil-motion-insert-newline-below
      :m  "[ SPC" #'evil-motion-insert-newline-above
      ))

(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

(add-to-list 'initial-frame-alist '(fullscreen . maximized))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq
;; Resize the frame pixelwise. Making emacs compatible with tiling window  managers
 frame-resize-pixelwise t
 doom-font (font-spec :family "Iosevka SS04" :size 15)
 doom-big-font (font-spec :family "Iosevka Term" :size 22)
 doom-variable-pitch-font (font-spec :family "Iosevka Term" :size 14)
 doom-theme 'doom-dracula
 ;; relative line numbers
 display-line-numbers-type 'relative
 global-prettify-symbols-mode  t
 )
(custom-set-variables
'(display-time-mode t)
;;cool feature to show where the  curser is when it jump
'(beacon-mode 1)
)

(setq projectile-project-search-path '("/Users/hamid/Documents/Dissertation/"
                                       "/Users/hamid/Documents/Term 2 Materials"
                                       "/Users/hamid/Documents/Term 1 material"
                                       org-directory))

;;(add-hook! 'org-mode-hook #'+org-pretty-mode)
(setq
 org-agenda-files '("/Users/hamid/Documents/org_folder/CommandSummary.org"
                    "/Users/hamid/Documents/Dissertation/summary_notes.org"
                    "/Users/hamid/Documents/org_folder/todo.org")
 org-journal-dir (concat  org-directory "/journal")

 ;; prompt to record time and note when a task is completed
 org-log-done 'time
 org-fontify-done-headline t
 org-fontify-quote-and-verse-blocks t
 org-fontify-whole-heading-line t
 org-ellipsis " ▾"
 org-superstar-headline-bullets-list '("⁖" "◉" "○" "◈" "◇" "▣" "■" "□")
 org-fancy-priorities-list '("URGNT" "HIGH" "LOW" )
;; org-fancy-priorities-list '("⚡" "⬆" "⬇" "☕")
 ;; org journal config
 org-journal-file-format "Journal-%F.org"
 org-journal-date-prefix "#+TITLE: "
 org-journal-date-format "%a, %Y-%B-%d"
 org-journal-time-prefix "* "
 org-journal-time-format "%I:%M %p  "


 )
;; (after! org
;; (set-face-attribute 'org-level-1 nil
;;                       :background nil
;;                       :height 1.4
;;                       :weight 'normal)
;;   (set-face-attribute 'org-level-2 nil
;;                       :background nil
;;                       :height 1.2
;;                       :weight 'normal)
;;   (set-face-attribute 'org-document-title nil
;;                       :background nil
;;                       :height 1.75
;;                       :weight 'bold)
;;  )

(setq
 deft-directory   "/Users/hamid/Documents/org_folder"
 deft-extensions '("txt" "md" "rmd" "r" "org" "tex")
 deft-recursive t
 )

;; latex configuration
(setq +latex-viewers '(pdf-tools))
(setq reftex-default-bibliography "/Users/hamid/Documents/org_folder/Bibliography/library.bib")
(setq bibtex-dialect 'BibTeX)
;;latex compilation commands
(setq org-latex-pdf-process (list "latexmk -shell-escape -bibtex -f -pdf %f"))
;; org-ref configuration
(use-package! org-ref
  :after org

  ;; :commands (org-ref-bibtex-next-entry
  ;;            org-ref-bibtex-previous-entry
  ;;            doi-utils-get-bibtex-entry-pdf
  ;;            org-ref-ivy-insert-cite-link
  ;;            org-ref-find-bibliography
  ;;            org-ref-open-in-browser
  ;;            org-ref-open-bibtex-notes
  ;;            org-ref-open-bibtex-pdf
  ;;            org-ref-bibtex-hydra/body
  ;;            org-ref-bibtex-hydra/org-ref-bibtex-new-entry/body-and-exit
  ;;            org-ref-sort-bibtex-entry
  ;;            arxiv-add-bibtex-entry
  ;;            arxiv-get-pdf-add-bibtex-entry
  ;;            doi-utils-add-bibtex-entry-from-doi
  ;;            isbn-to-bibtex
  ;;            pubmed-insert-bibtex-from-pmid)
 :init
  ;;(when (featurep! :completion helm)
 (setq org-ref-completion-library 'org-ref-helm-bibtex)
 ;;)
  ;;(when (featurep! :completion ivy)
    ;;(setq org-ref-completion-library 'org-ref-ivy-cite))
  :config
  (setq
   org-ref-default-bibliography "/Users/hamid/Documents/org_folder/Bibliography/library.bib"
                                        ;org-ref-pdf-directory "/Users/hamid/Documents/Mendeley Desktop/"
   org-ref-bibliography-notes "/Users/hamid/Documents/org_folder/roam"
   ;; org-ref-note-title-format "* TODO %y - %t\n :PROPERTIES:\n :Custom_ID: %k\n  :NOTER_DOCUMENT: %F\n :ROAM_KEY: cite:%k\n :AUTHOR: %9a\n  :JOURNAL: %ags doi url journal booktitlej\n  :YEAR: %y\n  :VOLUME: %v\n :PAGES: %p\n  :DOI: %D\n  :URL: %U\n :END:\n\n"

   ))

(use-package! helm-bibtex)

(use-package! bibtex-completion
  :config
  (setq bibtex-completion-bibliography '("/Users/hamid/Documents/org_folder/Bibliography/library.bib")
        bibtex-completion-notes-path "/Users/hamid/Documents/org_folder/roam"
        bibtex-completion-additional-search-fields '(doi author title)
        bibtex-completion-pdf-symbol "✔"
        bibtex-completion-pdf-field "file")
;; (setq bibtex-completion-format-citation-functions
;;   '((org-mode      . bibtex-completion-format-citation-org-cite)
;;     (latex-mode    . bibtex-completion-format-citation-cite)
;;     (markdown-mode . bibtex-completion-format-citation-pandoc-citeproc)
;;     (default       . bibtex-completion-format-citation-default)))
  )

;; org-roam v2
;; (after! org-roam
;;   :commands
;;   (org-roam-buffer
;;    org-roam-setup
;;    org-roam-capture
;;    org-roam-node-find)
;;   :config
;;   (require 'org-ref)
;;   (setq
;;    org-roam-directory "/Users/hamid/Documents/org_folder/roam"
;;    org-roam-db-location "/Users/hamid/Documents/org_folder/roam/db/org-roam.db"
;;    org-roam-buffer-window-parameters '((no-delete-other-windows . t))
;;    org-roam-link-use-custom-faces 'everywhere
;;    org-roam-completion-everywhere t
;;    org-roam-completion-system
;;    (cond ((featurep! :completion helm) 'helm)
;;          ((featurep! :completion ivy) 'ivy)
;;          ((featurep! :completion ido) 'ido)
;;          ('default))
;;    ))
;; (add-to-list 'display-buffer-alist
;;              '("\\*org-roam\\*"
;;                (display-buffer-in-side-window)
;;                (side . right)
;;                (slot . 0)
;;                (window-width . 0.33)
;;                (file . find-file-other-window)
;;                ;(window-parameters . ((no-other-window . t)
;;                                    ;  ))

;; ))
;; (setq org-roam-mode-section-functions
;;       (list #'org-roam-backlinks-section
;;             #'org-roam-reflinks-section
;;             ;; #'org-roam-unlinked-references-section
;;             ))
;; (global-set-key (kbd "C-c n r") #'org-roam-buffer-toggle)
;; (global-set-key (kbd "C-c n i") #'org-roam-node-insert)
;; (global-set-key (kbd "C-c n f") #'org-roam-buffer-display-dedicated)
;; (global-set-key (kbd "C-c n c") #'org-roam-capture)
;; (global-set-key (kbd "C-c n b") #'org-roam-bibtex-mode)
;; (global-set-key (kbd "C-c n s") #'org-roam-db-sync)

;; (use-package! org-roam-protocol
;;   :after org-protocol)
;; (setq org-roam-v2-ack t)

(setq pdf-view-resize-factor 1.1)
(use-package! org-noter
  :config
  ;; Your org-noter config ........
  (setq org-noter-notes-search-path '("/Users/hamid/Documents/org_folder/roam"))
  (require 'org-noter-pdftools))

(use-package! org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(use-package! org-noter-pdftools
  :after org-noter
  :config
  ;; Add a function to ensure precise note is inserted
  (defun org-noter-pdftools-insert-precise-note (&optional toggle-no-questions)
    (interactive "P")
    (org-noter--with-valid-session
     (let ((org-noter-insert-note-no-questions (if toggle-no-questions
                                                   (not org-noter-insert-note-no-questions)
                                                 org-noter-insert-note-no-questions))
           (org-pdftools-use-isearch-link t)
           (org-pdftools-use-freestyle-annot t))
       (org-noter-insert-note (org-noter--get-precise-info)))))

  ;; fix https://github.com/weirdNox/org-noter/pull/93/commits/f8349ae7575e599f375de1be6be2d0d5de4e6cbf
  (defun org-noter-set-start-location (&optional arg)
    "When opening a session with this document, go to the current location.
With a prefix ARG, remove start location."
    (interactive "P")
    (org-noter--with-valid-session
     (let ((inhibit-read-only t)
           (ast (org-noter--parse-root))
           (location (org-noter--doc-approx-location (when (called-interactively-p 'any) 'interactive))))
       (with-current-buffer (org-noter--session-notes-buffer session)
         (org-with-wide-buffer
          (goto-char (org-element-property :begin ast))
          (if arg
              (org-entry-delete nil org-noter-property-note-location)
            (org-entry-put nil org-noter-property-note-location
                           (org-noter--pretty-print-location location))))))))
  (with-eval-after-load 'pdf-annot
    (add-hook 'pdf-annot-activate-handler-functions #'org-noter-pdftools-jump-to-note)))

(use-package! org-roam-bibtex
  :after (org-roam)
  :hook (org-roam-mode . org-roam-bibtex-mode)
  :config
(setq orb-preformat-keywords
      '(("citekey" . "=key=") "title" "url" "file" "author-or-editor" "keywords")
      orb-process-file-keyword t
      orb-file-field-extensions '("pdf"))

(setq org-roam-capture-templates
      '(("r" "bibliography reference" plain
         (file "/Users/hamid/.doom.d/orb-template.org")
         :if-new
         (file+head "references/${citekey}.org" "#+title: ${title}\n")))))

(use-package! org-roam-server
  :bind (:map org-roam-mode-map
         (("C-c m G" . org-roam-server-mode)))
  :config
  (setq org-roam-server-host "127.0.0.1"
        org-roam-server-port 8080
        org-roam-server-export-inline-images t
        org-roam-server-authenticate nil
        org-roam-server-network-poll t
        org-roam-server-network-arrows nil
        org-roam-server-network-label-truncate t
        org-roam-server-network-label-truncate-length 60
        org-roam-server-network-label-wrap-length 20))

(setq mac-command-modifier      'meta
      ns-command-modifier       'meta
      mac-option-modifier       'super
      ns-option-modifier        'super
      mac-right-option-modifier 'alt
      ns-right-option-modifier  'alt)

(after! undo-tree
  (setq undo-tree-auto-save-history nil))
