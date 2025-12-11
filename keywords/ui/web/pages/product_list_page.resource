*** Settings ***


*** Keywords ***
Check product list page title
    [Documentation]    Check product list page title
    common_web.Element should contain text
    ...    locator=${product_list_page_locator['txt_title']}
    ...    expected_text=${txt_product_list_page['txt_title']}
