*** Variables ***
&{search_page_locator}
...    btn_search=id=inputSearchBar
...    btn_shopee_mall=xpath=//android.widget.TextView[@text="***replace***"]
...    btn_return_product_list=xpath=//android.view.ViewGroup[@resource-id="inputSearchBar"]/preceding-sibling::android.view.ViewGroup
...    btn_return=xpath=//android.widget.EditText/parent::android.view.ViewGroup/parent::android.view.ViewGroup/preceding-sibling::android.view.ViewGroup[./android.widget.ImageView]
...    ctn_page=id=com.shopee.th:id/main_view
...    ctn_fiter_lts=xpath=(//android.widget.FrameLayout[@resource-id="com.shopee.th:id/DRE_VIEW_CONTAINER_ID"])/descendant::android.widget.TextView[@text="***replace***"]
...    ctn_product=xpath=(//android.widget.FrameLayout[@resource-id="com.shopee.th:id/DRE_VIEW_CONTAINER_ID"])/descendant::android.widget.TextView[contains(@text,"***replace***")]
...    txt_search=xpath=//android.widget.EditText
...    txt_search_result=xpath=//android.widget.TextView[@resource-id="labelSearchBarKeyword"]