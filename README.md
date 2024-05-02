<div align="center">
<h1>
  Tmuxst
</h1>

<h4>A slick status bar for tmux</h4>
<img src="./tmux_bar.png"></img>
</div>

## ✨ Features

- Integrations with gitmux for git status

## 🛠️ Requirements

- gitmux
- [tmux](https://github.com/tmux/tmux) (>= 3.2)
- [tpm](https://github.com/tmux-plugins/tpm)

## 💻 Install

### Installation with [tpm](https://github.com/tmux-plugins/tpm)

Add the following line to your `.tmux.conf`.

```tmux
set -g @plugin 'percygt/tmuxst'
```

### Installation via [nix](https://github.com/NixOS/nix) `overlay`

Add tmuxst as a flake input:

```nix
{
  inputs = {
    tmuxst.url = "github:percygt/tmuxst";
  };
  outputs = { tmuxst, ... }: { };
}
```

Then, use the flake's `overlay` attribute:

```nix
{
  outputs = { tmuxst, nixpkgs, ... }:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ tmuxst.overlays.default ];
    };
  in
    # You can now reference pkgs.tmuxPlugins.tmuxst.
  { }
}
```

After that, `tmuxst` can now be used as a normal tmux plugin within the
`nixpkgs`.

## ⚙️ Customization

| Variable  | Default value | Description |
| :-------- | :------------ | :---------- |
| `@color1` | `"#96c7f1"`   | WHITE       |
| `@color2` | `"#aaa8af"`   | GREY        |
| `@color3` | `"#000000"`   | BLACK       |
| `@color4` | `"#120d22"`   | NOCTURNE    |
| `@color5` | `"#0e1a60"`   | AZURE       |
| `@color6` | `"#b4befe"`   | LAVENDER    |
| `@color7` | `"#fab387"`   | PEACH       |

## License

MIT
