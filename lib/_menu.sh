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
        h, help      Menampilkan bantuan
        c, chat      Membuat chat obrolan
        g, git       menampilkan property untuk git
        r, run       senjalakan debug [server | client]
        q, quit      quite | keluar

    ' | sed -e "s/^[ \t]*//"

    read -p "Pilihan: " pilihan
    case $pilihan in
    g)
        _git $@
        ;;
    c)
        _chat $@
        ;;
    r)
        _run $@
        ;;
    h)
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
