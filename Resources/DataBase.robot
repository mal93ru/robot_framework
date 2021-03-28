*** Settings ***
Library  DatabaseLibrary


*** Variables ***
${CUSTOMER_DB}  oc_customer


*** Keywords ***
Check New Account In Database
    [Arguments]  ${value}
    Check If Exists In Database  select email from ${CUSTOMER_DB} where email = '${value}'
