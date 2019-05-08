#!/bin/bash
# Autor: Xose
# Require root for running the script
# NOTICE: Comment with # the last line if you want don't delete this setup file
if [ "`id -u`" != 0 ] ;
        then
            echo -e "\n"
            clear
            echo "It requires root to run the script."
            echo "Abort, press any key to continue..."
            read abort
            clear
            exit 1
fi
SCRIPT=$(readlink -f $0);
mkdir /tmp/simple_clean_temp
cd /tmp/simple_clean_temp
echo "#!/bin/bash" > run.sh
echo "gnome-terminal -x /opt/simple_clean/simple_clean.sh" >> run.sh
echo "#!/bin/bash" > simple_clean.sh
echo "cd" >> simple_clean.sh
echo "rm -rf ~/.local/share/Trash/*" >> simple_clean.sh
echo "rm -rf ~/.cache/thumbnails/*" >> simple_clean.sh
echo "sudo du -sh /var/cache/apt" >> simple_clean.sh
echo "sudo apt-get autoclean" >> simple_clean.sh
echo "sudo apt autoremove" >> simple_clean.sh
echo "sudo apt autoremove --purge" >> simple_clean.sh
echo "sudo apt purge & sudo apt clean" >> simple_clean.sh
echo "exit" >> simple_clean.sh
apt-get install wget -y
wget https://i.ibb.co/VWcnvtr/simple-clean.png
echo "[Desktop Entry]" > simple_clean.txt
echo "Type=Application" >> simple_clean.txt
echo "Name=SimpleClean" >> simple_clean.txt
echo "Comment=System clean tool" >> simple_clean.txt
echo "Icon=/opt/simple_clean/simple-clean.png" >> simple_clean.txt
echo 'Exec="/opt/simple_clean/./run.sh"'>> simple_clean.txt
echo "Categories=System utilities;" >> simple_clean.txt
echo "Path=/opt/simple_clean/" >> simple_clean.txt
cd /tmp/
mv simple_clean_temp /opt/simple_clean
cd /opt/simple_clean
chmod +x simple_clean.sh
chmod +x run.sh
mv simple_clean.txt /usr/share/applications/simple_clean.desktop
rm -rf $SCRIPT