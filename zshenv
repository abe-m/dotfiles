export ZDOTDIR=~/.zsh

#export proxy=http://proxy10.silk.ntts.co.jp:18080
#export ftp_proxy=http://proxy10.silk.ntts.co.jp:18080
#export http_proxy=http://proxy10.silk.ntts.co.jp:18080
#export https_proxy=http://proxy10.silk.ntts.co.jp:18080

export CMD1='date; ssh localhost cat /etc/redhat-release; which pgbench pg_config pg_rman psql; psql --version; pg_config ; env | egrep -e LANG -e LOCALE -e PG -e PATH -e CMD'
export CMD2='yum list installed | egrep -i -e '^pg' -e postgres -e memcache -e orafce -e dblink -e syncdb -e java -e jdk -e jdbc -e ant -e junit'

export XMODIFIERS="@im=ibus"
export GTK_IM_MODULE="ibus"
export QT_IM_MODULE="xim"

export GOPATH=/home/abe/.go
export LIBVIRT_DEFAULT_URI=qemu:///system
##export LANG=ja_JP.UTF-8
#export LANG=ja_JP.eucJP
#export LOCALE=ja_JP.eucJP
#export LANG=C
#export LOCALE=C
export LANG=ja_JP.utf8
export LOCALE=ja_JP.utf8
export EDITOR=vi
##export PATH=/home/abe/.chefdk/gem/ruby/2.1.0/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export PATH=/home/abe/.go/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
export MANPATH=/usr/local/man:/usr/share/man
