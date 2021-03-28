*** Settings ***
Library  String
Library  DatabaseLibrary

Resource  ../PageObjects/RegisterPage.robot
Resource  ../Resources/DataBase.robot

Suite Setup  Connect To Database  pymysql  ${DBName}  ${DBUser}  ${DBPass}  ${DBHost}  ${DBPort}
Suite Teardown  Disconnect From Database

Test Setup  Open Browser  browser=chrome  options=add_argument("--ignore-certificate-errors");add_argument("--start-maximized")
Test Teardown  Close Browser


*** Variables ***
${DBName}  bitnami_opencart
${DBUser}  bn_opencart
${DBPass}
${DBHost}  localhost
${DBPort}  3306
${BASE_URL}  localhost
@{NEW_ACCOUNT} =  First Name  Last Name  testaccount@opencart.com  +79990000000  qwerty  qwerty


*** Test Cases ***
Create New Account With Db Validation
    [Documentation]  Create new account with ui and validate precence in database
    [Tags]  DB  AddAccount
    [Teardown]  Run Keywords  Execute Sql String  delete from ${CUSTOMER_DB} where email = '${NEW_ACCOUNT}[2]'
    ...  AND  Close Browser
    Go To  http://${BASE_URL}/index.php?route=account/register
    RegisterPage.Fill out a registration form  ${NEW_ACCOUNT}
    Title Should Be  Your Account Has Been Created!
    Wait Until Keyword Succeeds  3 sec  1 sec  Check New Account In Database  ${NEW_ACCOUNT}[2]
