*** Variables ***
&{cart_page_mobile_locator}
...    btn_add_item_quantity=id=buttonAddMoreQuantity
...    btn_checkout=id=buttonCheckout
...    btn_confirm_delete=id=com.shopee.th:id/buttonDefaultPositive
...    btn_direct_delete=xpath=//android.widget.TextView[@text="***replace***"]
...    ctn_page=xpath=//android.widget.ScrollView/android.view.ViewGroup0
...    ctn_product_card=xpath=//android.widget.TextView[@text="***replace***"]/ancestor::android.view.ViewGroup[starts-with(@resource-id,"itemRow_")]
...    lbl_empty_cart_first=xpath//android.widget.TextView[@text="***replace***"]
...    lbl_empty_cart_second=xpath//android.widget.TextView[@text="***replace***"]
...    txt_title=id=labelActionBarTitle
...    txt_product_name=id=labelItemName
...    txt_product_price=xpath//android.widget.TextView[@text="***replace***"]
...    txt_product_quantity=xpath//android.widget.TextView[@text="***replace***"]