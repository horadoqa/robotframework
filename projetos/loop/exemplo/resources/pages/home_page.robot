*** Settings ***
Resource  ../main.robot

*** Variables ***
&{home}
...  H1_Title=//h1[contains(text(),"Dashboard")]
...  Opcao_PIM_Menu=//a[@id="menu_pim_viewPimModule"]
...  Btn_Add_New_Employee=//a[@id="menu_pim_addEmployee"]

*** Keywords ***
Dado que eu acesse a opção PIM no menu
    Wait Until Element Is Visible  ${home.Opcao_PIM_Menu}    
    Click Element  ${home.Opcao_PIM_Menu}

E clico em "Add Employee"
    Wait Until Element Is Visible  ${home.Btn_Add_New_Employee}
    Click Element  ${home.Btn_Add_New_Employee}


    