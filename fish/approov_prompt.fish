# Approov role badge for fish.
#
# Reads $APPROOV_ROLE (set by the Approov CLI as "role:account") and prints a
# coloured "account (ROLE)" badge. Prints nothing when APPROOV_ROLE is unset.
#
# Install: put this file at ~/.config/fish/functions/approov_prompt.fish, then
# call `approov_prompt` from your fish_prompt function, e.g.
#
#   function fish_prompt
#       approov_prompt
#       echo -n (prompt_pwd)' > '
#   end

function approov_prompt --description 'Show the active Approov account/role'
    test -n "$APPROOV_ROLE"; or return

    set -l parts (string split -m1 ':' -- $APPROOV_ROLE)
    set -l role $parts[1]
    set -l account $parts[2]

    set -l bg
    switch $role
        case admin
            set bg (set_color -b ff5555)
        case automation
            set bg (set_color -b ffa500)
        case dev
            set bg (set_color -b 2ecc71)
        case '*'
            set bg (set_color -b 5e81ac)
    end

    printf '%s%s %s (%s) %s' $bg (set_color f5e0dc) \
        $account (string upper $role) (set_color normal)
end
