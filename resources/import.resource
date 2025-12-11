*** Settings ***
Library    SeleniumLibrary
Library    DateTime

Resource    ${CURDIR}/../keywords/common/common.resource
Resource    ${CURDIR}/../keywords/common/common_web.resource
Resource    ${CURDIR}/locator/checkout_overview_page_locator.resource
Resource    ${CURDIR}/locator/checkout_complete_page_locator.resource