*** Variables ***
&{cart_page_locator}
...    txt_title=xpath=//span[@data-test='title']
...    btn_back_to_shopping=id=continue-shopping
...    btn_remove_item=xpath=//div[contains(@class,'inventory_item_name') and text()='***replace***']/ancestor::div[@class,'inventory_item']//button
...    btn_checkout=id=checkout
...    btn_hamburger_menu=id=react-burger-menu-btn
...    btn_reset_cart=id=reset_sidebar_link
...    lbl_item_name=xpath=//div[contains(@class,'inventory_item_name') and text()='***replace***']/ancestor::div[@class='cart_item']
...    lbl_item_description=xpath=//div[contains(@class,'inventory_item_name') and text()='***replace***']/ancestor::div[@class='cart_item']//div[@class='inventory_item_desc']
...    lbl_item_price=xpath=//div[contains(@class,'inventory_item_name') and text()='***replace***']/ancestor::div[@class='cart_item']//div[@class='inventory_item_price']