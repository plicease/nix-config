{ pkgs }:
pkgs.runCommand "findutils-prefixed" {} ''
  mkdir -p $out/bin
  ln -s ${pkgs.findutils}/bin/find $out/bin/gfind
  ln -s ${pkgs.findutils}/bin/xargs $out/bin/gxargs
''
