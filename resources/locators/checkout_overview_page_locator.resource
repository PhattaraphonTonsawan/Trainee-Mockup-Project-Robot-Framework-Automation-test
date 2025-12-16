*** Variables ***
&{checkout_overview_page_locator}
...    txt_page_title=xpath=//span[@data-test='title']
...    txt_item_name=xpath=//div[@class='inventory_item_name']
...    txt_item_prices=xpath=//div[@class='inventory_item_price']
...    txt_item_total_price=xpath=//div[@data-test='subtotal-label']
...    txt_tax=xpath=//div[@data-test='tax-label']
...    txt_total_price=xpath=//div[@data-test='total-label']
...    btn_finish=id=finish
...    btn_cancel=id=cancel