#!/bin/bash

#--------------------------------------------
#---- Developer: Debashis Roy Bhowmik -------
#---- Email: debashis.buet08@gmail.com ------
#----------- Website: debashis.me -----------
#-- Github: https://github.com/wall-e-08/ ---
#--------------------------------------------

set -e  # Exit immediately if a command exits with a non-zero status.

# create a variable to hold the input
read -p "Please enter project name:  " project_name

if [[ -z "$project_name" ]]; then
    echo "Insert project name";
    return;
fi

mkdir "$project_name";
cd "$project_name";
virtualenv -p python3 env;
source env/bin/activate;
pip install Django==2.1.3;
django-admin startproject core;
mv core corebk;
mv corebk/* .;
rm -r corebk;


###########################################################################################################
# codes below are for inserting lines in a file into a given line number                                  #
# this will work only for django version 2.1, because file's line numbers are counted and then inserted   #
# if you want to use another version of django, please change code below                                  #
###########################################################################################################

# making all apps in a project folder:
# sed -e '4iPROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))\nsys.path.append(os.path.join(PROJECT_ROOT, "packages"))\n' -i manage.py;
# sed -e '9iimport sys' -i core/wsgi.py;
# sed -e '16iPROJECT_ROOT = os.path.dirname(os.path.abspath(__file__))\nsys.path.append(os.path.join(PROJECT_ROOT, "packages"))\n' -i core/wsgi.py;

# static root in settings.py:
sed -e '120iSTATIC_ROOT = os.path.join(BASE_DIR, "static")\n' -i core/settings.py;
sed -e '123itry: from .local_settings import *;\nexcept ImportError: pass;\n' -i core/settings.py;
## inserting in lines are done here !!

touch core/local_settings.py;
echo "DEBUG=True" > core/local_settings.py;

pip freeze > requirements.txt;
python manage.py migrate;
python manage.py collectstatic --no-input;
echo "from django.contrib.auth import get_user_model; User = get_user_model(); User.objects.create_superuser('admin', 'w@w.com', '1a2b3c4d'); User.objects.create_superuser('test', '', '1a2b3c4d'); User.objects.create_superuser('wall-e', '', '1a2b3c4d');" | python manage.py shell;
echo "User Created: ['test', 'admin', 'wall-e']"
python manage.py runserver 8009;

#--------------------------------------------
#---- Copyright: Debashis Roy Bhowmik -------
#---- Email: debashis.buet08@gmail.com ------
#----------- Website: debashis.me -----------
#-- Github: https://github.com/wall-e-08/ ---
#--------------------------------------------