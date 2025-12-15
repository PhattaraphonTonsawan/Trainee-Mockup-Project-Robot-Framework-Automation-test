*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click cart icon to go to cart page and check cart page title
    [Documentation]    กดคลิกไอคอนตะกร้าสินค้าและตรวจสอบว่าอยู่หน้าตะกร้าสินค้าแล้ว
    product_list_page.Click cart icon to go to cart page
    cart_page.Check cart page title
    
Remove product item from cart by click remove button
    [Documentation]
    [Arguments]    ${product_name}
    cart_page.Check cart page title
    cart_page.Click remove one item from cart    product_name=${product_name}

Verify one item detail at cart page
    [Documentation]    Verifies a single product's details in the cart
    [Arguments]    ${product} 
    cart_page.Verify Specific Product Detail In Cart
    ...    name=${product['product_name']}
    ...    price=${product['product_price']}
    ...    description=${product['product_description']}

Verify Multiple Items In Cart
    [Documentation]    Iterates through a list of product data dictionaries and verifies that each item exists in the cart with correct details.
    [Arguments]    ${expected_item}
    FOR    ${item}    IN    @{expected_item}
        cart_page.Verify Specific Product Detail In Cart
        ...    name=${item.product_name}
        ...    price=${item.product_price}
        ...    description=${item.product_description}
    END

