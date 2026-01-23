*** Variables ***
&{checkout_page_locator}
...    lbl_product_name=xpath=//android.widget.ImageView[contains(@resource-id, 'itemImage')]/following-sibling::android.widget.TextView[1]
...    lbl_order_price=id=labelOrderTotalPrice
...    container_page=class=android.widget.ScrollView
...    txt_title=id=com.shopee.th:id/labelActionBarTitle