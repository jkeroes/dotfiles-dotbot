# Executes commands at login pre-zshrc.

# Check for the minimum supported version.
#
my_zsh="$HOME/bin/zsh"

if [[ -x "$my_zsh" ]]; then
	my_zsh_version=$( $my_zsh --version | cut -d\  -f2 )

	if autoload -Uz is-at-least && ! is-at-least $my_zsh_version; then
		exec $my_zsh
	fi
fi
