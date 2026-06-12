# Approov role badge as a powerlevel10k custom segment.
#
# Reads $APPROOV_ROLE (set by the Approov CLI as "role:account") and renders an
# "account (ROLE)" badge coloured by role. Renders nothing when APPROOV_ROLE is
# unset.
#
# Setup:
#   1. Source this file from ~/.zshrc AFTER powerlevel10k is loaded, or paste the
#      function into ~/.p10k.zsh.
#   2. Add `approov` to the prompt elements in ~/.p10k.zsh, e.g.
#        typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=( ... approov ... )
#      or POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS for a right-side badge.

function prompt_approov() {
  [[ -n $APPROOV_ROLE ]] || return

  local role=${APPROOV_ROLE%%:*}
  local account=${APPROOV_ROLE#*:}

  local bg
  case $role in
    admin)      bg='#FF5555' ;;
    automation) bg='#FFA500' ;;
    dev)        bg='#2ECC71' ;;
    *)          bg='#5E81AC' ;;
  esac

  # -b background, -f foreground, -t text. Hex needs a truecolor terminal; for a
  # 256-colour terminal use codes instead (e.g. 203 / 214 / 71 / 67, fg 231).
  p10k segment -b "$bg" -f '#F5E0DC' -t "${account} (${role:u})"
}

# Keep p10k instant prompt happy (renders the same content during warmup).
function instant_prompt_approov() { prompt_approov; }
