{
  description = "Tmuxst";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    flake-utils,
    nixpkgs,
  }: let
    overlays = final: prev: let
      tmuxst = prev.callPackage ./packages/default.nix {};
    in {
      tmuxPlugins =
        prev.tmuxPlugins
        // {
          inherit tmuxst;
        };
    };
  in
    {
      overlays.default = overlays;
    }
    // (flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        tmuxst = pkgs.callPackage ./packages/default.nix {};
      in {
        packages.default = tmuxst;

        devShells.default = let
          tmux_conf =
            pkgs.writeText "tmux.conf"
            ''
              set -g prefix ^A
              set  -g default-terminal "tmux-256color"
              set  -g base-index      1
              setw -g pane-base-index 1
              set-option -g terminal-overrides ',xterm-256color:RGB'
              set terminal-overrides "xterm-256color:RGB"
              set -as terminal-overrides ',*:Smulx=\E[4::%p1%dm'  # undercurl support
              set -as terminal-overrides ',*:Setulc=\E[58::2::%p1%{65536}%/%d::%p1%{256}%/%{255}%&%d::%p1%{255}%&%d%;m'  # underscore colours - needs tmux-3.0
              set -g allow-passthrough on
              set -ga update-environment TERM
              set -ga update-environment TERM_PROGRAM
              set -g set-clipboard on
              set -g pane-active-border-style 'fg=magenta,bg=default'
              set -g pane-border-style 'fg=brightblack,bg=default'
              set -g status-position top
              run-shell ./tmuxst.tmux
            '';
        in
          pkgs.mkShell {
            buildInputs = with pkgs; [tmux gitmux];

            shellHook = ''
              TMUX=
              TMUX_TMPDIR=
              ${pkgs.tmux}/bin/tmux source-file ${tmux_conf}
              ${pkgs.tmux}/bin/tmux
              ${pkgs.tmux}/bin/tmux bind R source-file ${tmux_conf}
            '';
          };
      }
    ));
}
