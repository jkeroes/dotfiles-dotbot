#
# dotphiles : https://github.com/dotphiles/dotphiles
#
# Defines environment variables.
#
# Authors:
#   Ben O'Hara <bohara@gmail.com>
#

# Dont read global configs
unsetopt GLOBAL_RCS

# Customize to your needs...

# Add paths if they exist
path=(
    $HOME/bin
    /usr/local/bin
    /usr/bin
    /usr/local/sbin
    /usr/sbin
    /usr/local/opt/go/libexec/bin
    $HOME/Library/Python/3.7/bin
    $path
)
path=($^path(N))

# Seemed to be missing?
# export TMPDIR=/tmp

# Golang
export GOPATH=$HOME/go

# To ensure proper runtime linking with shared libraries in your $HOME, rather
# than messing around with env. vars perpetually it's easier to set one that
# tells the linker (at link time) of alternate paths to look for shared
# libraries (at runtime). At the same time, we should tell pkg-config where to
# look for files it's interested in
export PKG_CONFIG_PATH="$HOME/lib/pkgconfig/"
export LD_RUN_PATH="$HOME/lib"

# OSX can get bitchy and hang when sshfs is working.
export FUSE_DEFAULT_DAEMON_TIMEOUT=3600

export DSHOST=`/bin/hostname -s`

# oh-my-zsh
if [ -d $HOME/.oh-my-zsh ]; then
    export ZSH=$HOME/.oh-my-zsh

    # export ZSH_THEME="TheOne"
    export ZSH_THEME=spaceship
    export SPACESHIP_EXIT_CODE_SHOW=true
    export SPACESHIP_USER_SHOW=always # TODO: Install spaceship on all hosts then delete this line.
    export SPACESHIP_HOST_SHOW=always # TODO: ditto.

    # change: "jkeroes in somedir at icarus"
    #     to: "jkeroes@icarus:somedir"
    unset SPACESHIP_USER_PREFIX
    export SPACESHIP_USER_SUFFIX=""
    export SPACESHIP_HOST_PREFIX="@"
    export SPACESHIP_HOST_SUFFIX=""
    export SPACESHIP_DIR_PREFIX=":"

    # change: "on  PROJ-123"
    #     to:   "  PROJ-123"
    export SPACESHIP_GIT_PREFIX=" "
    export SPACESHIP_GIT_SUFFIX=""

    # change: "✘1 "
    #     to: "✘:1 "
    export SPACESHIP_EXIT_CODE_SYMBOL="✘:"
    export SPACESHIP_EXIT_CODE_SUFFIX=" ";

    # change: " took 5s"
    #     to: " ⏱:5s"
    # Must leverage the prefix to change the symbol because SPACESHIP_EXEC_TIME_SYMBOL DNE,
    export SPACESHIP_EXEC_TIME_PREFIX="⏱ :"
    export SPACESHIP_EXEC_TIME_SUFFIX=" "

    # Comment out sections to disable them.
    #
    # Disabling sections is good; it speeds up the prompt.
    #
    SPACESHIP_PROMPT_ORDER=(
    # time        # Time stampts section (Disabled)
    user          # Username section
    host          # Hostname section
    dir           # Current directory section
    #
    git             # Git section (git_branch + git_status)
    # hg            # Mercurial section (hg_branch  + hg_status)
    # package       # Package version
    # node          # Node.js section
    # ruby          # Ruby section
    # elixir        # Elixir section
    # xcode         # Xcode section
    # swift         # Swift section
    golang          # Go section
    # php           # PHP section
    # rust          # Rust section
    # haskell       # Haskell Stack section
    # julia         # Julia section
    # docker        # Docker section
    # aws           # Amazon Web Services section
    # venv          # virtualenv section
    # conda         # conda virtualenv section
    pyenv           # Pyenv section
    # dotnet        # .NET section
    # ember         # Ember.js section
    # kubecontext   # Kubectl context section

    line_sep      # Line break
    # battery     # Battery level and status
    # vi_mode     # Vi-mode indicator
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    exec_time     # Execution time
    char          # Prompt character
    )

    # export ZSH_THEME=agnoster
    # export DISABLE_UPDATE_PROMPT=true

    # Install:
    # git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    # export POWERLEVEL9K_MODE='nerdfont-complete'
    # export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
    # export ZSH_THEME="powerlevel9k/powerlevel9k"
fi

# Colors
export BASE16_SHELL=$HOME/.config/base16-shell/
