*** Variables ***
&{customer_information_page_locator}
...    txt_page_title=xpath=//span[@data-test='title']
...    txt_first_name=xpath=//input[@data-test='firstName']
...    txt_last_name=xpath=//input[@data-test='lastName']
...    txt_zip_code=xpath=//input[@data-test='postalCode']
...    btn_continue=id=continue
...    btn_cancel=id=cancel
...    txt_error_msg=xpath=//div[@class='error-message-container error']//h3