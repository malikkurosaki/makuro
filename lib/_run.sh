_run() {
    case $1 in
    -s)
        if [[ ! -d server ]]; then
            echo "Server belum terinstall"
            exit 1
        fi
        cd server
        nodemon .
        ;;
    -c)
        if [[ ! -d client ]]; then
            echo "Client belum terinstall"
            exit 1
        fi
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
