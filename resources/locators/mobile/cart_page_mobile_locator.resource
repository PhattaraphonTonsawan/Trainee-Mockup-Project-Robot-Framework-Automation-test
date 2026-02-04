*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{cart_page_mobile_locator}
...    btn_add_item_quantity=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[@resource-id="buttonAddMoreQuantity"]
...    btn_checkout=id=buttonCheckout
...    btn_direct_delete=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[starts-with(@resource-id,"itemRow_")]//android.widget.TextView[@text="${txt_shopee_cart_page['txt_btn_delete']}"]
...    ctn_page=xpath=//android.widget.ScrollView
...    ctn_product_card=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[starts-with(@resource-id,"itemRow_")]
...    lbl_empty_cart_first=xpath//android.widget.TextView[@text="${txt_shopee_cart_page['txt_cart_empty_first']}"]
...    lbl_empty_cart_second=xpath//android.widget.TextView[@text="${txt_shopee_cart_page['txt_cart_empty_first']}"]
...    txt_product_name=id=labelItemName
...    txt_product_quantity=id=textInputQuantity
...    txt_title=id=labelActionBarTitle