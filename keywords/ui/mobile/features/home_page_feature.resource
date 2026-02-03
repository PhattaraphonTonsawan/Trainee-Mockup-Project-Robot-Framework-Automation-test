*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Tap search bar
    [Documentation]    กดค้นหาสินค้าที่หน้าโฮม
    home_page.Check search bar visible
    home_page.Tap search bar