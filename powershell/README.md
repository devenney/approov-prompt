# PowerShell

An Approov role badge for PowerShell, driven by `$env:APPROOV_ROLE`.

## Setting the role

Set `$env:APPROOV_ROLE` to `role:account`:

```powershell
$env:APPROOV_ROLE = 'admin:my-account'
```

## Install

Dot-source the script from your `$PROFILE` and call `Write-ApproovBadge` from
your `prompt` function:

```powershell
. C:\path\to\approov-prompt.ps1

function prompt {
    "$(Write-ApproovBadge)PS $($executionContext.SessionState.Path.CurrentLocation)$('>' * ($nestedPromptLevel + 1)) "
}
```

Find your profile path with `$PROFILE`; create the file if it doesn't exist.

## How it works

[`approov-prompt.ps1`](approov-prompt.ps1) splits `$env:APPROOV_ROLE` on the
first `:`, picks a 24-bit background colour by role, and returns an
` account (ROLE) ` badge string. It returns `''` when the variable is unset, so
your prompt is unchanged.

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

ANSI/VT colours require Windows Terminal or PowerShell 5.1+ with virtual
terminal processing enabled (the default in modern Windows terminals). Colours
assume a dark background; adjust the hex triplets in the script to taste.

## Verify

```powershell
$env:APPROOV_ROLE = 'admin:my-account'   # red  my-account (ADMIN)  badge
Write-ApproovBadge                       # prints the badge string
```
