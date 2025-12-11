*** Settings ***
Library    SeleniumLibrary
Library    DateTime
Variables    ${CURDIR}/transalation/eng.yaml
Variables    ${CURDIR}/datatest/datatest.yaml
Variables    ${CURDIR}/setting/config.yaml
Resource    ${CURDIR}/locators/login_page_locator.resource
Resource    ${CURDIR}/../keywords/common/common_web.resource
Resource    ${CURDIR}/../keywords/common/common.resource
