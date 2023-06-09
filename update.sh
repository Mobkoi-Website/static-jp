#!/bin/bash

echo "Updating..."

find /home/customer/git/static-jp/ \( -type d -name .git  -o -type f -name 'update.sh' -prune \) -o -type f -print0 | xargs -0 sed -i 's/jp-stage.wp.mobkoi.com/www.mobkoi.co.jp/g'

cd /home/customer/git/static-jp/
rm -rf /home/customer/git/static-jp/.git/index.lock
/usr/bin/git pull origin main
/usr/bin/git add .
/usr/bin/git commit -m "Automated Commit"
/usr/bin/git push origin main --force
