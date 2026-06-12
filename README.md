# approov-prompt

Show your active [Approov](https://approov.io/) account and role as a
colour-coded badge in your shell prompt, so you can tell at a glance which
account your commands are about to hit — and notice immediately when you're in
`admin`.

```
 my-account (ADMIN)      ← red
 my-account (DEV)        ← green
```

## How it works

The Approov CLI selects a role against an account:

```sh
eval "$(approov role <role> <account>)"      # Unix shells
set APPROOV_ROLE=<role>:<account>            # Windows (cmd)
$env:APPROOV_ROLE = '<role>:<account>'       # Windows (PowerShell)
```

This exports `APPROOV_ROLE` in the form `role:account`. Each snippet here reads
that variable and renders an `account (ROLE)` badge, coloured by role:

| Role          | Colour |
| ------------- | ------ |
| `admin`       | red    |
| `automation`  | orange |
| `dev`         | green  |
| anything else | blue   |

When `APPROOV_ROLE` is unset, the badge renders nothing.

```sh
eval "$(approov role admin my-account)"   # my-account (ADMIN), red badge
eval "$(approov role dev   my-account)"   # my-account (DEV),   green badge
```

## Pick your prompt

These are copy-paste snippets, one per prompt tool — there's no installer and
nothing to depend on. Grab the directory for your setup:

| Prompt tool                                    | Snippet                                     |
| ---------------------------------------------- | ------------------------------------------- |
| [oh-my-posh](https://ohmyposh.dev/)            | [oh-my-posh/](oh-my-posh/)                  |
| [starship](https://starship.rs/)               | [starship/](starship/)                      |
| [powerlevel10k](https://github.com/romkatv/powerlevel10k) | [powerlevel10k/](powerlevel10k/) |
| zsh (no framework)                             | [zsh/](zsh/)                                |
| bash                                           | [bash/](bash/)                              |
| [fish](https://fishshell.com/)                 | [fish/](fish/)                              |
| PowerShell                                     | [powershell/](powershell/)                  |

Each directory has its own README with install steps and a verify command. The
colours assume a dark background and use the same palette throughout; tweak the
hex values to suit your theme.

## License

[MIT](LICENSE)
