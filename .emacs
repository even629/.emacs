(setq inhibit-startup-message t)         ;; 关闭启动消息
(setq initial-scratch-message nil)       ;; 关闭 *scratch* 缓冲区中的欢迎信息
(tool-bar-mode -1)                       ;; 关闭工具栏
(menu-bar-mode -1)                       ;; 关闭菜单栏
(scroll-bar-mode -1)                     ;; 关闭滚动条
(setq ring-bell-function 'ignore)        ;; 关闭错误提示音
(global-display-line-numbers-mode t)     ;; 显示行号
(defalias 'yes-or-no-p 'y-or-n-p)        ;; 使用 y/n 代替 yes/no
(setq make-backup-files nil)             ;; 禁用备份文件
;;(setq auto-save-default nil)             ;; 禁用自动保存文件
(setq create-lockfiles nil)              ;; 禁用锁定文件

;; ------------------------
;; 设置编码
;; ------------------------
;; 设定 Emacs 使用 UTF-8 编码
(prefer-coding-system 'utf-8)                   ;; 优先使用 UTF-8 编码
(setq locale-coding-system 'utf-8)              ;; 设置区域编码为 UTF-8
(set-keyboard-coding-system 'utf-8)             ;; 设置键盘编码为 UTF-8
(set-selection-coding-system 'utf-8)            ;; 设置选择内容的编码为 UTF-8
(set-terminal-coding-system 'utf-8)             ;; 设置终端编码为 UTF-8

;; 默认保存文件时使用 UTF-8 编码
(setq-default buffer-file-coding-system 'utf-8)

;; 自动检测文件编码
(setq find-file-encoding 'auto)                  ;; 自动检测文件编码
(setq-default coding-system-for-read 'utf-8)     ;; 读取文件时默认使用 UTF-8
(setq-default coding-system-for-write 'utf-8)    ;; 写入文件时默认使用 UTF-8

;; 设定编码环境为 UTF-8
(set-language-environment "UTF-8")

;;------------------------------
;; 优化部分
;;------------------------------
;; 将基本缩进改为空格
(use-package simple
  :ensure nil
  :init
  (setq-default indent-tabs-mode nil))
;;优化长行文件
(use-package so-long
  :ensure t
  :init
  (global-so-long-mode +1))
;; 提高性能
(setq process-adaptive-read-buffering t)
(setq blink-matching-paren nil);;键入右括号时不要眨眼
(setq vc-handled-backends '(Git));;将 VC 后端更改为仅 Git
(setq auto-mode-case-fold nil);;防止文件搜索执行两次
(setq-default bidi-display-reordering 'left-to-right);;抑制双向排序
(setq bidi-inhibit-bpa t);;长线双向扫描
;;删除未聚焦窗口中的光标
(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil);;
(setq fast-but-imprecise-scrolling t);;快速滚动
(setq ffap-machine-p-known 'reject);;不要 ping 域
(setq idle-update-delay 1.0);;减少UI更新频率
(setq redisplay-skip-fontification-on-input t);;抑制不必要的字体显示


;; package 
(use-package package
  :config
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (unless (bound-and-true-p package--initialized)
    (package-initialize)))
;; 设置 use-package 自动安装缺失包
(setq use-package-always-ensure t)


;; Fix path
(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(use-package tree-sitter
  :when (and (fboundp 'treesit-available-p)
         (treesit-available-p))
  :config (setq treesit-font-lock-level 4)
  :init
  (setq treesit-language-source-alist
    '((bash       . ("https://github.com/tree-sitter/tree-sitter-bash"))
      (c          . ("https://github.com/tree-sitter/tree-sitter-c"))
      (cpp        . ("https://github.com/tree-sitter/tree-sitter-cpp"))
      (css        . ("https://github.com/tree-sitter/tree-sitter-css"))
      (cmake      . ("https://github.com/uyha/tree-sitter-cmake"))
      (csharp     . ("https://github.com/tree-sitter/tree-sitter-c-sharp.git"))
      (dockerfile . ("https://github.com/camdencheek/tree-sitter-dockerfile"))
      (elisp      . ("https://github.com/Wilfred/tree-sitter-elisp"))
      (go         . ("https://github.com/tree-sitter/tree-sitter-go"))
      (gomod      . ("https://github.com/camdencheek/tree-sitter-go-mod.git"))
      (html       . ("https://github.com/tree-sitter/tree-sitter-html"))
      (java       . ("https://github.com/tree-sitter/tree-sitter-java.git"))
      (javascript . ("https://github.com/tree-sitter/tree-sitter-javascript"))
      (json       . ("https://github.com/tree-sitter/tree-sitter-json"))
      (lua        . ("https://github.com/Azganoth/tree-sitter-lua"))
      (make       . ("https://github.com/alemuller/tree-sitter-make"))
      (markdown   . ("https://github.com/MDeiml/tree-sitter-markdown" nil "tree-sitter-markdown/src"))
      (ocaml      . ("https://github.com/tree-sitter/tree-sitter-ocaml" nil "ocaml/src"))
      (org        . ("https://github.com/milisims/tree-sitter-org"))
      (python     . ("https://github.com/tree-sitter/tree-sitter-python"))
      (php        . ("https://github.com/tree-sitter/tree-sitter-php"))
      (typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src"))
      (tsx        . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src"))
      (ruby       . ("https://github.com/tree-sitter/tree-sitter-ruby"))
      (rust       . ("https://github.com/tree-sitter/tree-sitter-rust"))
      (sql        . ("https://github.com/m-novikov/tree-sitter-sql"))
      (vue        . ("https://github.com/merico-dev/tree-sitter-vue"))
      (yaml       . ("https://github.com/ikatyang/tree-sitter-yaml"))
      (toml       . ("https://github.com/tree-sitter/tree-sitter-toml"))
      (zig        . ("https://github.com/GrayJack/tree-sitter-zig"))))
  (add-to-list 'major-mode-remap-alist '(sh-mode         . bash-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c-mode          . c-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c++-mode        . c++-ts-mode))
  (add-to-list 'major-mode-remap-alist '(c-or-c++-mode   . c-or-c++-ts-mode))
  (add-to-list 'major-mode-remap-alist '(css-mode        . css-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-mode         . js-ts-mode))
  (add-to-list 'major-mode-remap-alist '(java-mode       . java-ts-mode))
  (add-to-list 'major-mode-remap-alist '(js-json-mode    . json-ts-mode))
  (add-to-list 'major-mode-remap-alist '(makefile-mode   . cmake-ts-mode))
  (add-to-list 'major-mode-remap-alist '(python-mode     . python-ts-mode))
  (add-to-list 'major-mode-remap-alist '(ruby-mode       . ruby-ts-mode))
  (add-to-list 'major-mode-remap-alist '(conf-toml-mode  . toml-ts-mode))
  (add-to-list 'auto-mode-alist '("\\(?:Dockerfile\\(?:\\..*\\)?\\|\\.[Dd]ockerfile\\)\\'" . dockerfile-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.go\\'" . go-ts-mode))
  (add-to-list 'auto-mode-alist '("/go\\.mod\\'" . go-mod-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-ts-mode))
  (add-to-list 'auto-mode-alist '("\\.y[a]?ml\\'" . yaml-ts-mode)))


(require 'eglot)

(setq eglot-server-programs
      '(((c++-mode c-mode c++-ts-mode c-ts-mode) . ("clangd"))
        ((rust-ts-mode rust-mode) . ("rust-analyzer"
                                     :initializationOptions
                                     (:checkCommand "clippy")))))
(add-hook 'c-mode-hook 'eglot-ensure)
(add-hook 'c++-mode-hook 'eglot-ensure)
(add-hook 'c-ts-mode-hook 'eglot-ensure)
(add-hook 'c++-ts-mode-hook 'eglot-ensure)
(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'rust-ts-mode-hook 'eglot-ensure)

;; ------------------------
;; Company-mode 自动补全配置
;; ------------------------
(use-package company :ensure t :defer t
  :hook (after-init . global-company-mode))

;;-------------------------
;; 设置格式化代码
;;-------------------------
(use-package format-all
  :ensure t
  :commands format-all-mode
  :hook (prog-mode . format-all-mode)
  :config
  (setq-default format-all-formatters
                '(("C"     (clang-format )))))
;;快捷键绑定
(global-set-key (kbd "C-x f") 'format-all-buffer)


;;---------------------------------
;; UI界面
;;---------------------------------
;; 安装 neotree,文件浏览侧边栏

(use-package neotree
  :ensure t
  :bind ([f8] . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  (setq neo-window-fixed-size nil))

(use-package all-the-icons
  :ensure t
  :config
  (unless (member "all-the-icons" (font-family-list))
    (all-the-icons-install-fonts t)))





;;面包屑
(use-package breadcrumb
  :ensure t
  :config
  (breadcrumb-mode +1))
;;仪表盘
(use-package dashboard
  :ensure t
  :config
  (setq dashboard-center-content t)
  (dashboard-setup-startup-hook))
;; 改进分页符显示
(use-package page-break-lines
  :ensure t
  :config
  (page-break-lines-mode +1))


;; ------------------------
;; 设置 Fira Code Light 字体
;; ------------------------
(defun my-setup-fira-code ()
  "设置 Fira Code 字体和连体字功能，针对 C/C++ 模式。"
  (set-face-attribute 'default nil :family "Fira Code" :height 120))

(add-hook 'c-mode-hook 'my-setup-fira-code)
(add-hook 'c++-mode-hook 'my-setup-fira-code)
(add-hook 'c-ts-mode-hook 'my-setup-fira-code)
(add-hook 'c++-ts-mode-hook 'my-setup-fira-code)

(use-package ligature
  :ensure t
  :config
  (ligature-set-ligatures 'prog-mode '("www" "**" "***" "**/" "*>" "*/" "//" "&&" "||" "==" "===" "!=" "!==" "=>" "->"))
  ;; 只在 C/C++ 模式下启用连体字
  (add-hook 'c-mode-hook (lambda () (ligature-set-ligatures 'c-mode '("->" "&&" "||" "==" "!="))))
  (add-hook 'c++-mode-hook (lambda () (ligature-set-ligatures 'c++-mode '("->" "&&" "||" "==" "!="))))
  (add-hook 'c-ts-mode-hook (lambda () (ligature-set-ligatures 'c-mode '("->" "&&" "||" "==" "!="))))
  (add-hook 'c++-ts-mode-hook (lambda () (ligature-set-ligatures 'c++-mode '("->" "&&" "||" "==" "!="))))
  ;; 全局启用连体字支持，但只在特定模式中生效
  (global-ligature-mode t))



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(page-break-lines dashboard breadcrumb all-the-icons treesit-ispell treesit-auto tree-sitter neotree format-all flycheck exec-path-from-shell company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
