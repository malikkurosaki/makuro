#/usr/bin/env bash
g_dir=$(npm root -g)

[[ -d $g_dir/express ]] || {
    echo "mencoba mendapatkan data yang dibutuhkan ..."
    npm i -g express
}

[[ -d $g_dir/minimist ]] || {
    echo "mencoba mendapatkan data yang dibutuhkan ..."
    npm i -g minimist
}

[[ -d $g_dir/firebase-admin ]] || {
    echo "mencoba mendapatkan data yang dibutuhkan ..."
    npm i -g firebase-admin
}

[[ -d $g_dir/colors ]] || {
    echo "mencoba mendapatkan data yang dibutuhkan ..."
    npm i -g colors
}

[[ -f $g_dir/makuro/lib/_uuid.sh ]] || {
    echo "uuid=$(uuidgen)" > "$g_dir/makuro/lib/_uuid.sh"
}

for file in $(find $g_dir/makuro/lib -name "_*.sh"); do
    source $file
done
_menu $@

# _chat
# # _menu $@

# dir="var dir_express = '$(npm root -g)/express'"
# server="
# const express = require(dir_express)
# const app = express()
# app.get('/', (req, res) => {
#     res.send('Hello World!')
# })
# app.listen(3000, () => {
#     console.log('Example app listening on port 3000!')
# })
# "
