COUNTER=0
echo $(date)
echo "Locally deploying for $(whoami)"
rsync -a --delete-excluded --exclude-from=.rsyncrc $(pwd) ~/Sites/site-a/modules/ && COUNTER=$((COUNTER+1))
rsync -a --delete-excluded --exclude-from=.rsyncrc $(pwd) ~/Sites/site-b/modules/ && COUNTER=$((COUNTER+1))
echo "Deployment complete in $COUNTER projects"
