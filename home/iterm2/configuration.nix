{ ... }:

{
  source = ./iterm2/com.googlecode.iterm2.plist;
  target = "./Library/Preferences/homemanager.com.googlecode.iterm2.plist";
  onChange = ''
    rm -f ./Library/Preferences/com.googlecode.iterm2.plist
    cp ./Library/Preferences/homemanager.com.googlecode.iterm2.plist ./Library/Preferences/com.googlecode.iterm2.plist
    chmod u+w ./Library/Preferences/com.googlecode.iterm2.plist
  '';
}
