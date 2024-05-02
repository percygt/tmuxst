<div align="center">
<h1>
  Tmuxst
</h1>

</p>
   <a href="https://github.com/percygt/tmuxst/stargazers">
      <img src="https://img.shields.io/github/stars/percygt/tmuxst?color=ca9ee6&labelColor=303446&style=for-the-badge">
   </a>
   <a href="https://github.com/percygt/tmuxst/blob/main">
      <img src="https://img.shields.io/github/repo-size/percygt/tmuxst?color=fab387&labelColor=303446&style=for-the-badge&logo=github&logoColor=fab387">
   </a>
</p>
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
    tmuxinoicer.url = "github:percygt/tmuxinoicer";
  };
  outputs = { tmuxinoicer, ... }: { };
}
```

Then, use the flake's `overlay` attribute:

```nix
{
  outputs = { tmuxinoicer, nixpkgs, ... }:
  let
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      overlays = [ tmuxinoicer.overlays.default ];
    };
  in
    # You can now reference pkgs.tmuxPlugins.tmuxinoicer.
  { }
}
```

After that, `tmuxinoicer` can now be used as a normal tmux plugin within the
`nixpkgs`.

## ⚙️ Customization

| Variable   | Default value |
| :--------- | :------------ |
| `@color-1` | `"#96c7f1"`   |
| `@color-2` | `"#aaa8af"`   |
| `@color-3` | `"#000000"`   |
| `@color-4` | `"#120d22"`   |
| `@color-5` | `"#0e1a60"`   |
| `@color-6` | `"#b4befe"`   |
| `@color-7` | `"#fab387"`   |

## License

MIT
