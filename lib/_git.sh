_git() {
    [[ ! -d .git ]] && {
        echo "pastikan anda di project root directory git"
        exit 1
    }

    _yellow "
    Property untuk git:
    push,       push ke repository
    "

    read -p "Pilihan: " pilihan
    case $pilihan in
    push)
        git branch
        read -p "Masukkan nama branch: " branch
        [[ -z $branch ]] && exit 1

        git add .
        git commit -m "$(date)"
        git push origin $branch
        ;;
    *)
        echo "Pilihan tidak diketahui: $pilihan"
        ;;
    esac

}
