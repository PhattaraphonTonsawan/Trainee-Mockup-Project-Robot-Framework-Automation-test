*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Test set up
    [Documentation]    ลบสินค้าออกจากตะกร้าก่อนเริ่มทำการทดสอบ
    choose_language_feature.Open shopee application and verify choose language page    langeuage_page_title=${txt_choose_langauge_page['txt_title']}
    choose_language_feature.Choose language and check welcome page popup
    choose_language_feature.Tap start button and navigate to home page
    home_page.Tap button in bottom navigation bar
    ...    button_name=${txt_home_page['txt_profile_button']}
    login_feature.Tap login button and check login page title
    login_page.Tap login with google account button
    google_login_page.Swipe to google account
    google_login_page.Select google account
    login_feature.Handle fingerprint popup and passkey page
    profile_page.Tap home button
    ...    button_name=${txt_home_page['txt_home_button']}
    home_page.Tap cart button
    shopee_cart_page.Check cart page title
    Run Keyword And Ignore Error    shopee_cart_page.Check item name    item_name=${product_detail['product_name']}
    Run Keyword And Ignore Error    shopee_cart_feature.Delete item from cart and verify cart is empty    item_name=${product_detail['product_name']}
    AppiumLibrary.Terminate Application    app_id=${app_capabilities['app_package']}