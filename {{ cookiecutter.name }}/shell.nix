{
  pkgs ? import <nixpkgs> { },
}:

pkgs.mkShell {
  packages = with pkgs; [
    just
    libresprite
    love
    lua
    lua-language-server
    tiled
  ];
}
