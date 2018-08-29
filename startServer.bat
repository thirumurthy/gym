@echo off


echo ----------------------------------------
echo Starting MYSQL Server
echo ----------------------------------------

start c:\xampp\mysql\bin\mysqld --defaults-file=c:\xampp\mysql\bin\my.ini

echo ----------------------------------------
echo MYSQL Server Started..!
echo ----------------------------------------

timeout 5

echo ----------------------------------------
echo Starting GYM Application
echo ----------------------------------------

sails lift

