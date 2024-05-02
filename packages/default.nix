{
  lib,
  tmuxPlugins,
}:
tmuxPlugins.mkTmuxPlugin {
  pluginName = "tmuxst";
  version = "unstable-2024-05-02";
  src = ../.;
  meta = with lib; {
    license = licenses.mit;
    platforms = platforms.unix;
  };
}
