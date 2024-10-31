*** Settings ***
Library  SeleniumLibrary


### Shared ###
Resource  shared/setups_teardowns.robot

### Data ###
Resource  data/setup_data.robot
Resource  data/employee_data.robot

### Pages ###
Resource  pages/login_page.robot
Resource  pages/home_page.robot
Resource  pages/new_employee_page.robot