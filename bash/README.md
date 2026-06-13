# bash

A plain-bash prompt badge driven by `APPROOV_ROLE`.

## Install

```bash
source /path/to/approov-prompt.bash
PS1='$(__approov_prompt)\w \$ '
```

Or, if you assemble `PS1` inside `PROMPT_COMMAND`:

```bash
PROMPT_COMMAND='PS1="$(__approov_prompt)\w \$ "'
```

Put `$(__approov_prompt)` wherever you want the badge in `PS1`.

## Why the odd escape markers

bash needs non-printing sequences wrapped so it can measure prompt width. The
usual `\[ \]` markers are only interpreted when they appear *literally* in `PS1`
— not when produced by a `$()` command substitution. So this snippet emits the
raw `\001` / `\002` bytes (the actual markers `\[ \]` stand for), which work
correctly via `$()`.

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

Colours use 24-bit (truecolor) escapes and assume a dark background. On a
256-colour terminal, swap the `\033[48;2;R;G;Bm` sequences for `\033[48;5;Nm`
codes. Uppercasing uses `tr`, so it works on old bash (3.2) as well as bash 4+.

## Verify

```bash
export APPROOV_ROLE=admin:my-account   # red  my-account (ADMIN)  badge
```

With `APPROOV_ROLE` unset the function prints nothing and `PS1` is unchanged.
