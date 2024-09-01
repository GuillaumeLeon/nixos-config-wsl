{...}:
{
programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfig = lib.fileContents ../dotfiles/.config/nvim/init.lua;
};
}

