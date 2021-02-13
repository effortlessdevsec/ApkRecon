#!/bin/bash
green='\033[1;32m'
end='\033[1;m'
info='\033[1;33m[!]\033[1;m'
que='\033[1;34m[?]\033[1;m'
bad='\033[1;31m[-]\033[1;m'
good='\033[1;32m[+]\033[1;m'
run='\033[1;97m[~]\033[1;m'

printf """$green                                     
   / \   _ __ | | _|  _ \ ___  ___ ___  _ __  
  / _ \ | '_ \| |/ / |_) / _ \/ __/ _ \| '_ \ 
 / ___ \| |_) |   <|  _ <  __/ (_| (_) | | | |
/_/   \_\ .__/|_|\_\_| \_\___|\___\___/|_| |_|
        |_|  
$end"""



if [ $1 ]
then
    :
else
    printf "Usage: ./apk_recon.sh <path to apk file>\n"
    exit
fi


echo "compiling apk"
find_urls()
{
printf $"$run Finding Urls \n"
apkurlgrep -a $1


read -n 1 -r -s -p $'\n\nPress enter to continue. to find apk secrets..\n\n'
find_secrets $1
}

find_secrets()
{
printf $"$run Extracting Secrets  \n"
jadx $1 -d /tmp/$1
printf $"$run Extracting Secrets  from sources\n"
find /tmp/$1/sources/  -type f -print | grep -vE "R.java|r.java" | xargs -n 1 strings | gf -color Apksecret
printf $"$run Extracting Secrets  from Resources\n"
find /tmp/$1/resources/  -type f -print | xargs -n 1 strings | gf  -color Apksecret |  sed 's/=/ /g;s/>/=/g;s/<string name/ /g'
rm -r  /tmp/$1
}

find_urls $1




