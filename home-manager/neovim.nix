{lib, pkgs, ...}:
let 
 configFolder = pkgs.runCommandNoCC "config" {} ''
    mkdir -p $out/neovim-config
    cp -r ../dotfiles/.config/nvim $out/neovim-config
  '';
in
{
environment.systemPackages = [ configFolder ];
programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfigs = lib.fileContents ../neovim-config/init.lua;
};
}

