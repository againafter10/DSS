
# export the sql result data for past 2 days from rds table to bastion host as csv and format it

psql -U username -h prod-db.xxxxxxx -d dbname -t  -o "<<download location>>/download.csv" -A -c "SELECT * FROM email_view where to_char(created_on, 'YYYYMMDD') > to_char((now() - interval '2 day'), 'YYYYMMDD');"

tr '|' ',' < download.csv > exported.csv

# add headers
if [ -e leads.csv ];then
rm leads.csv
fi

cat template.csv >> leads.csv

# add the exported leads now
cat exported.csv >> leads.csv  


# upload to mapped gdrive after removing existing leads.csv

for i in `gdrive list|grep leads.csv|cut -d " " -f1`;
do
	gdrive delete $i
done

gdrive upload leads.csv


# as extension can map this gdrive to any CRM/appication and make the csv file available to a number of resources in one go
