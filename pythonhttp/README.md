#The following bash function is recommended to use the pythonhttp uploader

Uploader taken from https://gist.github.com/touilleMan/eb02ea40b93e52604938

PLEASE CHANGE THE PATH AT END
```shell
function pythonhttp() {
    echo -n "Enter Username: " && read username
    echo -n "Enter Password: " && read password
    sudo docker run --rm -it -p 80:80 -p 443:443 -v "${PWD}:/srv/data" -e "BASI>
}
