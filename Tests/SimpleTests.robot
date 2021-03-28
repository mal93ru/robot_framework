*** Settings ***
Resource  ../PageObjects/CatalogPage.robot


*** Test Cases ***
Search MacBook
    [Tags]  Catalog  Search
    [Teardown]  Close Browser
    Open Browser  http://localhost/index.php?route=product/category&path=20  chrome
    Search  MacBook
    Title Should Be  Search - MacBook


Should Be Catalog Product Elements
    [Tags]  Catalog
    [Teardown]  Close Browser
    Open Browser  http://localhost/index.php?route=product/category&path=20  chrome
    Search For IPhone Product Elements


Test Product Card Page
    [Tags]  Catalog  Product Card
    [Teardown]  Close Browser
    Open Browser  http://localhost/index.php?route=product/product&path=57&product_id=49  chrome
    Should Be Product Card Elements


Select Product
    [Tags]  Catalog  Product Page
    [Teardown]  Close Browser
    Open Browser  http://localhost/index.php?route=product/category&path=20  chrome
    Click Element  css=[alt="HP LP3065"]
    Title Should Be  HP LP3065


Should Be Headers Elements
    [Tags]  Catalog  Header
    [Teardown]  Close Browser
    Open Browser  http://localhost/index.php?route=product/category&path=20  chrome
    Should Be Header Elements

