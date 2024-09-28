#
#  Git configuration
#

{ config, pkgs, vars, ... }:

{
  programs.git = {
    enable = true;
  };

  home-manager.users.${vars.user} = {
    programs.git = {
      enable = true;

      userName = "OCharnyshevich";
      userEmail = "oleg.charnyshevich.github@love4dev.com";

      extraConfig = {
        commit.gpgsign = true;
        gpg.format = "openpgp";
        gpg.program = "gpg";
        user.signingkey = "6293FAF829B9525D";

        # pull.rebase = true;
        # url = {
        #   "git@github.com:" = {
        #     insteadOf = "https://github.com/";
        #   };

        #   "ssh://git@gitlab.com/" = {
        #     insteadOf = "https://gitlab.com/";
        #   };
        # };
      };
    };
  };
}
