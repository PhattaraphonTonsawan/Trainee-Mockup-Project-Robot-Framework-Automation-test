*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Cancel checkout process
    [Documentation]    กดปุ่ม cancel ที่หน้า checkout overview เพื่อกลับไปหน้า product list
    checkout_overview_page.Check page title
    checkout_overview_page.Click cancel button
    product_list_page.Check product list page title

Check all product titles in the page
    [Documentation]    ใช้ for loop ในการตรวจสอบว่ามีชื่อสินค้าทุกชิ้นแสดงอยู่ในหน้า checkout overview
    [Arguments]    ${product_list}
    FOR    ${item}    IN    @{product_list}
        checkout_overview_page.Check product item title    item_name=${item['product_name']}
    END

Confirm checkout with all item
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้า checkout overview แสดงขึ้นมาแล้วเช็คชื่อสินค้าทุกชิ้นในตะกร้าจากนั้นเทียบราคาจริงกับราคาที่แสดงบนหน้า 
    ...    checkout overview แล้วไปที่หน้า checkout complete
    [Arguments]    @{product_list}
    checkout_overview_page.Check page title
    Check all product titles in the page    product_list=@{product_list}
    ${cart_price}=    checkout_feature.Get all product price
    checkout_feature.Compare total price    items_price=${cart_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title

Confirm checkout error
    [Documentation]    ตรวจสอบขั้นตอนการสั่งซื้อว่าหัวข้อหน้า checkout overview แสดงขึ้นมาแล้วเช็คชื่อสินค้าทุกชิ้นในตะกร้าจากนั้นเทียบราคาจริงกับราคาที่แสดงบนหน้า 
    ...    checkout overview แต่เมื่อกดปุ่ม finish จะไม่สามารถไปยังหน้าต่อไปได้
    [Arguments]    ${product_list}
    checkout_overview_page.Check page title
    Check all product titles in the page    product_list=${product_list}
    ${cart_price}=    checkout_feature.Get all product price
    ${tax}=    checkout_overview_page.Get item tax
    ${cart_price_with_tax}=    BuiltIn.Evaluate    ${cart_price} + ${tax}
    ${page_total_price}=    checkout_overview_page.Get total price
    BuiltIn.Should Be Equal    ${cart_price_with_tax}    ${page_total_price}
    checkout_overview_page.Click finish button
    checkout_complete_page.Check page title