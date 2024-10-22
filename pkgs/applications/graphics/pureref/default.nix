{ lib, appimageTools, requireFile, }:

appimageTools.wrapType1 rec {
  pname = "pureref";
  version = "2.0.3";

  src = requireFile rec {
    name = "PureRef-2.0.3_x64.Appimage";
    hash = "sha256-0iR1cP2sZvWWqKwRAwq6L/bmIBSYHKrlI8u8V2hANfM=";
    message = ''
      In order to install PureRef, you must first comply to their license and contribution amount.
      You may choose any amount, even free (select Custom and change the amount to \$0).

      1. Go to https://pureref.com/download.php?forcePlatform=linux
      2. Select Linux and choose Portable in the dropdown
      3. Enter a contribution amount
      4. Click the Download button

      Once you have downloaded the file, please use the following
      commands then re-run the installation:

      cd ~/Downloads
      nix-prefetch-url file://\$PWD/${name}
    '';
  };

  meta = with lib; {
    description = "Reference Image Viewer";
    homepage = "https://www.pureref.com";
    license = licenses.unfree;
    maintainers = with maintainers; [ elnudev ];
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
