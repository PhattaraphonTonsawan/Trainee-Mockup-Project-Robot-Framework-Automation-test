*** Variables ***
&{product_page_locator}
...    btn_add_to_cart=id=buttonProductAddCart
...    btn_add_to_cart_feed=xpath=//android.view.ViewGroup[@resource-id="miniFeedV2_atc_button"]/android.widget.ImageView
...    btn_buy_now=id=miniFeedV2_buy_now_button
...    btn_buy_now_feed=id=buttonProductBuyNow
...    btn_add_to_cart_modal=class=android.widget.Button
...    btn_cart=xpath=(//android.view.ViewGroup[@resource-id="buttonActionBarView"])[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup
...    btn_cart_feed=xpath=//android.widget.FrameLayout[@resource-id="com.shopee.th.dfpluginshopee16:id/rn_root_content"]/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup/android.widget.ImageView
...    btn_select_variation=xpath=(//android.view.ViewGroup[@resource-id="buttonOption_selected"])[1]
...    btn_unselect_variation=xpath=(//android.view.ViewGroup[@resource-id="buttonOption_unselected"])[1]
...    variation_section_1=xpath=(//android.view.ViewGroup[@resource-id="cartPanelTierVariation"])[1]
...    variation_section_2=xpath=(//android.view.ViewGroup[@resource-id="cartPanelTierVariation"])[2]
...    txt_product_name_feed=xpath=//android.widget[@resource-id='miniFeedV2_product_card']//android.widget.TextView[1]
...    txt_product_name=xpath=//android.widget.TextView[@resource-id="labelProductPageProductName"]