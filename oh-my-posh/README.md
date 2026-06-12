# oh-my-posh

Renders the Approov role badge in [oh-my-posh](https://ohmyposh.dev/) from the
`APPROOV_ROLE` environment variable.

## Adding the segment

[`segment.toml`](segment.toml) defines a single `[[blocks]]` entry. Copy it into
the `blocks` array of your theme, wherever you want the badge to sit. The colours
assume a dark background; change the hex values in `background_templates` to suit
your theme.

If you keep your theme under version control and don't want to copy the block by
hand, you can pull it in at build time, for example with a templated config that
inlines the raw file:

```
https://raw.githubusercontent.com/devenney/approov-prompt/main/oh-my-posh/segment.toml
```

## Usage

Select a role as usual and the badge appears:

```sh
eval `approov role admin my-account`   # my-account (ADMIN), red badge
```

With `APPROOV_ROLE` unset the segment is empty and oh-my-posh hides it.
