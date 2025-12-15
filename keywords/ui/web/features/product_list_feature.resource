*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add one item to cart
    [Documentation]    เพิ่มสินค้า 1 รายการ (เช่น Sauce Labs Backpack) ลงในตะกร้า
    [Arguments]    ${product_name}    ${product_price}    ${product_description}
    product_list_page.Click add one item to cart    product_name=${product_name}
    product_list_page.Click go to cart page
    product_list_page.Check product detail have added to cart    product_detail=${product_name}
    product_list_page.Check product detail have added to cart    product_detail=${product_price}
    product_list_page.Check product detail have added to cart    product_detail=${product_description}

Add multiple products to cart
    [Documentation]    เพิ่มสินค้าหลายรายการลงในตะกร้าโดยใช้ลิสต์สินค้าที่กำหนด
    [Arguments]    ${items_to_add}
    FOR    ${product_name}    IN    @{items_to_add}
        product_list_page.Click add one item to cart    ${product_name}
    END

Create product item list
    [Documentation]    สร้างและส่งคืนลิสต์ชื่อสินค้าทั้งหมดจาก dictionary ของสินค้า
    ${product_list}=    Collections.Get Dictionary Keys    ${product}
    ${product_name_list}=    BuiltIn.Create List
    FOR    ${product_item}    IN    @{product_list}
        Collections.Append To List    ${product_name_list}    ${product['${product_item}']['product_name']}
    END
    RETURN    ${product_name_list}