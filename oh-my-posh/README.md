# oh-my-posh

Renders the Approov role badge in [oh-my-posh](https://ohmyposh.dev/) from the
`APPROOV_ROLE` environment variable.

## Add the segment

[`segment.toml`](segment.toml) is a single `[[blocks]]` entry. Copy it into the
`blocks` array of your theme, wherever you want the badge to sit. It ships
`alignment = "left"`; change it to `"right"` (and reorder relative to your other
blocks) if you want it on the right of the prompt line.

```toml
# ...your existing blocks...

[[blocks]]
alignment = "left"
type = "prompt"

  [[blocks.segments]]
  type = "text"
  style = "plain"
  foreground = "#F5E0DC"
  background_templates = [
    '{{ if hasPrefix "admin:" .Env.APPROOV_ROLE }}#FF5555{{ end }}',
    '{{ if hasPrefix "automation:" .Env.APPROOV_ROLE }}#FFA500{{ end }}',
    '{{ if hasPrefix "dev:" .Env.APPROOV_ROLE }}#2ECC71{{ end }}',
    '#5E81AC',
  ]
  template = '{{ if .Env.APPROOV_ROLE }}{{ $parts := splitList ":" .Env.APPROOV_ROLE }} {{ index $parts 1 }} ({{ index $parts 0 | upper }}) {{ end }}'
```

The colours assume a dark background; change the hex values in
`background_templates` (and `foreground`) to suit your theme.

## Verify

```sh
APPROOV_ROLE="admin:my-account" oh-my-posh print primary --config=YOUR_THEME.toml --shell=zsh
```

You should see a red ` my-account (ADMIN) ` badge. With `APPROOV_ROLE` unset the
template is empty and oh-my-posh hides the segment.
