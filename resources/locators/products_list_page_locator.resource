*** Variables ***
&{product_list_page_locator}
...    txt_title=xpath=//span[@data-test='title']
...    btn_add_all_product_to_cart=xpath=//button[contains(@id,'add-to-cart')]
...    btn_dropdown=data-test=product-sort-container
...    btn_go_to_cart=xpath=//a[@data-test='shopping-cart-link']
...    btn_add_item=xpath=//div[contains(@class, 'inventory_item_name') and text()='***replace***']/ancestor::div[@class='inventory_item']//button