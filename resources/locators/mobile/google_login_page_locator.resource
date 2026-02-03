*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{google_login_page_locator}
...    btn_gmail=xpath=//android.widget.TextView[@resource-id="com.google.android.gms:id/account_name" and @text="${google_account['gmail']}"]/parent::android.widget.LinearLayout
...    btn_fingerprint_accept=id=com.shopee.th:id/btnOK
...    btn_return_passkey=xpath=//android.view.ViewGroup[@resource-id="buttonActionBarBack"]/android.view.ViewGroup
...    lbl_fingerprint_enable_title=xpath=//android.widget.FrameLayout[@resource-id="com.shopee.th:id/customViewFrame"]//android.widget.TextView[@text="${google_login_page_locator['txt_fingerprint_enable']}"]
...    lbl_quick_login_title=xpath=//android.widget.TextView[@text="${google_login_page_locator['txt_quick_login_title']}"]