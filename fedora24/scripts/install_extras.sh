#!/usr/bin/env bash
EXTRAS=/tmp/extras

cd $EXTRAS

if [ ! -f $EXTRAS/jdk-8u111-linux-x64.rpm ]
then
	wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u111-b14/jdk-8u111-linux-x64.rpm"
fi


if [ ! -f $EXTRAS/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm ]
then
  wget https://dl.dropboxusercontent.com/u/18038046/ora/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm 
fi

if [ ! -f $EXTRAS/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm ]
then
 wget https://dl.dropboxusercontent.com/u/18038046/ora/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
fi


if [ ! -f $EXTRAS/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm ]
then
 wget https://dl.dropboxusercontent.com/u/18038046/ora/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm
fi

if [ ! -f $EXTRAS/ideaIU-2016.2.5.tar.gz ]
then
 wget https://download.jetbrains.com/idea/ideaIU-2016.2.5.tar.gz
fi

if [ ! -f $EXTRAS/slack-2.2.1-0.1.fc21.x86_64.rpm ]
then
 wget https://downloads.slack-edge.com/linux_releases/slack-2.2.1-0.1.fc21.x86_64.rpm
fi


if [ ! -d /opt/intellij ]
then
  sudo mkdir -p /opt/intellij
fi


sudo tar zxf ideaIU-2016.2.5.tar.gz -C /opt/intellij

if [ ! -f /usr/share/applications]
then 
cat <<-EOF > /usr/share/applications/intellij.desktop
	#!/usr/bin/env xdg-open
	[Desktop Entry]
	Name=Intellij IDEA
	EXEC="/opt/intellij/idea-IU-162.2228.15/bin/idea.sh" %f
	ICON=/opt/intellij/idea-IU-162.2228.15/bin/idea.png
	Categoris=Development;IDE;
	EOF
fi	

sudo rpm -ivh $EXTRAS/jdk-8u111-linux-x64.rpm
sudo rpm -ivh $EXTRAS/slack-2.2.1-0.1.fc21.x86_64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
sudo rpm -ivh $EXTRAS/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm



sudo mv $EXTRAS/oracle_profile.sh /etc/profile.d
