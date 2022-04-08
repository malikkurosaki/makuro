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
        h,       Menampilkan bantuan
        c,       Membuat chat obrolan
        g,       menampilkan property untuk git
        r,       senjalakan debug [server | client]
        q,       quite | keluar

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
