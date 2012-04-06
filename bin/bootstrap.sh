#!/usr/bin/env sh

USAGE_MSG="\nBOOTSTRAP WILL RECONFIGURE YOUR SYSTEM!!  USE WITH CAUTION!!\n\nUsage: bootstrap.sh <username> --proceed\n"

# This script is for bootstrapping new systems.
# To use: 
#   scp bootstrap.sh new_system:
#   ssh new_system
#   sudo bootstrap.sh <username> --proceed

# ----- check command-line parameters -----
if [ $# != 2 ]
then
  echo $USAGE_MSG
  exit 1
fi

if [ $2 != "--proceed" ]
then
  echo $USAGE_MSG
  exit 1
fi

# ----- core variables -----
export BOOTSTRAP_USER=$1
export BOOTSTRAP_HOME="/home/$BOOTSTRAP_USER"

# ----- starting the bootstrap... -----
echo "======================================================="
echo "Starting bootstrap for $BOOTSTRAP_USER at $BOOTSTRAP_HOME"
date

echo "======================================================="
echo "Running apt-get update..."
sudo apt-get update -y -q -q

echo "======================================================="
echo "Running apt-get install git-core..."
sudo apt-get install git-core -y -qq
sudo apt-get install python-software-properties -y -qq

echo "======================================================="
echo "Installing Ruby 1.9"

# ----- install support libraries -----
sudo apt-get -y -qq --force-yes install libxslt1-dev libxml2-dev sqlite3 libsqlite3-dev
sudo apt-get -y -qq --force-yes install libreadline5-dev zlib1g-dev libssl-dev
sudo apt-get -y -qq --force-yes install build-essential texinfo wget
sudo apt-get -y -qq --force-yes install openssl libopenssl-ruby1.9.1 ruby1.9.1-dev 

# ----- install ruby -----
sudo apt-get -y -qq --force-yes install ruby1.9.1 
sudo ln -s /usr/bin/ruby1.9.1 /usr/bin/ruby

# ----- install ruby gems -----
wget http://production.cf.rubygems.org/rubygems/rubygems-1.8.21.tgz --quiet
if [ ! -s rubygems-1.8.21.tgz ] ; then exit 1 ; fi

tar xf rubygems-1.8.21.tgz 
cd rubygems-1.8.21
sudo ruby setup.rb --no-rdoc --no-ri
if [ ! -s /usr/bin/gem1.9.1 ] ; then exit 1 ; fi

sudo ln -s /usr/bin/gem1.9.1 /usr/bin/gem
sudo gem update --system --no-rdoc --no-ri --quiet

cd ..
rm rubygems*tgz
rm -r rubygems-1*

echo "======================================================="
echo "Install Puppet and Utility Gems..."
sudo gem install --no-rdoc --no-ri --quiet wirble
sudo gem install --no-rdoc --no-ri --quiet awesome_print 
sudo gem install --no-rdoc --no-ri --quiet hirb 
sudo gem install --no-rdoc --no-ri --quiet drx 
sudo gem install --no-rdoc --no-ri --quiet interactive_editor
sudo gem install --no-rdoc --no-ri --quiet puppet 
sudo gem install --no-rdoc --no-ri --quiet bundler 

echo "======================================================="
echo "Setting up util directories..."
cd $BOOTSTRAP_HOME
mkdir -p util; cd util
if [ -d base_util ]
then
  cd base_util
  git pull
  cd ..
else
  git clone git://github.com/andyl/base_util.git
fi
base_util/init

echo "======================================================="
echo "Setting up puppet directories..."
cd $BOOTSTRAP_HOME
mkdir -p data
cd data
if [ -d puppet ] 
then
  cd puppet
  git pull
  cd ..
else
  git clone git://github.com/andyl/puppet.git
fi
sudo puppet/init $BOOTSTRAP_HOME

echo "======================================================="
echo "Running puppet configurator..."
cd $BOOTSTRAP_HOME
sudo puppet apply .puppet/manifests/bootstrap.pp 

echo "======================================================="
echo "Setting file ownership"
cd /home
sudo chown -R $BOOTSTRAP_USER $BOOTSTRAP_USER
sudo chgrp -R $BOOTSTRAP_USER $BOOTSTRAP_USER

echo "======================================================="
echo "Finished bootstrap for $BOOTSTRAP_USER at $BOOTSTRAP_HOME"
date
echo ""
