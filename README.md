# approov-prompt

A prompt segment that shows your active [Approov](https://approov.io/) account
and role as a colour-coded badge, so you can tell at a glance which account your
commands are about to hit.

## How it works

The Approov CLI selects a role against an account with:

```sh
eval `approov role <role> <account>`
```

which exports `APPROOV_ROLE` in the form `role:account`. The segment reads that
variable and renders an `account (ROLE)` badge, coloured by role:

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

If `APPROOV_ROLE` is unset, the segment renders nothing.

```sh
eval `approov role admin my-account`   # my-account (ADMIN), red badge
eval `approov role dev my-account`     # my-account (DEV), green badge
```

## Shells

Currently ships an oh-my-posh segment; see [oh-my-posh/](oh-my-posh/) for setup.
Other shells (starship, fish, plain bash/zsh) may follow.

## License

[MIT](LICENSE)
