#!/bin/bash
# back
p0="gc.sql"
docker exec pg pg_dump -h 127.0.0.1 -U someuser -p 5432 somedb -f /pg.back.sql

# mv
p1="/data/docker/con/postgres/backup/db/"
f0=${p1}${p0}
docker cp pg:/pg.back.sql $f0

# compress
d0=`date +'%Y_%m_%d_%H_%M_%S'`
f1=${f0}.${d0}.tar.gz

# final
cd $p1
tar czf $f1 $p0
rm -f $p0

# delete, remain last 3
ls -1tr *.tar.gz | head -n -3 | xargs -d '\n' rm -f

# dropbox
cp $f1 /home/tester/Dropbox/back/
ls -1tr /home/tester/Dropbox/back/*.tar.gz | head -n -3 | xargs -d '\n' rm -f
