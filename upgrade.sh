if [ "$(lsb_release --codename | awk '{print $2}')" != "oracular" ] || [ "$(lsb_release --codename | awk '{print $2}')" != "plucky" ]; then
    do-release-upgrade
    reboot
fi
do-release-upgrade --devel-release
