*** Variables ***
&{login_page_locator}
...    btn_google_login=xpath=//android.widget.TextView[@resource-id="com.shopee.th:id/txt_method_name" and @text="ดำเนินการต่อด้วย Google"]
...    btn_login=id=com.shopee.th:id/btnLogin
...    btn_register=id=com.shopee.th:id/tv_signup_2
...    txt_page_title=id=com.shopee.th:id/title_text
...    txt_password_input=xpath=//android.widget.EditText[@resource-id="com.shopee.th:id/cret_edit_text" and @text="รหัสผ่าน"]
...    txt_user_input=xpath=//android.widget.EditText[@resource-id="com.shopee.th:id/cret_edit_text" and @text="หมายเลขโทรศัพท์ / Email / ชื่อผู้ใช้"]