# Approov role badge for a plain bash prompt.
#
# Reads $APPROOV_ROLE (set by the Approov CLI as "role:account") and prints a
# coloured "account (ROLE)" badge. Prints nothing when APPROOV_ROLE is unset.
#
# Usage (either works):
#   source /path/to/approov-prompt.bash
#   PS1='$(__approov_prompt)\w \$ '
# or, if you build PS1 in PROMPT_COMMAND:
#   PROMPT_COMMAND='PS1="$(__approov_prompt)\w \$ "'
#
# This uses the raw \001/\002 (non-printing) markers rather than \[ \] so it
# works correctly when called via $() inside PS1.

__approov_prompt() {
  [ -n "$APPROOV_ROLE" ] || return 0

  local role=${APPROOV_ROLE%%:*}
  local account=${APPROOV_ROLE#*:}
  local upper
  upper=$(printf '%s' "$role" | tr '[:lower:]' '[:upper:]')

  local s=$'\001' e=$'\002' esc=$'\033'

  # Truecolor background per role; foreground #F5E0DC. Needs a truecolor term.
  local bg
  case $role in
    admin)      bg="${s}${esc}[48;2;255;85;85m${e}"  ;;
    automation) bg="${s}${esc}[48;2;255;165;0m${e}"  ;;
    dev)        bg="${s}${esc}[48;2;46;204;113m${e}" ;;
    *)          bg="${s}${esc}[48;2;94;129;172m${e}" ;;
  esac
  local fg="${s}${esc}[38;2;245;224;220m${e}"
  local reset="${s}${esc}[0m${e}"

  printf '%s' "${bg}${fg} ${account} (${upper}) ${reset}"
}
