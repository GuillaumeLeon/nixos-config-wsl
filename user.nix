{ lib, config, pkgs, ...}:

let 
  cfg = config.main-user;
in
{
  options.main-user = {
	  enable
		  = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
		default = "guillaume";
		description = ''
				username
		'';
		};

  };

	config = lib.mkIf cfg.enable {
  users.users.${cfg.userName} = {
    isNormalUser = true;
    initialPassword = "password";
    description = "default user";
    shell = pkgs.zsh;
  };
	};
}
