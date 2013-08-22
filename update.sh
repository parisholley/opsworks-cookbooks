rm Berksfile.lock
ls | grep -v Berksfile | rm -rf
mkdir /tmp/opsworksberk
berks install --path=/tmp/opsworksberk
cp -rf /tmp/opsworksberk/* .
