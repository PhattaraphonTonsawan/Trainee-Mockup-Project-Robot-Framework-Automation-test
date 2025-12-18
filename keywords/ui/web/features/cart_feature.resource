*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click cart button and verify page loaded
    [Documentation]    กดคลิ้กไอคอนตะกร้าสินค้าและตรวจสอบว่าอยู่หน้าตะกร้าสินค้าแล้ว
    product_list_page.Click cart icon to go to cart page
    cart_page.Check cart page title

Verify items in cart
    [Documentation]    ตรวจสอบรายละเอียดสินค้าหลายชิ้นตามรายการใน List
    [Arguments]    ${multiple_item_list}
    FOR    ${item}    IN    @{multiple_item_list}
        cart_page.Verify product name in cart
        ...    name=${item['product_name']}
        cart_page.Verify product description in cart
        ...    name=${item['product_name']}
        ...    description=${item['product_description']}
        cart_page.Verify product price in cart
        ...    name=${item['product_name']}
        ...    price=${item['product_price']}
    END

Verify items in cart should fail
    [Documentation]    ตรวจสอบรายละเอียดสินค้าหลายชิ้นตามรายการใน List และผลทดสอบไม่สำเร็จ
    [Arguments]    ${multiple_item_list}
    ${status}=    BuiltIn.Run Keyword And Return Status    Verify items in cart
    ...    multiple_item_list=${multiple_item_list}
    IF    ${status}    BuiltIn.Fail