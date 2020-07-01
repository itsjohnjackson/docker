#The following bash function is recommended to use the httpserverbasic

PLEASE CHANGE THE PATH AT END

function httpserverbasic() {
    echo -n "Enter Username: " && read username
    echo -n "Enter Password: " && read password
    sudo docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/srv/data" -e "BASIC_AUTH_USERNAME=$username" -e "BASIC_AUTH_PASSWORD=$password" itsjohnjackson/httpserverbasic
}
