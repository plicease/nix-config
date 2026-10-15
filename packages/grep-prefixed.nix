{ pkgs }:
pkgs.runCommand "grep-prefixed" {} ''
  mkdir -p $out/bin
  ln -s ${pkgs.gnugrep}/bin/grep $out/bin/ggrep
  ln -s ${pkgs.gnugrep}/bin/egrep $out/bin/gegrep
  ln -s ${pkgs.gnugrep}/bin/fgrep $out/bin/gfgrep
''
