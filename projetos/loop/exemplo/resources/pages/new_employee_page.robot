*** Settings ***
Resource  ../main.robot

*** Variables ***
&{new_employee}
...  Input_FirstName=//input[@id="firstName"]
...  Input_MiddleName=//input[@id="middleName"]
...  Input_LastName=//input[@id="lastName"]
...  Photo_Input=//input[@id="photofile"]
...  Btn_Save=//input[@id="btnSave"]
...  Title_Registred_Employee=//h1[contains(text(),"Personal Details")]

*** Keywords ***
Então adiciono ${Quantidade} novos usuários
    FOR  ${i}  IN RANGE  ${Quantidade}
        Wait Until Element Is Visible  ${new_employee.Input_FirstName}
        Input Text  ${new_employee.Input_FirstName}  ${employee.First_Name} ${i}
        Input Text  ${new_employee.Input_MiddleName}  ${employee.Middle_Name} 
        Input Text  ${new_employee.Input_LastName}  ${employee.Last_Name}
        Choose File  ${new_employee.Photo_Input}  ${employee.Profile_Photo}  
        Click Element  ${new_employee.Btn_Save} 
        Wait Until Element Is Visible  ${new_employee.Title_Registred_Employee} 
        Page Should Contain  ${employee.First_Name} ${i} ${employee.Middle_Name} ${employee.Last_Name}
        E clico em "Add Employee"
    END 

          