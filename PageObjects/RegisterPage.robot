*** Settings ***
Library  SeleniumLibrary
Library  DatabaseLibrary


*** Variables ***
${REG_FORM}  css=#content form
${FIRST_NAME_INPUT}  css=#input-firstname
${LAST_NAME_INPUT}  css=#input-lastname
${EMAIL_INPUT}  css=#input-email
${PHONE_INPUT}  css=#input-telephone
${PASSWORD_INPUT}  css=#input-password
${CONFIRM_PASSWORD_INPUT}  css=#input-confirm
${PRIVACY_POLICY}  css=[name="agree"]
${CONTINUE}  css=[value='Continue']


*** Keywords ***
Fill out a registration form
    [Arguments]  ${user_data}
    Wait Until Element Is Visible  ${REG_FORM}
    Input Text  ${FIRST_NAME_INPUT}  ${user_data}[0]
    Input Text  ${LAST_NAME_INPUT}  ${user_data}[1]
    Input Text  ${EMAIL_INPUT}  ${user_data}[2]
    Input Text  ${PHONE_INPUT}  ${user_data}[3]
    Input Text  ${PASSWORD_INPUT}  ${user_data}[4]
    Input Text  ${CONFIRM_PASSWORD_INPUT}  ${user_data}[5]
    Select Checkbox  ${PRIVACY_POLICY}
    Click Element  ${CONTINUE}
