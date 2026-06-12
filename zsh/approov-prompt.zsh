# Approov role badge for a plain zsh prompt (no framework).
#
# Reads $APPROOV_ROLE (set by the Approov CLI as "role:account") and prints a
# coloured "account (ROLE)" badge. Prints nothing when APPROOV_ROLE is unset.
#
# Usage:
#   setopt PROMPT_SUBST
#   source /path/to/approov-prompt.zsh
#   PROMPT='$(approov_prompt)%~ %# '
#
# The $(...) must be single-quoted in PROMPT so it re-runs on every prompt.

approov_prompt() {
  [[ -n $APPROOV_ROLE ]] || return 0

  local role=${APPROOV_ROLE%%:*}
  local account=${APPROOV_ROLE#*:}

  # Truecolor background per role; foreground #F5E0DC. Needs a truecolor term.
  local bg
  case $role in
    admin)      bg=$'\e[48;2;255;85;85m'  ;;
    automation) bg=$'\e[48;2;255;165;0m'  ;;
    dev)        bg=$'\e[48;2;46;204;113m' ;;
    *)          bg=$'\e[48;2;94;129;172m' ;;
  esac
  local fg=$'\e[38;2;245;224;220m'
  local reset=$'\e[0m'

  # %{...%} marks zero-width escapes so zsh keeps the prompt width correct.
  print -rn -- "%{$bg$fg%} ${account} (${role:u}) %{$reset%}"
}
