db:
	mysql -uroot -ptoor -Dfood_db

db-setup:
	./initial-mysql-setup.sh

db-remove:
	./remove-mysql.sh
        # create database log_db character set utf8;
        # show databases;

enc:
	openssl enc -aes-256-cbc -e -in settings_secret.py -out settings_secret.py.enc -pass pass:$PASWORD

# dec:
# 	openssl enc -d-aes-256-cbc -in settings_secret.py -out settings_secret.enc -pass pass:$PASWORD
# 


setup:
	python manage.py migrate
	python manage.py makemigrations
	python manage.py migrate --run-syncdb

run:
	sudo python manage.py runserver 0.0.0.0:80

run-dev:
	python manage.py runserver
