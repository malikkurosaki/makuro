_obs() {
    [[ ! -d lib2 ]] && {
        mkdir lib2
    }

    for file in $(find lib/ -name _*.sh); do
        bash-obfuscate $file -o lib2/${file/lib\///}
    done
}
