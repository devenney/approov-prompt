# starship

Renders the Approov role badge in [starship](https://starship.rs/) from the
`APPROOV_ROLE` environment variable, using `custom` modules.

## Why four modules

starship applies a single `style` per module and can't recolour a module based
on its value. So [`starship.toml`](starship.toml) defines one `custom` module
per role — `admin`, `automation`, `dev`, and a catch-all `other` — each gated by
a `when` test on `${APPROOV_ROLE%%:*}`. Only the module whose role matches runs,
so exactly one badge renders at a time.

## Add the modules

Copy the contents of [`starship.toml`](starship.toml) into your
`~/.config/starship.toml`.

The default starship `format` includes `$custom`, which renders all custom
modules, so the badge appears automatically. To pin its position, reference the
modules explicitly in `format`:

```toml
format = "${custom.approov_admin}${custom.approov_automation}${custom.approov_dev}${custom.approov_other}$all"
```

## Verify

```sh
APPROOV_ROLE="admin:my-account" starship prompt
```

You should see a red ` my-account (ADMIN) ` badge. With `APPROOV_ROLE` unset
every `when` test fails and no badge renders.

## Notes

- The modules run their `command`/`when` in `sh`, so `APPROOV_ROLE` must be
  exported (the Approov CLI's `eval` does this). starship passes the parent
  environment through to module shells.
- Colours assume a dark background; adjust the `bg:`/`fg:` hex values in each
  `style` to taste.
