_help() {
    _yellow '
    Pilihan:
    help,       Menampilkan bantuan
    chat,       Membuat chat obrolan
    git,        menampilkan property untuk git

   ' | sed -e "s/^[ \t]*//"
}

_menu() {

    _yellow '
        Pilihan:
        help,       Menampilkan bantuan
        chat,       Membuat chat obrolan
        git,        menampilkan property untuk git

    ' | sed -e "s/^[ \t]*//"

    read -p "Pilihan: " pilihan
    case $pilihan in
    git)
        _git $@
        ;;
    chat)
        _chat $@
        ;;
    run)
        _run $@
        ;;
    help)
        _help
        ;;
    q)
        _cyan "bye ...."
        exit 0
        ;;
    *)
        echo "Pilihan tidak diketahui: $1"
        _help
        ;;
    esac

}
