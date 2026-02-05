*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{checkout_page_locator}
...    ctn_page=xpath=//android.widget.ScrollView
...    lbl_order_price=id=labelOrderTotalPrice
...    lbl_product_name=xpath=//android.widget.TextView[@text="***replace***"]
...    txt_title=xpath=//android.view.ViewGroup[@resource-id="labelActionBarTitle"]/android.widget.TextView[@text="${txt_shopee_checkout_page['txt_title']}"]