{
  programs.git = {
    enable = true;
    userName = "mcoooo";
    userEmail = "martin.coomber@hotmail.com";
    extraConfig = {
      credential.helper = "libsecret";
    };
  };
}
