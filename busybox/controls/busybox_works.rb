title 'Tests to confirm busybox works as expected'

plan_origin = ENV['HAB_ORIGIN']
plan_name = input('plan_name', value: 'busybox')

control 'core-plans-busybox-works' do
  impact 1.0
  title 'Ensure busybox works as expected'
  desc '
  Verify busybox by ensuring that
  (1) its installation directory exists
  (2) all binaries return the expected version, apart from
  "true", "false", and "test" which do not return stdout
  '

  plan_installation_directory = command("hab pkg path #{plan_origin}/#{plan_name}")
  describe plan_installation_directory do
    its('exit_status') { should eq 0 }
    its('stdout') { should_not be_empty }
  end

  plan_pkg_version = plan_installation_directory.stdout.split("/")[5]
  full_suite = {
    "[" => {},
    "[[" => {},
    "acpid" => {},
    "add-shell" => {},
    "addgroup" => {},
    "adduser" => {},
    "adjtimex" => {},
    "arch" => {},
    "arp" => {},
    "arping" => {},
    "ash" => {},
    "awk" => {},
    "base64" => {},
    "basename" => {},
    "bc" => {},
    "beep" => {},
    "blkdiscard" => {},
    "blkid" => {},
    "blockdev" => {},
    "bootchartd" => {},
    "brctl" => {},
    "bunzip2" => {},
    "busybox" => {command_suffix: "", io: "stdout"},
    "bzcat" => {},
    "bzip2" => {},
    "cal" => {},
    "cat" => {},
    "chat" => {},
    "chattr" => {},
    "chgrp" => {},
    "chmod" => {},
    "chown" => {},
    "chpasswd" => {},
    "chpst" => {},
    "chroot" => {},
    "chrt" => {},
    "chvt" => {},
    "cksum" => {},
    "clear" => {},
    "cmp" => {},
    "comm" => {},
    "conspy" => {},
    "cp" => {},
    "cpio" => {},
    "crond" => {},
    "crontab" => {},
    "cryptpw" => {},
    "cttyhack" => {},
    "cut" => {},
    "date" => {},
    "dc" => {},
    "dd" => {},
    "deallocvt" => {},
    "delgroup" => {},
    "deluser" => {},
    "depmod" => {},
    "devmem" => {},
    "df" => {},
    "dhcprelay" => {},
    "diff" => {},
    "dirname" => {},
    "dmesg" => {},
    "dnsd" => {},
    "dnsdomainname" => {},
    "dos2unix" => {},
    "dpkg" => {},
    "dpkg-deb" => {},
    "du" => {},
    "dumpkmap" => {},
    "dumpleases" => {},
    "ed" => {},
    "egrep" => {},
    "eject" => {},
    "env" => {},
    "envdir" => {},
    "envuidgid" => {},
    "ether-wake" => {},
    "expand" => {},
    "expr" => {},
    "factor" => {},
    "fakeidentd" => {},
    "fallocate" => {},
    "fatattr" => {},
    "fbset" => {},
    "fbsplash" => {},
    "fdflush" => {},
    "fdformat" => {},
    "fdisk" => {},
    "fgconsole" => {},
    "fgrep" => {},
    "find" => {},
    "findfs" => {},
    "flock" => {},
    "fold" => {},
    "free" => {},
    "freeramdisk" => {},
    "fsck" => {},
    "fsck.minix" => {},
    "fsfreeze" => {},
    "fstrim" => {},
    "fsync" => {},
    "ftpd" => {},
    "ftpget" => {},
    "ftpput" => {},
    "fuser" => {},
    "getopt" => {},
    "getty" => {},
    "grep" => {},
    "groups" => {},
    "gunzip" => {},
    "gzip" => {},
    "halt" => {},
    "hd" => {},
    "hdparm" => {},
    "head" => {},
    "hexdump" => {},
    "hexedit" => {},
    "hostid" => {},
    "hostname" => {},
    "httpd" => {},
    "hush" => {},
    "hwclock" => {},
    "i2cdetect" => {},
    "i2cdump" => {},
    "i2cget" => {},
    "i2cset" => {},
    "i2ctransfer" => {},
    "id" => {},
    "ifconfig" => {},
    "ifdown" => {},
    "ifenslave" => {},
    "ifplugd" => {},
    "ifup" => {},
    "inetd" => {},
    "init" => {},
    "insmod" => {},
    "install" => {},
    "ionice" => {},
    "iostat" => {},
    "ip" => {},
    "ipaddr" => {},
    "ipcalc" => {},
    "ipcrm" => {},
    "ipcs" => {},
    "iplink" => {},
    "ipneigh" => {},
    "iproute" => {},
    "iprule" => {},
    "iptunnel" => {},
    "kbd_mode" => {},
    "kill" => {},
    "killall" => {},
    "killall5" => {},
    "klogd" => {},
    "last" => {},
    "less" => {},
    "link" => {},
    "linux32" => {},
    "linux64" => {},
    "linuxrc" => {},
    "ln" => {},
    "loadfont" => {},
    "loadkmap" => {},
    "logger" => {},
    "login" => {},
    "logname" => {},
    "logread" => {},
    "losetup" => {},
    "lpd" => {},
    "lpq" => {},
    "lpr" => {},
    "ls" => {},
    "lsattr" => {},
    "lsmod" => {},
    "lsof" => {},
    "lspci" => {},
    "lsscsi" => {},
    "lsusb" => {},
    "lzcat" => {},
    "lzma" => {},
    "lzop" => {},
    "makedevs" => {},
    "makemime" => {},
    "man" => {},
    "md5sum" => {},
    "mdev" => {},
    "mesg" => {},
    "microcom" => {},
    "mkdir" => {},
    "mkdosfs" => {},
    "mke2fs" => {},
    "mkfifo" => {},
    "mkfs.ext2" => {},
    "mkfs.minix" => {},
    "mkfs.vfat" => {},
    "mknod" => {},
    "mkpasswd" => {},
    "mkswap" => {},
    "mktemp" => {},
    "modinfo" => {},
    "modprobe" => {},
    "more" => {},
    "mount" => {},
    "mountpoint" => {},
    "mpstat" => {},
    "mt" => {},
    "mv" => {},
    "nameif" => {},
    "nanddump" => {},
    "nandwrite" => {},
    "nbd-client" => {},
    "nc" => {},
    "netstat" => {},
    "nice" => {},
    "nl" => {},
    "nmeter" => {},
    "nohup" => {},
    "nologin" => {},
    "nproc" => {},
    "nsenter" => {},
    "nslookup" => {},
    "ntpd" => {},
    "od" => {},
    "openvt" => {},
    "partprobe" => {},
    "passwd" => {},
    "paste" => {},
    "patch" => {},
    "pgrep" => {},
    "pidof" => {},
    "ping" => {},
    "ping6" => {},
    "pipe_progress" => {},
    "pivot_root" => {},
    "pkill" => {},
    "pmap" => {},
    "popmaildir" => {},
    "poweroff" => {},
    "powertop" => {},
    "printenv" => {},
    "printf" => {},
    "ps" => {},
    "pscan" => {},
    "pstree" => {},
    "pwd" => {},
    "pwdx" => {},
    "raidautorun" => {},
    "rdate" => {},
    "rdev" => {},
    "readahead" => {},
    "readlink" => {},
    "readprofile" => {},
    "realpath" => {},
    "reboot" => {},
    "reformime" => {},
    "remove-shell" => {},
    "renice" => {},
    "reset" => {},
    "resize" => {},
    "resume" => {},
    "rev" => {},
    "rm" => {},
    "rmdir" => {},
    "rmmod" => {},
    "route" => {},
    "rpm" => {},
    "rpm2cpio" => {},
    "rtcwake" => {},
    "run-init" => {},
    "run-parts" => {},
    "runlevel" => {},
    "runsv" => {},
    "runsvdir" => {},
    "rx" => {},
    "script" => {},
    "scriptreplay" => {},
    "sed" => {},
    "sendmail" => {},
    "seq" => {},
    "setarch" => {},
    "setconsole" => {},
    "setfattr" => {},
    "setfont" => {},
    "setkeycodes" => {},
    "setlogcons" => {},
    "setpriv" => {},
    "setserial" => {},
    "setsid" => {},
    "setuidgid" => {},
    "sha1sum" => {},
    "sha256sum" => {},
    "sha3sum" => {},
    "sha512sum" => {},
    "showkey" => {},
    "shred" => {},
    "shuf" => {},
    "slattach" => {},
    "sleep" => {},
    "smemcap" => {},
    "softlimit" => {},
    "sort" => {},
    "split" => {},
    "ssl_client" => {},
    "start-stop-daemon" => {},
    "stat" => {},
    "strings" => {},
    "stty" => {},
    "su" => {},
    "sulogin" => {},
    "sum" => {},
    "sv" => {},
    "svc" => {},
    "svlogd" => {},
    "svok" => {},
    "swapoff" => {},
    "swapon" => {},
    "switch_root" => {},
    "sync" => {},
    "sysctl" => {},
    "syslogd" => {},
    "tac" => {},
    "tail" => {},
    "tar" => {},
    "taskset" => {},
    "tc" => {},
    "tcpsvd" => {},
    "tee" => {},
    "telnet" => {},
    "telnetd" => {},
    "tftp" => {},
    "tftpd" => {},
    "time" => {},
    "timeout" => {},
    "top" => {},
    "touch" => {},
    "tr" => {},
    "traceroute" => {},
    "traceroute6" => {},
    "truncate" => {},
    "ts" => {},
    "tty" => {},
    "ttysize" => {},
    "tunctl" => {},
    "ubiattach" => {},
    "ubidetach" => {},
    "ubimkvol" => {},
    "ubirename" => {},
    "ubirmvol" => {},
    "ubirsvol" => {},
    "ubiupdatevol" => {},
    "udhcpc" => {},
    "udhcpd" => {},
    "udpsvd" => {},
    "uevent" => {},
    "umount" => {},
    "uname" => {},
    "unexpand" => {},
    "uniq" => {},
    "unix2dos" => {},
    "unlink" => {},
    "unlzma" => {},
    "unshare" => {},
    "unxz" => {},
    "unzip" => {},
    "uptime" => {},
    "users" => {},
    "usleep" => {},
    "uudecode" => {},
    "uuencode" => {},
    "vconfig" => {},
    "vi" => {},
    "vlock" => {},
    "volname" => {},
    "w" => {},
    "wall" => {},
    "watch" => {},
    "watchdog" => {},
    "wc" => {},
    "wget" => {},
    "which" => {},
    "who" => {},
    "whoami" => {},
    "whois" => {},
    "xargs" => {},
    "xxd" => {},
    "xz" => {},
    "xzcat" => {},
    "yes" => {},
    "zcat" => {},
    "zcip" => {},
  }

  full_suite.each do |binary_name, value|
    command_suffix = value.has_key?(:command_suffix) ? "#{value[:command_suffix]} 2>\&1" : "--help 2>\&1"
    command_full_path = File.join(plan_installation_directory.stdout.strip, "bin", binary_name)
    describe command("#{command_full_path} #{command_suffix}") do
      its('exit_status') { should eq 0 }
      its('stdout') { should match /BusyBox v#{plan_pkg_version}/ }
    end
  end

  # the following don't produce any stderr, stdout
  {
    "false" => {exit_pattern: /^[^0]$/ },
    "test"  => {command_suffix: "1 == 1"},
    "true"  => {},
  }.each do |binary_name, value|
    command_suffix = value.has_key?(:command_suffix) ? "#{value[:command_suffix]} 2>\&1" : "--help 2>\&1"
    pattern = value[:pattern] || /BusyBox v#{plan_pkg_version}/
    exit_pattern = value[:exit_pattern] || /^0$/
    command_full_path = File.join(plan_installation_directory.stdout.strip, "bin", binary_name)
    describe command("#{command_full_path} #{command_suffix}") do
      its('exit_status') { should cmp exit_pattern }
      its('stdout') { should be_empty }
    end
  end

  {
    "echo" => {},
  }.each do |binary_name, value|
    command_suffix = value.has_key?(:command_suffix) ? "#{value[:command_suffix]} 2>\&1" : "--help 2>\&1"
    command_full_path = File.join(plan_installation_directory.stdout.strip, "bin", binary_name)
    describe command("#{command_full_path} #{command_suffix}") do
      its('exit_status') { should eq 0 }
      its('stdout') { should match /--help/ }
    end
  end
end
