;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs

   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused

   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t

   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()

   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables auto-completion-enable-snippets-in-popup t auto-completion-enable-sort-by-usage t)
     better-defaults
     emacs-lisp
     git
     helm
     lsp
     markdown
     multiple-cursors
     (org :variables
          org-enable-github-support t
          org-enable-org-journal-support t
          org-enable-hugo-support t
          org-enable-reveal-js-support t
          org-enable-roam-support t
          org-want-todo-bindings t)
     (shell :variables
            shell-default-term-shell "/usr/bin/zsh"
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     syntax-checking
     version-control
     treemacs
     ;; Layers I added in
     (latex :variables
            latex-build-command "LaTeX"
            latex-enable-magic nil
            latex-enable-auto-fill nil)
     csv
     pdf
     typescript
     vimscript
     tide
     (javascript :variables
                 javascript-backend 'tide
                 javascript-fmt-tool 'prettier
                 js2-basic-offset 2
                 js-indent-level 2)
     react
     html
     (python :variables python-backend 'lsp python-lsp-server 'pyright)

     )


   ;; List of additional packages that will be installed without being wrapped
   ;; in a layer (generally the packages are installed only and should still be
   ;; loaded using load/require/use-package in the user-config section below in
   ;; this file). If you need some configuration for these packages, then
   ;; consider creating a layer. You can also put the configuration in
   ;; `dotspacemacs/user-config'. To use a local version of a package, use the
   ;; `:location' property: '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      yasnippet-classic-snippets
                                      format-all
                                      org-super-agenda
                                      org-noter
                                      react-snippets
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim

   ;; If non-nil show the version string in the Spacemacs buffer. It will
   ;; appear as (spacemacs version)@(emacs version)
   ;; (default t)
   dotspacemacs-startup-buffer-show-version t

   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official

   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode 'text-mode

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent nil

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)

   ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `doom', `vim-powerline' and `vanilla'. The
   ;; first three are spaceline themes. `doom' is the doom-emacs mode-line.
   ;; `vanilla' is default Emacs mode-line. `custom' is a user defined themes,
   ;; refer to the DOCUMENTATION.org for more info on how to create your own
   ;; spaceline theme. Value can be a symbol or list with additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator nil :separator-scale 1.5)


   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"

   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"

   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"

   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","

   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m" for terminal mode, "<M-return>" for GUI mode).
   ;; Thus M-RET should work as leader key in both GUI and terminal modes.
   ;; C-M-m also should work in terminal mode, but not in GUI mode.
   dotspacemacs-major-mode-emacs-leader-key (if window-system "<M-return>" "C-M-m")

   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1

   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache

   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5

   ;; If non-nil, the paste transient-state is enabled. While enabled, after you
   ;; paste something, pressing `C-j' and `C-k' several times cycles through the
   ;; elements in the `kill-ring'. (default nil)
   dotspacemacs-enable-paste-transient-state nil

   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4

   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers 'visual

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."

  ;; add elpa package archives
  (add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
  )

(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump."
  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; prevent selecting with visual mode
  (fset 'evil-visual-update-x-selection 'ignore)


  ;; https://develop.spacemacs.org/layers/+completion/auto-completion/README.html for nicer looking faces auto-completion
  (custom-set-faces
   '(company-tooltip-common
     ((t (:inherit company-tooltip :weight bold :underline nil))))
   '(company-tooltip-common-selection
     ((t (:inherit company-tooltip-selection :weight bold :underline nil)))))


  (provide 'org-archive-subtree-hierarchical)
  (require 'org-archive)

  (defun org-archive-subtree-hierarchical--line-content-as-string ()
    "Returns the content of the current line as a string"
    (save-excursion
      (beginning-of-line)
      (buffer-substring-no-properties
       (line-beginning-position) (line-end-position))))

  (defun org-archive-subtree-hierarchical--org-child-list ()
    "This function returns all children of a heading as a list. "
    (interactive)
    (save-excursion
      ;; this only works with org-version > 8.0, since in previous
      ;; org-mode versions the function (org-outline-level) returns
      ;; gargabe when the point is not on a heading.
      (if (= (org-outline-level) 0)
          (outline-next-visible-heading 1)
        (org-goto-first-child))
      (let ((child-list (list (org-archive-subtree-hierarchical--line-content-as-string))))
        (while (org-goto-sibling)
          (setq child-list (cons (org-archive-subtree-hierarchical--line-content-as-string) child-list)))
        child-list)))

  ;; org advanced hierarchy archive
  (defun org-archive-subtree-hierarchical--org-struct-subtree ()
    "This function returns the tree structure in which a subtree
  belongs as a list."
    (interactive)
    (let ((archive-tree nil))
      (save-excursion
        (while (org-up-heading-safe)
          (let ((heading
                 (buffer-substring-no-properties
                  (line-beginning-position) (line-end-position))))
            (if (eq archive-tree nil)
                (setq archive-tree (list heading))
              (setq archive-tree (cons heading archive-tree))))))
      archive-tree))

  (defun org-archive-subtree-hierarchical ()
    "This function archives a subtree hierarchical"
    (interactive)
    (let ((org-tree (org-archive-subtree-hierarchical--org-struct-subtree))
          (this-buffer (current-buffer))
          (file (abbreviate-file-name
                 (or (buffer-file-name (buffer-base-buffer))
                     (error "No file associated to buffer")))))
      (save-excursion
        (setq location org-archive-location
              afile (car (org-archive--compute-location
  		                   (or (org-entry-get nil "ARCHIVE" 'inherit) location)))
              ;; heading (org-extract-archive-heading location)
              infile-p (equal file (abbreviate-file-name (or afile ""))))
        (unless afile
          (error "Invalid `org-archive-location'"))
        (if (> (length afile) 0)
            (setq newfile-p (not (file-exists-p afile))
                  visiting (find-buffer-visiting afile)
                  buffer (or visiting (find-file-noselect afile)))
          (setq buffer (current-buffer)))
        (unless buffer
          (error "Cannot access file \"%s\"" afile))
        (org-cut-subtree)
        (set-buffer buffer)
        (org-mode)
        (goto-char (point-min))
        (while (not (equal org-tree nil))
          (let ((child-list (org-archive-subtree-hierarchical--org-child-list)))
            (if (member (car org-tree) child-list)
                (progn
                  (search-forward (car org-tree) nil t)
                  (setq org-tree (cdr org-tree)))
              (progn
                (goto-char (point-max))
                (newline)
                (org-insert-struct org-tree)
                (setq org-tree nil)))))
        (newline)
        (org-yank)
        (when (not (eq this-buffer buffer))
          (save-buffer))
        (message "Subtree archived %s"
                 (concat "in file: " (abbreviate-file-name afile))))))

  (defun org-insert-struct (struct)
    "TODO"
    (interactive)
    (when struct
      (insert (car struct))
      (newline)
      (org-insert-struct (cdr struct))))

  (setq org-archive-default-command #'org-archive-subtree-hierarchical)


  ;; enable word wrapping
  (setq-default word-wrap t)

  ;; latex customization
  (setq-default TeX-engine 'luatex)
  (setq org-latex-listings 'minted
        org-latex-packages-alist '(("" "minted"))
        ;; org-latex-pdf-process
        ;; '("xelatex"
        ;;   "xelatex")
        org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
        )

  ;; Enable koma class
  (with-eval-after-load "ox-latex"
    (add-to-list 'org-latex-classes
                 '("koma-article" "\\documentclass{scrartcl}"
                   ("\\section{%s}" . "\\section*{%s}")
                   ("\\subsection{%s}" . "\\subsection*{%s}")
                   ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                   ("\\paragraph{%s}" . "\\paragraph*{%s}")
                   ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))))

  ;; Set zathura as pdf reader
  (setq TeX-view-program-selection '((output-pdf "Zathura")))


  ;; auto update if buffer changed elsewhere on disk
  (global-auto-revert-mode t)

  ;; auto expand yas snippet if it has auto
  (defun my-yas-try-expanding-auto-snippets ()
    (when (and (boundp 'yas-minor-mode) yas-minor-mode)
      (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
        (yas-expand))))
  (add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)


  ;; Helpful org keybindings
  (spacemacs/set-leader-keys "o l" 'org-store-link)
  (spacemacs/set-leader-keys "o a" 'org-agenda)
  (spacemacs/set-leader-keys "o b" 'org-switchb)
  (spacemacs/set-leader-keys "a o C e" 'org-clock-modify-effort-estimate)
  (spacemacs/set-leader-keys "p i" 'projectile-add-known-project)
  ;; (spacemacs/set-leader-keys "a o j r" (lambda() (interactive) (org-journal-new-entry t)))


  ;; Escape pairs wiht C-l in insert mode
  (define-key evil-insert-state-map (kbd "C-l") 'sp-up-sexp)

  ;; Org pomodoro config
  (use-package org-pomodoro
    :ensure t
    :commands (org-pomodoro)
    :config
    (setq
     alert-user-configuration (quote ((((:category . "org-pomodoro")) libnotify nil)))
     org-pomodoro-length 50
     org-pomodoro-short-break-length 10
     ))

  (defun ruborcalor/org-pomodoro-time ()
    "Return the remaining pomodoro time"
    (if (org-pomodoro-active-p)
        (cl-case org-pomodoro-state
          (:pomodoro
           (format "Pomo: %d minutes - %s" (/ (org-pomodoro-remaining-seconds) 60) org-clock-heading))
          (:short-break
           (format "Short break time: %d minutes" (/ (org-pomodoro-remaining-seconds) 60)))
          (:long-break
           (format "Long break time: %d minutes" (/ (org-pomodoro-remaining-seconds) 60)))
          (:overtime
           (format "Overtime! %d minutes" (/ (org-pomodoro-remaining-seconds) 60))))
      "No active pomo"))



  ;; Set path to reveal.js
  (setq org-re-reveal-root "file:///home/gautierk/.npm/lib/node_modules/reveal.js/")

  ;; Navigate visual lines in evil mode. Not sure if all of the below is necessary
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  (setq line-move-visual t)

  ;; Big org customization
  (with-eval-after-load 'org
    ;; Always start clock from last stopping point
    (setq org-clock-continuously t)
    ;; Org show habits all day
    (setq org-habit-show-all-today t)
    ;; Show org clock in spaceline
    (setq spaceline-org-clock-p t)
    ;; Set the base org directory
    (setq org-directory "~/.org")
    ;; Set the base org roam directory
    (setq org-roam-directory "~/.org/roam")
    ;; Org use fast todo selection
    (setq org-use-fast-todo-selection t)
    ;; Set the org journal directory
    (setq org-journal-dir "~/.org/journal")
    ;; Set the default capture file
    (setq org-default-notes-file "~/.org/agenda/inbox.org")
    ;; Soft wrap lines in org files
    (setq org-startup-truncated nil)
    ;; Set the org agenda files
    (setq org-agenda-files '("~/.org/agenda/inbox.org"
                             "~/.org/agenda/todo.org"
                             "~/.org/agenda/school.org"
                             "~/.org/agenda/work.org"
                             "~/.org/agenda/timetracking.org"
                             "~/.org/agenda/schedule.org"
                             "~/.org/agenda/all-posts.org"
                             "~/.org/agenda/projects.org"))

    ;; Highlight latex in org
    (setq org-highlight-latex-and-related '(latex))

    ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
    ;; org-clock history lets you see the list of recently clocked tasks, and clock into one
    (setq org-clock-history-length 15)

    ;; Save clock data and state changes and notes in the LOGBOOK drawer
    (setq org-clock-into-drawer t)
    ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
    (setq org-clock-out-remove-zero-time-clocks t)
    ;; Clock out when moving task to a done state
    (setq org-clock-out-when-done t)
    ;; Save the running clock and all clock history when exiting Emacs, load it on startup
    (setq org-clock-persist t)
    ;; Include current clocking task in clock reports
    (setq org-clock-report-include-clocking-task t)


    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE"))))

    (setq org-todo-keyword-faces
          (quote (("TODO" :foreground "orange" :weight bold)
                  ("NEXT" :foreground "blue" :weight bold)
                  ("DONE" :foreground "forest green" :weight bold)
                  ("WAITING" :foreground "orange" :weight bold)
                  ("HOLD" :foreground "magenta" :weight bold)
                  ("CANCELLED" :foreground "forest green" :weight bold)
                  ("PHONE" :foreground "forest green" :weight bold))))

    (setq org-startup-indented t)
    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

    (setq org-capture-templates
          (quote (
                  ("t" "todo" entry (file "~/.org/agenda/inbox.org")
                   "* TODO %?\n%U\n" :clock-in t :clock-resume t)
                  ("r" "respond" entry (file "~/.org/agenda/inbox.org")
                   "%a\n" :clock-in t :clock-resume t :immediate-finish t)
                  ;; ("n" "note" entry (file "~/.org/agenda/inbox.org")
                  ;;  "* %? :NOTE:\n%U\n" :clock-in t :clock-resume t)
                  ("j" "Journal" entry (file+datetree "~/.org/journal/diary.org")
                   "* %?\n%U\n" :clock-in t :clock-resume t)
                  ("s" "Story" entry (file+datetree "~/.org/dailystory.org")
                   "* %?\n%U\n" :clock-in t :clock-resume t)
                  ("d" "Draft" entry (file+datetree "~/.org/drafts.org")
                   "* %?\n%U\n" :clock-in t :clock-resume t)
                  ("m" "Meeting" entry (file "~/.org/agenda/inbox.org")
                   "* TODO Meeting with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                  ;; ("p" "Phone call" entry (file "~/.org/agenda/inbox.org")
                  ;;  "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
                  ("h" "Habit" entry (file "~/.org/agenda/inbox.org")
                   "* TODO %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: TODO\n:END:\n")
                  )))


    (add-to-list 'org-capture-templates
                 '("l" "Log tracking"
                   entry
                   (file+datetree "~/.org/agenda/timetracking.org")
                   "* %? %^g\n" :clock-in t :clock-resume t))

    (add-to-list 'org-capture-templates
                 '("p"                ;`org-capture' binding + h
                   "Hugo Post"
                   entry
                   ;; It is assumed that below file is present in `org-directory'
                   ;; and that it has a "Blog Ideas" heading. It can even be a
                   ;; symlink pointing to the actual location of all-posts.org!
                   (file+olp "agenda/all-posts.org" "Posts")
                   (function org-hugo-new-subtree-post-capture-template)))

    ;; Set org refile targets
    (setq org-refile-targets '(("~/.org/agenda/todo.org" :maxlevel . 3)
                               ("~/.org/agenda/projects.org" :maxlevel . 3)
                               ("~/.org/agenda/work.org" :maxlevel . 3)
                               ("~/.org/agenda/school.org" :maxlevel . 3)
                               ("~/.org/agenda/org-roam.org" :maxlevel . 3)
                               ("~/.org/agenda/someday.org" :maxlevel . 3)))
     ; Allow refile to create parent tasks with confirmation
    (setq org-refile-allow-creating-parent-nodes (quote confirm))

    ; Use full outline paths for refile targets - we file directly with IDO
    (setq org-refile-use-outline-path 'file)

    ; Targets complete directly with IDO
    (setq org-outline-path-complete-in-steps nil)

    ;; Verify that refile targets aren't done
    (defun bh/verify-refile-target ()
      "Exclude todo keywords with a done state from refile targets"
      (not (member (nth 2 (org-heading-components)) org-done-keywords)))
    (setq org-refile-target-verify-function 'bh/verify-refile-target)





    ;; Set super agenda mode to true
    ;; (setq org-super-agenda-mode t)

    ;; Capture function for new blog post
    (defun org-hugo-new-subtree-post-capture-template ()
      "Returns `org-capture' template string for new Hugo post.
       See `org-capture-templates' for more information."
      (let* ((title (read-from-minibuffer "Post Title: ")) ;Prompt to enter the post title
             (fname (org-hugo-slug title)))
        (mapconcat #'identity
                   `(
                     ,(concat "* TODO " title)
                     ":PROPERTIES:"
                     ,(concat ":EXPORT_HUGO_BUNDLE: " fname)
                     ":EXPORT_FILE_NAME: index"
                     ":END:"
                     "%?\n")                ;Place the cursor here finally
                   "\n")))


    ;; Add org-habit to org-modules
    (add-to-list 'org-modules 'org-habit)

    ;; Set the org-agenda commands
    (setq org-agenda-custom-commands
          '(("n" "Next View"
             ((agenda "" ((org-agenda-span 'day)
                          (org-super-agenda-groups
                           '((:name "Today"
                                    :time-grid t
                                    :todo "TODAY"
                                    :scheduled today
                                    :order 0)
                             (:habit t)
                             (:name "Scheduled Soon"
                                    :scheduled future
                                    :order 2)
                             (:name "Due Today"
                                    :deadline today
                                    :order 3)
                             (:name "Due Soon"
                                    :deadline future
                                    :order 8)
                             (:name "Overdue"
                                    :deadline past
                                    :order 7)
                             ))))
              (alltodo "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Inbox"
                                  :file-path "inbox"
                                  :order 0
                                  )
                           (:discard (:todo "TODO"))
                           (:auto-category t
                                           :order 9)
                           ))))))
            ("t" "Todo View"
             (
              (todo "" ((org-agenda-overriding-header "")
                        (org-super-agenda-groups
                         '((:name "Inbox"
                                  :file-path "inbox"
                                  :order 0
                                  )
                           (:auto-category t
                                           :order 9)
                           ))))))
            ))
    ;; Activate org-super-agenda-mode
    (org-super-agenda-mode)
    ;; Resume clocking task when emacs is restarted
    (org-clock-persistence-insinuate)


    )


  ;; Set scroll margin to 5
  (setq scroll-margin 5
        scroll-preserve-screen-position t)

  ;; Open Urxvt terminal from emacs
  (setq terminal-here-terminal-command (list "urxt"))

  ;; Don't automatically break lines when they get long
  (spacemacs/toggle-auto-fill-mode-off)

  ;; Javascript customization
  (setq js-indent-level 2)
  (setq prettier-js-args '(
                           "--tab-width" "2"
                           ))
  (setq prettier-html-args '(
                             "--tab-width" "2"
                             ))


  ;; Commented

  ;; Support for anki-editor
  ;; (use-package anki-editor
  ;;   :after org
  ;;   :bind (:map org-mode-map
  ;;               ("<f12>" . anki-editor-cloze-region-auto-incr)
  ;;               ("<f11>" . anki-editor-cloze-region-dont-incr)
  ;;               ("<f10>" . anki-editor-reset-cloze-number)
  ;;               ("<f9>"  . anki-editor-push-tree))
  ;;   :hook (org-capture-after-finalize . anki-editor-reset-cloze-number) ; Reset cloze-number after each capture.
  ;;   :config
  ;;   (setq anki-editor-create-decks t ;; Allow anki-editor to create a new deck if it doesn't exist
  ;;         anki-editor-org-tags-as-anki-tags t)

  ;;   (defun anki-editor-cloze-region-auto-incr (&optional arg)
  ;;     "Cloze region without hint and increase card number."
  ;;     (interactive)
  ;;     (anki-editor-cloze-region my-anki-editor-cloze-number "")
  ;;     (setq my-anki-editor-cloze-number (1+ my-anki-editor-cloze-number))
  ;;     (forward-sexp))
  ;;   (defun anki-editor-cloze-region-dont-incr (&optional arg)
  ;;     "Cloze region without hint using the previous card number."
  ;;     (interactive)
  ;;     (anki-editor-cloze-region (1- my-anki-editor-cloze-number) "")
  ;;     (forward-sexp))
  ;;   (defun anki-editor-reset-cloze-number (&optional arg)
  ;;     "Reset cloze number to ARG or 1"
  ;;     (interactive)
  ;;     (setq my-anki-editor-cloze-number (or arg 1)))
  ;;   (defun anki-editor-push-tree ()
  ;;     "Push all notes under a tree."
  ;;     (interactive)
  ;;     (anki-editor-push-notes '(4))
  ;;     (anki-editor-reset-cloze-number))
  ;;   ;; Initialize
  ;;   (anki-editor-reset-cloze-number)
  ;;   )

  ;; Org-capture templates
  ;; (add-to-list 'org-capture-templates
  ;;              '("a" "Anki basic"
  ;;                entry
  ;;                (file+headline org-my-anki-file "Dispatch Shelf")
  ;;                "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Basic\n:ANKI_DECK: Mega\n:END:\n** Front\n%?\n** Back\n%x\n"))

  ;; (add-to-list 'org-capture-templates
  ;;              '("A" "Anki cloze"
  ;;                entry
  ;;                (file+headline org-my-anki-file "Dispatch Shelf")
  ;;                "* %<%H:%M>   %^g\n:PROPERTIES:\n:ANKI_NOTE_TYPE: Cloze\n:ANKI_DECK: Mega\n:END:\n** Text\n%x\n** Extra\n"))
  ;; (setq org-my-anki-file "~/.org/anki.org")


  ;; Delete backwards word? It already seems to work
  ;; (with-eval-after-load 'company
  ;;   (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)
  ;;   )
  ;; (with-eval-after-load 'helm
  ;;   (define-key helm-map (kbd "C-w") 'evil-delete-backward-word)
  ;;   )


  ;; Not sure if I need this setting for projectile
  ;; (setq projectile-require-project-root t)

  ;; Something to do with neotree
  ;; (setq neo-vc-integration '(char))

  ;; Something to do with tramp?
  ;; (setq tramp-histfile-override "/dev/null")

  ;; Not sure what this is
  ;; (defun my-web-mode-hook ()
  ;;   "Hooks for Web mode."
  ;;   (setq web-mode-markup-indent-offset 2)
  ;;   )
  ;; (add-hook 'web-mode-hook  'my-web-mode-hook)

  ;; helps with word wrap?
  ;; (add-hook 'visual-line-mode-hook #'visual-fill-column-mode)

  ;; configures autocomplete?
  ;; (setq ac-dwim t)
  ;; (ac-config-default)
  ;; (setq ac-sources '(ac-source-yasnippet
  ;;                    ac-source-abbrev
  ;;                    ac-source-words-in-same-mode-buffers))
  ;; (ac-set-trigger-key "TAB")



  ;; is this necessary to use magit?
  ;; (use-package magit-popup
  ;;   :ensure t ; make sure it is installed
  ;;   :demand t ; make sure it is loaded
  ;; )

  ;; Don't lock files when emacs is using them
  ;; (setq create-lockfiles nil)

  ;; Enables some org keybindings in evil org
  ;; (use-package evil-org
  ;;   :ensure t
  ;;   :after org
  ;;   :config
  ;;   (add-hook 'org-mode-hook 'evil-org-mode)
  ;;   (add-hook 'evil-org-mode-hook
  ;;             (lambda ()
  ;;               (evil-org-set-key-theme '(textobjects insert navigation additional shift todo heading))
  ;;               )))


  ;; ;; Allow Emacs to access content from clipboard.
  ;; (setq x-select-enable-clipboard t
  ;;       x-select-enable-primary t)




  ;; Hugo Stuff
  ;; More here https://blog.tohojo.dk/2015/10/integrating-hugo-into-emacs.html
  ;; (setq hugo-base-dir "~/Projects/cole-website/"
  ;;       hugo-buffer "*hugo*")
  ;; (defun hugo-server (&optional arg)
  ;;   (interactive "P")
  ;;   (let* ((default-directory (concat (expand-file-name hugo-base-dir) "/"))
  ;;          (proc (get-buffer-process hugo-buffer)))
  ;;     (if (and proc (process-live-p proc))
  ;;         (progn (interrupt-process proc)
  ;;                (message "Stopped Hugo server"))
  ;;       (start-process "hugo" hugo-buffer "hugo" "server" "--buildDrafts" "--watch" "-d" "dev" "--disableFastRender")
  ;;       (message "Started Hugo server")
  ;;       (unless arg
  ;;         (browse-url "http://localhost:1313/")))))



  ;; iso timestamp?
  ;; (defun iso-timestamp ()
  ;;   (concat (format-time-string "%Y-%m-%dT%T")
  ;;           ((lambda (x) (concat (substring x 0 3) ":" (substring x 3 5)))
  ;;            (format-time-string "%z"))))




  )



;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
