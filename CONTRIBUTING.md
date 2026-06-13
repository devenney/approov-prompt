# Contributing

Thanks for taking a look. This is a small personal project (see the disclaimer
in the [README](README.md)), but verifications and new shells are very welcome.

## The most useful thing you can do: verify a snippet

Several snippets were written on macOS and haven't been run on a live prompt.
The **Status** column in the [README](README.md) tracks this. If you run one and
it works, say so and it gets promoted to **Verified**.

To verify, set `APPROOV_ROLE` to each form and check the badge:

```sh
# bash / zsh / other POSIX shells
export APPROOV_ROLE=admin:my-account           # red    badge:  my-account (ADMIN)
export APPROOV_ROLE=automation:my-account      # orange badge:  my-account (AUTOMATION)
export APPROOV_ROLE=dev:my-account             # green  badge:  my-account (DEV)
export APPROOV_ROLE=other:my-account           # blue   badge:  my-account (OTHER)
unset APPROOV_ROLE                             # no badge at all
```

```powershell
# PowerShell
$env:APPROOV_ROLE = 'admin:my-account'         # red    badge:  my-account (ADMIN)
$env:APPROOV_ROLE = 'automation:my-account'    # orange badge:  my-account (AUTOMATION)
$env:APPROOV_ROLE = 'dev:my-account'           # green  badge:  my-account (DEV)
$env:APPROOV_ROLE = 'other:my-account'         # blue   badge:  my-account (OTHER)
Remove-Item Env:\APPROOV_ROLE                  # no badge
```

A snippet is working if:

- each role shows the right colour (admin red, automation orange, dev green,
  anything else blue);
- the account and upper-cased role read correctly (`account (ROLE)`);
- with `APPROOV_ROLE` unset, **nothing** renders and the prompt is unchanged;
- prompt width/cursor stays correct (no stray characters when you edit a long
  command line).

Then open an issue or PR noting the tool and version and your OS, e.g.
"verified on fish 3.7.1, macOS 14". That's all it takes.

## Adding a new shell or prompt tool

Keep the layout consistent:

1. Create a top-level directory named after the tool (e.g. `nushell/`).
2. Add the snippet file plus a short `README.md` with **install steps** and a
   **verify command**, mirroring the existing directories.
3. Add a row to the **Pick your prompt** table in the top-level
   [README](README.md), with an honest **Status**.

Conventions to match:

- Read `APPROOV_ROLE`, split on the first `:` into `role:account`.
- Use the shared palette: `#FF5555` admin, `#FFA500` automation, `#2ECC71` dev,
  `#5E81AC` everything else; foreground `#F5E0DC`. Colours assume a dark
  background.
- Render `account (ROLE)` with the role upper-cased.
- Render **nothing** when `APPROOV_ROLE` is unset.
- Prefer no runtime dependencies — a copy-paste snippet, not a package.

## Commits

This repo uses [Conventional Commits](https://www.conventionalcommits.org/).
Use a scope per shell where it makes sense, e.g.:

```
feat(fish): add role badge function
docs(starship): clarify module ordering
fix(bash): correct width markers in PS1
```

Keep each commit to a single logical change.
