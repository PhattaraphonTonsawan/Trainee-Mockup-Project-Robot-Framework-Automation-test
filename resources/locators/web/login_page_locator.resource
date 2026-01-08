*** Variables ***
&{login_page_locator}
...    txt_title=xpath=//div[@id='root']/div[@class='login_container']/div[@class='login_logo']
...    txt_username=id=user-name
...    txt_password=id=password
...    btn_login=id=login-button
...    lbl_login_error=xpath=//h3[@data-test='error']