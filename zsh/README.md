# zsh (no framework)

A plain-zsh prompt badge driven by `APPROOV_ROLE`, for setups that don't use
oh-my-posh, starship, or powerlevel10k.

## Install

```zsh
setopt PROMPT_SUBST
source /path/to/approov-prompt.zsh
PROMPT='$(approov_prompt)%~ %# '
```

- `setopt PROMPT_SUBST` lets `$(approov_prompt)` run on every prompt.
- Single-quote the `$(...)` so it re-evaluates each time, rather than once.
- Put `$(approov_prompt)` wherever you want the badge in your `PROMPT` (or
  `RPROMPT` for a right-side badge).

## How it works

[`approov-prompt.zsh`](approov-prompt.zsh) splits `APPROOV_ROLE` on `:` into
role and account, picks a background colour by role, and emits the badge with
the escape sequences wrapped in `%{ %}` so zsh keeps the prompt width correct.

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

Colours use 24-bit (truecolor) escapes and assume a dark background. On a
256-colour terminal, swap the `\e[48;2;R;G;Bm` sequences for
`\e[48;5;Nm` codes.

## Verify

```zsh
eval "$(approov role admin my-account)"   # red  my-account (ADMIN)  badge
```

With `APPROOV_ROLE` unset the function returns early and the prompt is unchanged.
