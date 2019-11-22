# zplugin
if (! test -d ~/.zplugin)
then
    echo "~/.zplugin/ not found. Continuing in dumb mode."
    sleep 1
else
    source ~/.zplugin/zplugin.zsh
    # zplugin self-update

    # Two regular plugins loaded without tracking.
    zplugin light zsh-users/zsh-autosuggestions
    zplugin light zdharma/fast-syntax-highlighting

    # Load the zsh-async library but not the pure theme.
    zplugin ice pick"async.zsh"
    # zplugin light sindresorhus/pure

    # Spaceship does all the things. It's also very slow to load.
    zplugin ice "denysdovhan/spaceship-prompt" from"github" pick"spaceship.zsh" reset-prompt
    zplugin load denysdovhan/spaceship-prompt
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
        # xcode         # Xcode section
        # swift         # Swift section
        # golang          # Go section
        # docker        # Docker section
        # aws           # Amazon Web Services section
        # venv          # virtualenv section
        # conda         # conda virtualenv section
        pyenv           # Pyenv section
        # ember         # Ember.js section
        # kubecontext   # Kubectl context section

        line_sep      # Line break
        battery     # Battery level and status
        # vi_mode     # Vi-mode indicator
        jobs          # Background jobs indicator
        exit_code     # Exit code section
        exec_time     # Execution time
        char          # Prompt character
    )

    # Binary release in archive, from GitHub-releases page.
    # After automatic unpacking it provides program "fzf".
    zplugin ice from"gh-r" as"program"
    # zplugin load junegunn/fzf-bin

    # Scripts that are built at install (there's single default make target, "install",
    # and it constructs scripts by `cat'ing a few files). The make'' ice could also be:
    # `make"install PREFIX=$ZPFX"`, if "install" wouldn't be the only, default target.
    zplugin ice as"program" pick"$ZPFX/bin/git-*" make"PREFIX=$ZPFX"
    zplugin light tj/git-extras

    # Handle completions without loading any plugin, see "clist" command.
    # This one is to be ran just once, in interactive session.
    # zplugin creinstall %HOME/my_completions

    # For GNU ls (the binaries can be gls, gdircolors, e.g. on OS X when installing the
    # coreutils package from Homebrew; you can also use https://github.com/ogham/exa)
    zplugin ice atclone"dircolors -b LS_COLORS > c.zsh" atpull'%atclone' pick"c.zsh" nocompile'!'
    zplugin light trapd00r/LS_COLORS
fi


# TODO
# # unix
# plugins+=(common-aliases command-not-found cp gnu-utils sudo systemd fd)

# # osx
# if [[ $OSTYPE == darwin* ]]; then
#     plugins+=(osx sublime)
# fi

# # git
# plugins+=(git git-extras gitignore git-remote-branch tig branch)

# # dev
# plugins+=(cpanm jira jsontools)

# # virt
# plugins+=(docker docker-compose vagrant)

# # remote
# plugins+=(ssh-agent mosh tmux)

# zstyle :omz:plugins:ssh-agent agent-forwarding on
# zstyle :omz:plugins:ssh-agent identities id_dh_rsa id_dh_ed id_github_ed id_home_ed id_home_rsa id_ms_ed

# others
# plugins+=(python pip pep8)
# plugins+=(ruby rbenv rake)
# plugins+=(hub)
# plugins+=(tmuxinator)


# eg `ssh-add ~/.ssh/id^*pub`
setopt extendedglob

# permit eg `git show HEAD^`
unsetopt nomatch

## use my local::lib modules
test -d ~/perl5 && eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# iterm2
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# colors
[ -n "$PS1" ] \
	&& [ -s $BASE16_SHELL/profile_helper.sh ] \
	&& eval "$($BASE16_SHELL/profile_helper.sh)" \
	&& source "$BASE16_SHELL/scripts/base16-onedark.sh"

# oh-my-zsh
# test -d ~/.oh-my-zsh && source ~/.oh-my-zsh/oh-my-zsh.sh

# Load aliases and functions
test -e ~/.alias && source ~/.alias
test -e ~/.zshfunc && source ~/.zshfunc

if [ "$SSH_TTY" ]; then
    # I have ssh'd to another host.
    export EDITOR='vim'
    export VISUAL='vim'
else
    # set options for localhost
    export EDITOR='code -w'
    export VISUAL='code -w'
fi
