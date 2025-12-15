*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click cart icon to go to cart page and check cart page title
    [Documentation]    กดคลิ้กไอคอนตะกร้าสินค้าและตรวจสอบว่าอยู่หน้าตะกร้าสินค้าแล้ว
    product_list_page.Click cart icon to go to cart page
    cart_page.Check cart page title
    
Remove product item from cart by click remove button
    [Documentation]    ลบสินค้าออกจากตะกร้าโดยการกดปุ่มลบสินค้า
    [Arguments]    ${product_name}
    cart_page.Click remove one item from cart    product_name=${product_name}

Verify one item detail at cart page
    [Documentation]    ตรวจสอบรายละเอียดสินค้าหนึ่งชิ้นในตะกร้า
    [Arguments]    ${product} 
    cart_page.Verify Specific Product Detail In Cart
    ...    name=${product['product_name']}
    ...    price=${product['product_price']}
    ...    description=${product['product_description']}

Verify Multiple Items In Cart
    [Documentation]    ตรวจสอบรายละเอียดสินค้าหลายชิ้นตามรายการใน List
    [Arguments]    ${expected_item}
    FOR    ${item}    IN    @{expected_item}
        cart_page.Verify Specific Product Detail In Cart
        ...    name=${item.product_name}
        ...    price=${item.product_price}
        ...    description=${item.product_description}
    END

