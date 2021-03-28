*** Settings ***
Library  SeleniumLibrary


*** Variables ***
${IPHONE_PHOTO}  css=[alt='iPhone']
${IPHONE_PRICE}  css=div:nth-child(5) p.price
${IPHONE_ADD_CART}  css=div:nth-child(5) div div:nth-child(2) button:nth-child(1)
${IPHONE_ADD_WISHLIST}  css=div:nth-child(5) div div:nth-child(2) button:nth-child(2)
${IPHONE_COMPARE}  css=div:nth-child(5) div div:nth-child(2) button:nth-child(3)
${PRODUCT_DESCRIPTION}  css=#tab-description
${PRODUCT_ADD_CART}  css=#button-cart
${CART_BUTTON}  css=#cart
${PRODUCT_NAME}  css=#content div div.col-sm-4 h1
${PRICE_VALUE}  css=#content div div.col-sm-4 ul:nth-child(4) li:nth-child(1) h2
${HEADER_TABLETS}  css=#menu > div.collapse.navbar-collapse.navbar-ex1-collapse > ul > li:nth-child(4) > a
${HEADER_SOFTWARE}  css=#menu > div.collapse.navbar-collapse.navbar-ex1-collapse > ul > li:nth-child(5) > a
${HEADER_PHONES}  css=#menu > div.collapse.navbar-collapse.navbar-ex1-collapse > ul > li:nth-child(6) > a
${HEADER_CAMERAS}  css=#menu > div.collapse.navbar-collapse.navbar-ex1-collapse > ul > li:nth-child(7) > a
${HEADER_DESKTOPS}  css=#menu > div.collapse.navbar-collapse.navbar-ex1-collapse > ul > li:nth-child(1) > a
${SEARCH_INPUT}  css=[name = 'search']
${SEARCH_BUTTON}  css=.btn.btn-default.btn-lg


*** Keywords ***
Search
    [Arguments]  ${request}
    Input Text  ${SEARCH_INPUT}  ${request}
    Click Button  ${SEARCH_BUTTON}


Search For IPhone Product Elements
    Wait Until Page Contains Element  ${IPHONE_PHOTO}
    Wait Until Page Contains Element  ${IPHONE_PRICE}
    Wait Until Page Contains Element  ${IPHONE_ADD_CART}
    Wait Until Page Contains Element  ${IPHONE_ADD_WISHLIST}
    Wait Until Page Contains Element  ${IPHONE_COMPARE}


Should Be Product Card Elements
    Wait Until Page Contains Element  ${PRODUCT_DESCRIPTION}
    Wait Until Page Contains Element  ${PRODUCT_ADD_CART}
    Wait Until Page Contains Element  ${CART_BUTTON}
    Wait Until Page Contains Element  ${PRODUCT_NAME}
    Wait Until Page Contains Element  ${PRICE_VALUE}


Should Be Header Elements
    Wait Until Page Contains Element  ${HEADER_TABLETS}
    Wait Until Page Contains Element  ${HEADER_SOFTWARE}
    Wait Until Page Contains Element  ${HEADER_PHONES}
    Wait Until Page Contains Element  ${HEADER_CAMERAS}
    Wait Until Page Contains Element  ${HEADER_DESKTOPS}
