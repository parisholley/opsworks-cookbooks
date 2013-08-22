rm Berksfile.lock
ls | grep -v Berksfile | xargs rm -rf
mkdir /tmp/opsworksberk
berks install --path=/tmp/opsworksberk --except aws
ls /tmp/opsworksberk/ | grep -v ^php$ | xargs -Ixxx cp -rf /tmp/opsworksberk/xxx .
