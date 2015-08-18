## ELK
Update rsyslog config and restart
run `docker run --rm -v $PWD/conf:/data vfarcic/elastic-dump --input=/data/es-kibana.json --output=http://10.0.0.100:9200/.kibana --type=data`

## Gitlab
Create a user as admin
Add ssh key to the user and create a project
