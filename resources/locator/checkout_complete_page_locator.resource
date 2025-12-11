*** Settings ***
Documentation    Checkout: Complete! page locators for Sauce Demo application.

*** Variables ***
&{checkout_complete_page_locator}
...    page_title=data-test=title
...    thank_you_msg=data-test=complete-header
...    back_home_btn=id=back-to-products