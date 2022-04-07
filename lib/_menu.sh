_help() {
    _yellow '
    Pilihan:
    help,       Menampilkan bantuan
    chat,       Membuat chat obrolan

   ' | sed -e "s/^[ \t]*//"
}

_menu() {

    [[ $# -eq 0 ]] &&
        _help ||
        case $1 in
        help)
            _help
            ;;
        chat)
            _chat $@
            ;;
        run)
            case $2 in
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
            ;;
        *)
            echo "Pilihan tidak diketahui: $1"
            _help
            ;;
        esac
}
