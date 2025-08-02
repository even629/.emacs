# .emacs
environment: WSL2 + Windows Terminal

windows config
```
# for clipboard
https://github.com/equalsraf/win32yank

```

for Ubuntu
```bash
sudo add-apt-repository ppa:ubuntuhandbook1/emacs
sudo apt-get update

# emacs-nox
sudo apt-get install emacs-nox

sudo apt-get install clang clangd clang-format 

```

for Arch Linux

```bash
pacman -Sy emacs-nox

pacman -Sy clang clangd clang-format rust-analyzer

rm ~/.cargo/bin/rust-analyzer

ln -s /usr/bin/rust-analyzer ~/.cargo/bin/rust-analyzer

cargo install --git https://github.com/bergercookie/asm-lsp asm-lsp

# 创建配置文件，也可以用默认配置

asm-lsp gen-config
```

