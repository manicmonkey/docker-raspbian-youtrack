docker run --rm --volumes-from youtrack_data -v $(pwd):/backup resin/rpi-raspbian:jessie tar zcvf /backup/backup.tar.gz /data
