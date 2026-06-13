# fish

An Approov role badge for [fish](https://fishshell.com/), driven by
`APPROOV_ROLE`.

## Install

Save the function so fish autoloads it:

```fish
cp approov_prompt.fish ~/.config/fish/functions/approov_prompt.fish
```

Then call `approov_prompt` from your `fish_prompt`:

```fish
function fish_prompt
    approov_prompt
    echo -n (prompt_pwd)' > '
end
```

## How it works

[`approov_prompt.fish`](approov_prompt.fish) splits `APPROOV_ROLE` on `:`,
chooses a background with `set_color -b <hex>` by role, and prints an
` account (ROLE) ` badge. `set_color normal` resets at the end.

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

Colours assume a dark background; change the hex values in the `switch` to suit
your theme. (Requires fish 3.x for `string upper`.)

## Verify

```fish
set -x APPROOV_ROLE admin:my-account   # red  my-account (ADMIN)  badge
```

With `APPROOV_ROLE` unset the function returns immediately and prints nothing.
