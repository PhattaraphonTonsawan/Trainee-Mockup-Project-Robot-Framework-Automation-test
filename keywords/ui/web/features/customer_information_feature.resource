*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
# Wait for cart page locator
# Press cancel at customer information page
#    [Documentation]    Aborting checkout process by pressing cancel at customer information page

Input every fields and proceed to checkout overview page
    [Documentation]    Input first name, last name, and zip/postal code then press continue button
    customer_information_page.Check page title
    customer_information_page.load input fields
    customer_information_page.Input first name    first_name=${credentials['firstname']}
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Input zip/postal code    zip_code=${credentials['zipcode']}
    customer_information_page.CLick continue btn and check page    wait_element_locator=${checkout_overview_page_locator['txt_page_title']}

Missing firstname input
    [Documentation]    Input only last name and zip/postal code and error popup should appear
    customer_information_page.Check page title
    customer_information_page.load input fields
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    customer_information_page.Input zip/postal code    zip_code=${credentials['zipcode']}
    customer_information_page.Error popup    message=${txt_customer_infomation_page['txt_missing_first_name']}

Missing zip/postal code input
    [Documentation]    Input only first name and last name and error popup should appear
    customer_information_page.Check page title
    customer_information_page.load input fields
    customer_information_page.Input first name    first_name=${credentials['firstname']}
    customer_information_page.Input last name    last_name=${credentials['lastname']}
    