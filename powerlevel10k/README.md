# powerlevel10k

Renders the Approov role badge as a [powerlevel10k](https://github.com/romkatv/powerlevel10k)
custom segment, from the `APPROOV_ROLE` environment variable.

## Install

1. Drop [`approov.zsh`](approov.zsh) somewhere on disk and source it from
   `~/.zshrc` **after** powerlevel10k is loaded:

   ```sh
   source /path/to/approov.zsh
   ```

   (Or paste the `prompt_approov` / `instant_prompt_approov` functions straight
   into `~/.p10k.zsh`.)

2. Add `approov` to your prompt elements in `~/.p10k.zsh`:

   ```zsh
   typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
     # ...
     approov
     # ...
   )
   ```

   Use `POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS` instead for a right-side badge.

p10k discovers the segment by the `prompt_<name>` naming convention, so the
element name is `approov`. The matching `instant_prompt_approov` keeps the badge
correct during instant-prompt warmup.

## Colours

Backgrounds are hex (`#FF5555` admin, `#FFA500` automation, `#2ECC71` dev,
`#5E81AC` other) on a `#F5E0DC` foreground. Hex needs a truecolor terminal; on a
256-colour terminal swap them for colour codes (e.g. `203 / 214 / 71 / 67`,
foreground `231`) in the `case` and the `p10k segment` call.

## Verify

```sh
export APPROOV_ROLE=admin:my-account   # red   my-account (ADMIN)  badge
export APPROOV_ROLE=dev:my-account     # green my-account (DEV)    badge
```

With `APPROOV_ROLE` unset the segment returns early and nothing is shown.
