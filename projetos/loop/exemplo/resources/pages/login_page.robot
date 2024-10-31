*** Settings ***
Resource  ../main.robot

*** Variables ***
&{login}
...  Input_Username=//input[@id="txtUsername"]
...  Input_Password=//input[@id="txtPassword"]
...  Btn_Login=//input[@id="btnLogin"]

