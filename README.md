## Jenkins
Install the `rbenv` and `git` plugins via the GUI
Setup build to pull from `http://10.0.0.102/<YOUR UESR NAME>/docker_rails_demo.git`
Add a build step of `bundle config build.nokogiri --use-system-libraries && bundle install && rake ci`

## ELK
sudo cp conf/10-logstash.conf /etc/rsyslog.d/.
sudo service rsyslog restart

run `docker run --rm -v $PWD/conf:/data vfarcic/elastic-dump --input=/data/es-kibana.json --output=http://10.0.0.100:9200/.kibana --type=data`

## Gitlab
Create a user as admin
Add ssh key to the user and create a project
Push project into Gitlab instance
