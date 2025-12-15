*** Settings ***
#LIBRARY
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    Process
Library    String
Library    SeleniumLibrary    run_on_failure=common_web.Screenshot page

# COMMON
Resource    ${CURDIR}/../keywords/common/common.resource
Resource    ${CURDIR}/../keywords/common/common_web.resource

# FEATURE
Resource    ${CURDIR}/../keywords/ui/web/features/checkout_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/login_feature.resource

# PAGE
Resource    ${CURDIR}/../keywords/ui/web/pages/checkout_complete_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/checkout_overview_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/customer_information_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/login_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/product_list_page.resource

# LOCATOR
Resource    ${CURDIR}/../resources/locators/checkout_complete_page_locator.resource
Resource    ${CURDIR}/../resources/locators/checkout_overview_page_locator.resource
Resource    ${CURDIR}/../resources/locators/customer_information_page_locator.resource
Resource    ${CURDIR}/../resources/locators/login_page_locator.resource
Resource    ${CURDIR}/../resources/locators/products_list_page_locator.resource

# SETTING
Variables    ${CURDIR}/../resources/setting/config.yaml

# DATATEST
Variables    ${CURDIR}/../resources/datatest/datatest.yaml

# TRANSALATION
Variables    ${CURDIR}/../resources/transalation/en.yaml