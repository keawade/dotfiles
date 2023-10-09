# Bin Scripts

## `tmux-sessionizer`

Modified from [ThePrimeagen's `tmux-sessionizer`][tmux-sessionizer-original] for
configurability.

This script depends on [`fzf`][fzf].

| Variable                       | Description                                                                                      | Default | Required |
|--------------------------------|--------------------------------------------------------------------------------------------------|---------|----------|
| `TMUX_SESSIONIZER_DIRS`        | Delimited string of directories to check for sessions if a directory is not specified explicitly |         | Yes      |
| `TMUX_SESSIONIZER_IFS`         | Delimiter to use when parsing `TMUX_SESSIONIZER_DIRS`                                            | `,`     | No       |
| `TMUX_SESSIONIZER_TRIM_PREFIX` | Prefix to trim from items listed in the interactive session                                      | `$HOME` | No       |

[tmux-sessionizer-original]: https://github.com/ThePrimeagen/.dotfiles/blob/602019e902634188ab06ea31251c01c1a43d1621/bin/.local/scripts/tmux-sessionizer
[fzf]: https://github.com/junegunn/fzf
