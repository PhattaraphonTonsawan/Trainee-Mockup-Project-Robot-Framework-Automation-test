*** Variables ***
&{google_login_page_locator}
...    btn_gmail=xpath=//android.widget.TextView[@resource-id="com.google.android.gms:id/account_name" and @text="***replace***"]/parent::android.widget.LinearLayout
...    btn_fingerprint_accept=id=com.shopee.th:id/btnOK
...    btn_return_passkey=xpath=//android.view.ViewGroup[@resource-id="buttonActionBarBack"]/android.view.ViewGroup