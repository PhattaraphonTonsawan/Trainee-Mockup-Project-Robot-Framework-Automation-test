*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{choose_language_page_locator}
...    btn_thai_language=xpath=//android.widget.RadioButton[@text="${txt_choose_langauge_page['txt_btn_thai']}"]
...    btn_ok=id=com.shopee.th:id/ok
...    btn_start=id=com.shopee.th:id/btn
...    img_popup=id=com.shopee.th:id/image
...    lbl_title=xpath=//android.widget.TextView[@resource-id="com.shopee.th:id/title" and @text="***replace***"]