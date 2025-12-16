*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Cancel checkout process
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้าหน้า checkout overview กดปุ่ม cancel แล้วกลับไปที่หน้า product list
    checkout_overview_page.Check page title
    checkout_overview_page.Click cancel button
    product_list_page.Check product list page title

Check all product titles in the page
    [Documentation]    ใช้ for loop ในการตรวจสอบว่ามีชื่อสินค้าทุกชิ้นแสดงอยู่ในหน้า checkout overview
    @{product_keys}=    Collections.Get Dictionary Keys    dictionary=${product}
    FOR    ${key}    IN    @{product_keys}
        ${expected_name}=    BuiltIn.Set Variable    ${product['${key}']['product_name']}
        checkout_overview_page.Check product item title    item_name=${expected_name}
    END

Confirm checkout with 1 item
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้า checkout overview แสดงขึ้นมาแล้วเช็คชื่อสินค้าชิ้นนั้นๆจากนั้นเทียบราคาจริงกับราคาที่แสดงบนหน้า 
    ...    checkout overview แล้วไปที่หน้า checkout complete
    checkout_overview_page.Check page title
    checkout_overview_page.Check product item title    item_name=${product['backpack']['product_name']}
    ${cart_price}=    checkout_feature.Get all product price
    checkout_feature.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title

Confirm checkout with all item
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้า checkout overview แสดงขึ้นมาแล้วเช็คชื่อสินค้าทุกชิ้นในตะกร้าจากนั้นเทียบราคาจริงกับราคาที่แสดงบนหน้า 
    ...    checkout overview แล้วไปที่หน้า checkout complete
    checkout_overview_page.Check page title
    Check all product titles in the page
    ${cart_price}=    checkout_feature.Get all product price
    ${tax}=    checkout_overview_page.Get item tax
    ${cart_price_with_tax}=    BuiltIn.Evaluate    ${cart_price} + ${tax}
    ${page_total_price}=    checkout_overview_page.Get item total price
    BuiltIn.Should Be Equal    ${cart_price_with_tax}    ${page_total_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title

Confirm checkout error
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้า checkout overview แสดงขึ้นมาแล้วเช็คชื่อสินค้าทุกชิ้นในตะกร้าจากนั้นเทียบราคาจริงกับราคาที่แสดงบนหน้า 
    ...    checkout overview แต่เมื่อกดปุ่ม finish จะไม่สามารถไปยังหน้าต่อไปได้
    checkout_overview_page.Check page title
    BuiltIn.Run Keyword And Continue On Failure    Check all product titles in the page
    ${cart_price}=    checkout_feature.Get all product price
    ${tax}=    checkout_overview_page.Get item tax
    ${cart_price_with_tax}=    BuiltIn.Evaluate    ${cart_price} + ${tax}
    ${page_total_price}=    checkout_overview_page.Get item total price
    BuiltIn.Should Be Equal    ${cart_price_with_tax}    ${page_total_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title