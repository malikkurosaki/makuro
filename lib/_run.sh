_run() {

    _green "
    r, root server  : menjalankan server nodejs pada root dir , ditandai dengan file [package.json]
    s, serever      : untuk server nodejs , ditandai dengan adanya folder [server]
    c, client       : untuk client flutter, ditandai dengan folder [client]
    " | sed -e "s/^[ \t]*//"
    read -p "Masukkan Pilihan: " pilihan
    case $pilihan in
    r)
        [[ ! -f package.json ]] && {
            _red "pastikan anda berada pada root dir project server nodejs"
            exit 1
        }
        [[ ! -d "$(npm root -g)/nodemon" ]] && {
            _yellow "tunggu sebentar , berusaha menginstall properti yang diperlukan ..."
            npm i -g nodemon
        }
        nodemon .
        ;;
    s)
        [[ ! -d server ]] && {
            _red "folder server tidak terditeksi"
            exit 1
        }
        cd server
        nodemon .
        ;;
    c)
        [[ ! -d client ]] && {
            echo "folder client tidak terditeksi"
            exit 1
        }
        cd client
        flutter run -d chrome --web-renderer html --web-port 5100
        ;;
    *)
        _yellow "
        -c, menjalankn client
        -s, menjlankan server" |
            sed -e "s/^[ \t]*//"
        ;;
    esac
}
