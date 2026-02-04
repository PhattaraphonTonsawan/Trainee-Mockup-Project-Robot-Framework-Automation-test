*** Variables ***
&{search_page_locator}
...    btn_search=id=inputSearchBar
...    btn_shopee_mall=xpath=//android.widget.TextView[@text="***replace***"]
...    ctn_page=id=com.shopee.th:id/swipe_refresh_layout
...    ctn_fiter_lts=xpath=(//android.widget.FrameLayout[@resource-id="com.shopee.th:id/DRE_VIEW_CONTAINER_ID"])/descendant::android.widget.TextView[@text="***replace***"]
...    ctn_product=xapth=//android.widget.TextView[@text="***replace***"]
...    txt_search=xpath=//android.widget.EditText
<<<<<<< Updated upstream
...    txt_search_result=xapth=//android.widget.TextView[@resource-id="labelSearchBarKeyword"]
=======
...    txt_search_result=xpath=//android.widget.TextView[@resource-id="labelSearchBarKeyword"]
>>>>>>> Stashed changes
