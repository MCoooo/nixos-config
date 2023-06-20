{
  programs.git = {
    enable = true;
    userName = "mcoooo";
    userEmail = "martin.coomber@hotmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };
}
