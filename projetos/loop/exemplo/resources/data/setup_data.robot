*** Settings ***
Resource  ../main.robot

*** Variables ***
&{setup}
...  URL=https://opensource-demo.orangehrmlive.com/index.php/auth/login
...  Browser=chrome
...  User=Admin 
...  Password=admin123