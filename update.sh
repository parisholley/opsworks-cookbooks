rm Berksfile.lock
ls | grep -v Berksfile | grep -v ^php$ | rm -rf
mkdir /tmp/opsworksberk
berks install --path=/tmp/opsworksberk --without aws
cp -rf /tmp/opsworksberk/* .
