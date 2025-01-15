{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    just
    love
    lua
    lua-language-server
  ];
}
