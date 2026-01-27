*** Settings ***
#LIBRARY
Library    Collections
Library    DateTime
Library    OperatingSystem
Library    Process
Library    String
Library    AppiumLibrary    run_on_failure=AppiumLibrary.CapturePageScreenshot
Library    SeleniumLibrary    run_on_failure=common_web.Capture page screenshot with timestamp

# COMMON
Resource    ${CURDIR}/../keywords/common/common.resource
Resource    ${CURDIR}/../keywords/common/common_mobile.resource
Resource    ${CURDIR}/../keywords/common/common_web.resource

# FEATURE
Resource    ${CURDIR}/../keywords/ui/web/features/cart_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/checkout_complete_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/checkout_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/checkout_overview_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/customer_information_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/login_feature.resource
Resource    ${CURDIR}/../keywords/ui/web/features/product_list_feature.resource

# PAGE
Resource    ${CURDIR}/../keywords/ui/mobile/pages/choose_language_page.resource
Resource    ${CURDIR}/../keywords/ui/mobile/pages/home_page.resource
Resource    ${CURDIR}/../keywords/ui/mobile/pages/shopee_cart_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/cart_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/checkout_complete_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/checkout_overview_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/customer_information_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/login_page.resource
Resource    ${CURDIR}/../keywords/ui/web/pages/product_list_page.resource

# LOCATOR
Resource    ${CURDIR}/../resources/locators/mobile/cart_page_mobile_locator.resource
Resource    ${CURDIR}/../resources/locators/mobile/checkout_page_mobile_locator.resource
Resource    ${CURDIR}/../resources/locators/mobile/choose_language_page_locator.resource
Resource    ${CURDIR}/../resources/locators/mobile/home_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/cart_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/checkout_complete_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/checkout_overview_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/customer_information_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/login_page_locator.resource
Resource    ${CURDIR}/../resources/locators/web/products_list_page_locator.resource

# SETTING
Variables    ${CURDIR}/../resources/setting/mobile/config.yaml
Variables    ${CURDIR}/../resources/setting/web/config.yaml

# DATATEST
Variables    ${CURDIR}/../resources/datatest/mobile/datatest.yaml
Variables    ${CURDIR}/../resources/datatest/web/datatest.yaml

# TRANSALATION
Variables    ${CURDIR}/../resources/transalation/mobile/th.yaml
Variables    ${CURDIR}/../resources/transalation/web/en.yaml