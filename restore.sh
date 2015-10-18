docker run --rm --volumes-from youtrack_data -v $(pwd):/backup resin/rpi-raspbian:jessie bash -c "cd /data && rm -rf * && tar zxvf /backup/backup.tar.gz"
