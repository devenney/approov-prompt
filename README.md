<h1 align="center">approov-prompt</h1>

<p align="center">
  Show your active <a href="https://approov.io/">Approov</a> account and role as a
  colour-coded badge in your shell prompt — so you always know which account your
  next command will hit, and you notice the moment you're in <code>admin</code>.
</p>

<p align="center">
  <img src="docs/preview.svg" width="430"
       alt="Approov role badges: my-account (ADMIN) in red, (AUTOMATION) in orange, (DEV) in green, and any other role in blue." />
</p>

> [!NOTE]
> This is a personal project. It is **not** an official Approov product and is
> not affiliated with, endorsed by, or supported by Approov. It only reads the
> `APPROOV_ROLE` environment variable — it never talks to Approov. Use at your
> own discretion.

## How it works

Everything here reads one environment variable, `APPROOV_ROLE`, in the form
`role:account`. Each snippet renders an `account (ROLE)` badge, coloured by
role:

| Role            | Colour |
| --------------- | ------ |
| `admin`         | red    |
| `automation`    | orange |
| `dev`           | green  |
| _anything else_ | blue   |

When `APPROOV_ROLE` is unset, the badge renders nothing.

## Pick your prompt

These are copy-paste snippets — one per prompt tool, with no installer and
nothing to depend on. Grab the directory for your setup:

| Prompt tool                                               | Snippet                          | Status             |
| --------------------------------------------------------- | -------------------------------- | ------------------ |
| [oh-my-posh](https://ohmyposh.dev/)                       | [oh-my-posh/](oh-my-posh/)       | Verified           |
| zsh (no framework)                                        | [zsh/](zsh/)                     | Verified           |
| bash                                                      | [bash/](bash/)                   | Verified           |
| [starship](https://starship.rs/)                          | [starship/](starship/)           | Needs verification |
| [powerlevel10k](https://github.com/romkatv/powerlevel10k) | [powerlevel10k/](powerlevel10k/) | Needs verification |
| [fish](https://fishshell.com/)                            | [fish/](fish/)                   | Needs verification |
| PowerShell                                                | [powershell/](powershell/)       | Needs verification |

Each directory has its own README with install steps and a verify command. The
colours assume a dark background and use the same palette throughout; tweak the
hex values to suit your theme.

## Does it work in your shell?

The **Status** column is an honest one: the snippets were authored on macOS, so
only oh-my-posh, zsh, and bash have been run end-to-end. The rest follow each
tool's documented conventions but haven't yet been rendered on a real prompt.

If you run one of the unverified snippets — or use a shell that isn't listed —
please confirm it works and let me know. Even a one-line _"verified on fish 3.7,
macOS"_ is a real help.

See **[CONTRIBUTING.md](CONTRIBUTING.md)** for how to verify a snippet, what the
badge should look like for each role, and how to add a new shell.

## License

[MIT](LICENSE)
