*** Variables ***
&{google_login_page_locator}
...    btn_gmail=xpath=(//android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"])[1]/android.widget.LinearLayout
...    btn_fingerprint_accept=id=com.shopee.th:id/btnOK
...    btn_return_passkey=xpath=(//android.view.ViewGroup[@resource-id="buttonActionBarIcon"])[1]/android.widget.ImageView
...    first_gmail_account_list=xpath=(//android.widget.LinearLayout[@resource-id="com.google.android.gms:id/container"])[1]