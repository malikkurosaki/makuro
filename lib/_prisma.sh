_prisma() {
    _green "
    m, migrate          migrate database
    ms, server migrate  server
    g, generate         generate schema
    "
    read -p "Masukkan Pilihan: " pilihan
    case $pilihan in
    g)
        prisma generate
        ;;
    m)
        [[ ! -d prisma ]] && {
            echo "pastikan anda berada pada root dir project prisma"
            exit 1
        }

        npx prisma migrate dev --name "$(date)"
        npx prisma generate
        ;;
    ms)
        cd server
        [[ ! -d prisma ]] && {
            echo "pastikan anda berada pada root dir project prisma"
            exit 1
        }

        npx prisma migrate dev --name "$(date)"
        npx prisma generate
        ;;
    *)
        echo "apa kabar"
        ;;

    esac
}
