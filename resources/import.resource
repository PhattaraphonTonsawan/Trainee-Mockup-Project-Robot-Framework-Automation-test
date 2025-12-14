*** Settings ***
#LIBRARY
Library    SeleniumLibrary
Library    DateTime
Library    String

# COMMON
Resource    ${CURDIR}/../keywords/common/common_web.resource
Resource    ${CURDIR}/../keywords/common/common.resource

# FEATURE
Resource    ${CURDIR}/../keywords/ui/web/features/login_feature.resource

# PAGE
Resource    ${CURDIR}/../keywords/ui/web/pages/customer_information_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/login_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/product_list_page.resource

# DATATEST
Variables    ${CURDIR}/../resources/datatest/datatest.yaml

# LOCATOR
Resource    ${CURDIR}/../resources/locators/checkout_complete_page_locator.resource
Resource    ${CURDIR}/../resources/locators/checkout_overview_page_locator.resource
Resource    ${CURDIR}/../resources/locators/customer_information_page_locator.resource
Resource    ${CURDIR}/../resources/locators/login_page_locator.resource
Resource    ${CURDIR}/../resources/locators/products_list_page_locator.resource

# SETTING
Variables    ${CURDIR}/../resources/setting/config.yaml

# TRANSALATION
Variables    ${CURDIR}/../resources/transalation/eng.yaml