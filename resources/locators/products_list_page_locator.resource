*** Settings ***
Documentation       product list page locators for Sauce Demo application.

*** Variables ***
&{product_list_page_locator}
...    txt_title=data-test=title
...    add_all_product_to_cart_btn=xpath=//button[contains(@id,'add-to-cart')]
...    add_one_item_product_to_cart_btn=id=add-to-cart-sauce-labs-backpack
...    dropdown_btn=data-test=product-sort-container
...    go_to_cart_btn=data-test=shopping-cart-link
...    option_A_to_Z=value=az
...    option_Z_to_A=value=za
...    option_lo_to_hi=value=lohi
...    option_hi_to_lo=value=hilo
