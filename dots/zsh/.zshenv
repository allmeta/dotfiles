# Ubuntu's /etc/zsh/zshrc runs its own compinit with a different fpath than ~/.zshrc,
# so the two kept invalidating each other's .zcompdump (~300ms rebuild every startup).
skip_global_compinit=1
