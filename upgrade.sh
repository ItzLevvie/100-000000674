if [ "$(lsb_release --codename | awk '{print $2}')" != "oracular" ]; then
    do-release-upgrade
    reboot
fi

if [ "$(lsb_release --codename | awk '{print $2}')" != "plucky" ]; then
    do-release-upgrade
    reboot
fi

if [ "$(lsb_release --codename | awk '{print $2}')" == "plucky" ]; then
    do-release-upgrade --devel-release
    reboot
fi
