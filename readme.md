# Real Time Data Processing
Run mysql
sudo sevice mysqld start

Make sure all the scripts in /scripts have  774 permissions
Run below command:

chmod 774 /scripts/*


Scripts:
--------
generate_web_data.py -- Generates some random data coming from web application
python /scripts/generate_web_data.py

generate_mob_data.py -- Generates some random data coming from mobile application
python /scripts/generate_mob_data.py

start-daemons.sh -- Launches all necessary daemons
sh /scripts/start-daemons.sh

populate-lookup.sh -- Populates lookup tables
sh /scripts/populate-lookup.sh

dataformatting.sh -- Performs data formatting
sh /scripts/dataformatting.sh

hive -f /scripts/create_hive_hbase_lookup.hql

data_enrichment.sh -- Performs data enrichment and cleaning
sh /scripts/data_enrichment.sh

data_analysis.sh -- Performs data analysis
sh /scripts/data_analysis.sh

Scheduling:
-----------
We'll be using crontab for job scheduling.
Job has to run every 3 hours

sudo crontab -e

(Press i to enter insert mode)

* */3 * * * /home/acadgild/project/scripts/wrapper.sh

(Press Esc and then type :wq! and press Enter)

