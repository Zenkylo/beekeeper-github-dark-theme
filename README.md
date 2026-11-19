# GitHub Dark (VSCode) for Beekeeper Studio

A dark [Beekeeper Studio](https://www.beekeeperstudio.io) theme that matches the
VSCode **GitHub Dark (Web Based)** color theme, so your database client looks like your editor.

<!-- Add a screenshot here, e.g. ![Screenshot](screenshot.png) -->

## Features

- Editor, sidebar, activity rail, title bar, status bar, tabs and menus use the same
  colors as the VSCode theme (`#090c10` editor, `#0d1117` panels, `#161b22` chrome, `#30363d` borders).
- GitHub Dark syntax colors in the SQL editor: red keywords, light blue strings,
  blue numbers/operators/fields, purple functions, orange types and aliases.
- Green primary buttons like VSCode, with a bright green (`#0cf388`) accent on the table selection range.

This is a dark-only theme. In light mode Beekeeper Studio uses its default colors.

## Installation

### From Beekeeper Studio

Open **View → Appearance**, find **GitHub Dark (VSCode)** in the community themes and install it.

### Manually

1. Download `github-dark-vscode-<version>.zip` from the
   [latest release](../../releases/latest) and extract it to a folder named `github-dark-vscode` in
   your themes directory:
   - macOS: `~/Library/Application Support/beekeeper-studio/themes`
   - Linux: `~/.config/beekeeper-studio/themes`
   - Windows: `%APPDATA%\beekeeper-studio\themes`
2. Enable unlisted themes: **View → Appearance → Configure...** and turn on **Unlisted Themes**.
3. Restart Beekeeper Studio and select **GitHub Dark (VSCode)** under **View → Appearance**.

## Development

Symlink this folder into your themes directory (the link name must match the manifest `id`):

```sh
ln -s "$(pwd)" "$HOME/Library/Application Support/beekeeper-studio/themes/github-dark-vscode"
```

Changes to `style.css` are hot reloaded.

## Releasing

```sh
bin/make-release.sh 1.0.1
```

This updates the version in `manifest.json`, commits, tags `v1.0.1` and pushes. The
`release` GitHub Actions workflow then publishes a release with `manifest.json` and
`github-dark-vscode-1.0.1.zip` attached, which is what Beekeeper Studio downloads.

## Credits

Colors from the [GitHub Dark](https://github.com/primer/github-vscode-theme) VSCode theme
by Primer (MIT). Licensed under the MIT License, see [LICENSE](LICENSE).
