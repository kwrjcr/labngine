#!/bin/sh

# update ubuntu, clean Upgrade ubuntu
UPDATE="apt-get update"
INSTALL="apt-get install -y"
UPGRADE="apt-get upgrade -y"
DIST_UPGRADE="apt-get dist-upgrade -y"
CLEANUP="apt-get clean apt-get autoclean"

# MESSAGE
MESSAGE=" ==> Install package"
UPDATE_MESSAGE=" ==>  Update"
UPGRADE_MESSAGE=" ==> Upgrade"
CLEAN_MESSAGE=" ==> start Clean Ubuntu"

# End Message
END_UPDATE_MESSAGE=" Update Done !"
END_UPGRADE_MESSAGE="Upgrade Done !"
END_MESSAGE="Install package Done !"
END_CLEAN="Clean Done !"


# Ubuntu style
style_ubuntu(){
  echo ""
  echo ""
}


# update UBUNTU
update(){
  style_ubuntu
  echo $UPDATE_MESSAGE
  style_ubuntu

  $UPDATE

  style_ubuntu
  echo $END_UPDATE_MESSAGE
}

# Clean ubuntu
clean_ubuntu(){
  style_ubuntu
  echo $CLEAN_MESSAGE
  style_ubuntu

  if [[ $CLEANUP ]]; then
    echo "Waithing clean up for Ubuntu"
    $CLEANUP
    echo $END_CLEAN
  else
    echo " Ubuntu not require clean up commande"
  fi
  style_ubuntu
}

# Upgrade
upgrade(){
  echo $UPGRADE_MESSAGE
  style_ubuntu

  $UPGRADE
  $DIST_UPGRADE

  style_ubuntu
  echo $END_UPGRADE_MESSAGE
}

# install packages
install_packages(){
  style_ubuntu
  if [[ -e $PACKAGES_ENV_DOCKERFILES  ]]; then
    echo "Install Packages in Env Dockerfile detected $PACKAGES_ENV_DOCKERFILES"

    echo " >>>>>>>>> Install Waithing"
    style_ubuntu
    $INSTALL $PACKAGES_ENV_DOCKERFILES

    echo " ==> Install Done to Env Dockerfile"
    style_ubuntu
  elif [[ $PACKAGES_DEFAULT ]]; then

    echo $MESSAGE
    style_ubuntu
    $INSTALL $PACKAGES_DEFAULT

    echo $END_MESSAGE
    style_ubuntu
  else
    style_ubuntu
    echo "Packages is not Installed if you want install package use ENV PACKAGES_ENV_DOCKERFILES"
    style_ubuntu
  fi

  style_ubuntu
}