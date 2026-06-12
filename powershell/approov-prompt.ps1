# Approov role badge for PowerShell.
#
# Reads $env:APPROOV_ROLE (set by the Approov CLI as "role:account") and returns
# a coloured "account (ROLE)" badge string. Returns an empty string when
# APPROOV_ROLE is unset.
#
# Install: dot-source this file from your $PROFILE, then call it inside your
# prompt function, e.g.
#
#   . /path/to/approov-prompt.ps1
#   function prompt {
#       "$(Write-ApproovBadge)PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
#   }
#
# ANSI colours require Windows Terminal / PowerShell 5.1+ with VT processing
# (on by default in modern terminals).

function Write-ApproovBadge {
    if ([string]::IsNullOrEmpty($env:APPROOV_ROLE)) { return '' }

    $parts   = $env:APPROOV_ROLE -split ':', 2
    $role    = $parts[0]
    $account = if ($parts.Count -gt 1) { $parts[1] } else { '' }

    $esc   = [char]27
    $reset = "$esc[0m"
    $fg    = "$esc[38;2;245;224;220m"   # foreground #F5E0DC

    # Truecolor background per role.
    $bg = switch ($role) {
        'admin'      { "$esc[48;2;255;85;85m" }
        'automation' { "$esc[48;2;255;165;0m" }
        'dev'        { "$esc[48;2;46;204;113m" }
        default      { "$esc[48;2;94;129;172m" }
    }

    "$bg$fg $account ($($role.ToUpper())) $reset"
}
