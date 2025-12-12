*** Settings ***
#Library
Library    SeleniumLibrary
Library    DateTime
Library    String

#Transalation
Variables    ${CURDIR}/../resources/transalation/eng.yaml

#Setting
Variables    ${CURDIR}/../resources/setting/config.yaml

#Locators
Resource    ${CURDIR}/../resources/locators/login_page_locator.resource
Resource    ${CURDIR}/../resources/locators/products_list_page_locator.resource
Resource    ${CURDIR}/../resources/locators/customer_information_page_locator.resource

#Keywords
Resource    ${CURDIR}/../keywords/common/common_web.resource
Resource    ${CURDIR}/../keywords/common/common.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/login_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/product_list_page.resource

#Datatest
Variables    ${CURDIR}/../resources/datatest/datatest.yaml