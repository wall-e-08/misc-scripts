# Miscellaneous Scripts

- ### django
  * [`install-django-2.1.3.sh`](#django213 "click to view details")
  * [`install-django-2.2.4.sh`](#django224 "click to view details")
- ### databases
  * ##### postgresql
    * [`create_db.sh`](#psql-create-db "click to view details")


##
### <a id='django213'></a> install-django-2.1.3
To install `django` version `2.1.3`

Script Location: [`django/install-django-2.1.3`](misc-scripts/blob/master/django/install-django-2.1.3.sh "download")

Run `source install-django-2.1.3.sh`, it will ask for a project name. Give it, then it will automatically install django.
###### Required packages: 
- `pip`
- `virtualenv`

###### Project hierarchy:
`your-project-name`
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`core`&nbsp;&nbsp; ⟶ main project folder (included `settings.py` etc.)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`env` &nbsp;&nbsp; ⟶ `virtualenv` based environment folder

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`packages` &nbsp;&nbsp; ⟶ all django apps will be moved here

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`static` &nbsp;&nbsp; ⟶ static folder (`collectstatic` applied)

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`db.sqlite3` &nbsp;&nbsp; ⟶ database file

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`manage.py` &nbsp;&nbsp; ⟶ django management script

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;`requirements.txt` &nbsp;&nbsp; ⟶ list of installed packages

##
### <a id='django224'></a> install-django-2.2.4
To install `django` version `2.2.3`

Script Location: [`django/install-django-2.2.4`](misc-scripts/blob/master/django/install-django-2.2.4.sh "download")

remaining details will be found [here](#django213)

##
### <a id='psql-create-db'></a> postgresql/create_database
To create database by name and password with given user.

Set user, db name and password in the script first

Script location: [`database/postgresql/create_db.sh`](misc-scripts/blob/master/database/postgresql/create_db.sh "download")
