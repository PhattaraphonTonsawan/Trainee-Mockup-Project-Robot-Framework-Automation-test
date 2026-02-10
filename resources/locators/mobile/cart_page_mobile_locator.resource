*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{cart_page_mobile_locator}
...    btn_add_item_quantity=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[@resource-id="buttonAddMoreQuantity"]
...    btn_checkout=xpath=//android.view.ViewGroup[@resource-id="buttonCheckout"]
...    btn_direct_delete=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[starts-with(@resource-id,"itemRow_")]//android.widget.TextView[@text="${txt_shopee_cart_page['txt_btn_delete']}"]
...    btn_delete_all_item=xpath=//android.view.ViewGroup[@resource-id="viewCheckoutBar"]//android.widget.Button//android.widget.TextView[@text="${txt_shopee_cart_page['txt_btn_delete']}"]
...    btn_edit_cart=xpath=//android.view.ViewGroup[@resource-id="buttonActionBarView"]
...    btn_confirm=xpath=//android.widget.TextView[@resource-id="com.shopee.th:id/buttonDefaultPositive"]
...    ctn_page=xpath=//android.widget.ScrollView
...    ctn_product_card=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[starts-with(@resource-id,"itemRow_")]
...    chb_select_all_product=xpath=//android.view.ViewGroup[@resource-id="checkboxTouchableWrapper"]//android.view.ViewGroup[@resource-id="buttonCheckBoxNotChecked"]
...    confirm_popup=xpath=//android.widget.TextView[@resource-id="com.shopee.th:id/content"]
...    lbl_empty_cart_first=xpath=//android.widget.TextView[@text="${txt_shopee_cart_page['txt_cart_empty_first']}"]
...    lbl_shop_name=xpath=//android.widget.TextView[@resource-id="labelShopName"]
...    lbl_empty_cart_second=xpath=//android.widget.TextView[@text="${txt_shopee_cart_page['txt_cart_empty_second']}"]
...    txt_product_name=xpath=//android.widget.TextView[@resource-id="labelItemName"]
...    txt_product_quantity=xpath=//android.view.ViewGroup[@resource-id="textInputQuantity"]/android.widget.EditText
...    txt_title=xpath=//android.view.ViewGroup[@resource-id="labelActionBarTitle"]/android.widget.TextView[@text="${txt_shopee_cart_page['txt_title']}"]