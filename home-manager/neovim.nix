{lib, ...}:
{
programs.neovim = {
  enable = true;
  viAlias = true;
  vimAlias = true;
  extraConfigs = lib.fileContents ../dotfiles/.config/nvim/init.lua;
};
}

