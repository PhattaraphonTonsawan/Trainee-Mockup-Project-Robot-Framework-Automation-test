*** Settings ***
Resource    ${CURDIR}/../../import.resource

*** Variables ***
&{product_mobile_page_locator}
...    btn_add_to_cart=xpath=//android.view.ViewGroup[@resource-id="buttonProductAddCart"]
...    btn_buy_now=xpath=//android.view.ViewGroup[@resource-id="buttonProductBuyNow" and .//android.widget.TextView[@text="${txt_product_page['txt_buy_now']}"]]
...    btn_cart=xpath=//android.view.ViewGroup[@resource-id="buttonActionBarView"]/android.view.ViewGroup/android.widget.ImageView
...    btn_in_modal=xpath=//android.widget.TextView[@text="***replace***"]
...    txt_product_name=xpath=//android.widget.TextView[@resource-id="labelProductPageProductName"]