{ pkgs }:
pkgs.runCommand "inetutils-minimal" {} ''
  mkdir -p $out/bin

  for cmd in \
    telnet rsh rlogin rexec rcp ftp dnsdomainname
  do
    ln -s ${pkgs.inetutils}/bin/$cmd $out/bin/$cmd
  done
''
