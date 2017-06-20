FROM stilliard/pure-ftpd:hardened

RUN setfacl -R -d -m g::rwx / ; exit 0 && setfacl -R -d -m o::rw / ; exit 0
RUN chmod 775 /home/ftpusers

CMD /run.sh -c 50 -C 10 -l puredb:/etc/pure-ftpd/pureftpd.pdb -E -j -R -P $PUBLICHOST -p 30000:30009 -U134:022
