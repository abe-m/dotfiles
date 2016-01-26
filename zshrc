# 別名
alias a=alias
# 
a ua=unalias
a be='bundle exec'
a gb='git branch'
a l='ls -l'
a la='ls -la'
a j=jobs
a h=history
##a man='LANG=C man'
##a man='w3mman'

alias -g RS=' | sed "/^spec/d" | sed "/^vendor/d"'
##alias gd='dirs -v; echo -n "select number: "; read newdir; cd +"$newdir"'
##alias sudo='sudo '
##alias -g G='| grep'

# 
if [ x`/bin/uname`=xLinux ]; then
    a ls='ls --color=auto'
    a egrep='egrep --color=auto'
    a grep='grep --color=auto'
elif [ x`/bin/uname`=xDarwin ]; then
    a ls='ls -G'
fi

# emacs スタイルのキーバインド
bindkey -e

# cdr 
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 500 # cdrの履歴を保存する個数
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# zaw
source ~/.zsh/zaw/zaw.zsh
zstyle ':filter-select:highlight' selected fg=black,bg=white,standout
zstyle ':filter-select' case-insensitive yes
bindkey '^[h' zaw-history
bindkey '^[c' zaw-cdr
bindkey '^[g' zaw-git-branches
bindkey '^[@' zaw-gitdir

# プロンプトの設定
autoload -U colors; colors
autoload -U promptinit; promptinit
if [ $UID = 0 ] ; then
    PROMPT="%{${fg[white]}${bg[red]}%}%m#%{${reset_color}%} "
else
    PROMPT="%{${fg[white]}${bg[green]}%}%m$%{${reset_color}%} "
fi

# 履歴の保存場所
HISTFILE=~/.zsh/.zsh_history

# メモリ内の履歴の数
HISTSIZE=10000

# 保存される履歴の数
SAVEHIST=100000

# 履歴ファイルに時刻を記録
setopt extended_history

# シェルのプロセスごとに履歴を共有
setopt share_history

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加
setopt append_history

# コマンドが入力されるとすぐに追加
setopt inc_append_history

# 画面を超える時にのみ補完するか質問を行う
LISTMAX=0

# 補完の利用設定    compdef等の前に実行する必要がある
autoload -U compinit; compinit

# 補完設定
compdef _man w3mman
##compdef _tex platex

# sudo でも補完の対象
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# 補完時に大文字小文字を区別しない
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 履歴検索
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# 補完候補が複数ある時に、一覧表示
setopt auto_list

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 先方予測
# autoload -U predict-on; predict-on

# 補完キー（Tab, Ctrl+i) で順に補完候補を自動で補完
#setopt auto_menu

# rm * 実行前に確認
setopt rmstar_wait

# カッコの対応などを自動的に補完
setopt auto_param_keys

# ディレクトリ名の補完時に / を付加
setopt auto_param_slash

# リダイレクトで上書きすることを許可しない
setopt noclobber

# pushd時に同一ディレクトリを除去
setopt pushd_ignore_dups

# cdで自動的にpushd
setopt auto_pushd

# ビープ音を鳴らさない
setopt no_beep

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 重複したヒストリは追加しない
setopt hist_ignore_all_dups

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# 空白から始まるコマンドは履歴に残さない
setopt hist_ignore_space

# 余分な空白は詰めて記録
setopt hist_reduce_blanks

# histroyコマンドは記録しない
setopt hist_no_store

# 履歴検索中、(連続してなくとも)重複を飛ばす
setopt hist_find_no_dups

# zedエディタのロード
#autoload zed

# コマンドラインの引数で longoption の = 以降でも補完
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加
setopt mark_dirs

# 8 ビット目を通すようになり、日本語のファイル名を表示可能
setopt print_eight_bit

# Ctrl+wで､直前の/までを削除する
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

# ファイルリスト補完でもlsと同様に色をつける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# current directoryが変更された時に実行する関数
##function chpwd()
##{
##	# ファイル一覧を表示
##	ls;
##	# screenタイトルをカレントディレクトリに
##	[ "$TERM" = "screen" ] && \
##		echo -ne "\ek`pwd | sed -n 's/^.*\/\(.*\)$/\1\//p'`\e\\"
##}

# コマンド実行前に実行する関数
#function preexec() { }

# ディレクトリ名だけでディレクトリの移動をする
setopt auto_cd

# C-s, C-qを無効にする
setopt no_flow_control

# ^Dでログアウトしない
setopt ignore_eof

# 補完時にスペルチェック
#setopt auto_correct

# Return を押す度にスペルチェック
#setopt correct
#setopt correct_all

# ローカルのセッティングファイルを読み込む
[ -f ~/.zshrc.local ] && . ~/.zshrc.local

# screen 起動
##[ "$TERM" != "screen" ] && which screen >/dev/null && \
##	exec screen -S main #-xRR

