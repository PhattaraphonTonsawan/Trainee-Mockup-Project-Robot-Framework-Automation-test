*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add one item to cart
    [Documentation]    เพิ่มสินค้า 1 รายการ (เช่น Sauce Labs Backpack) ลงในตะกร้า
    [Arguments]    ${product_name}
    product_list_page.Click add one item to cart    product_name=${product_name}

Add multiple products to cart
    [Documentation]    เพิ่มสินค้าหลายรายการลงในตะกร้าโดยใช้ลิสต์สินค้าที่กำหนด
    [Arguments]    ${product_key}
    @{product_name_list}=    Create product item list    product_key=${product_key}
    FOR    ${product_name}    IN    @{product_name_list}
        product_list_page.Click add one item to cart    ${product_name['product_name']}
    END

Create product item list
    [Documentation]    สร้างและส่งคืนลิสต์ชื่อสินค้าทั้งหมดจาก dictionary ของสินค้า
    [Arguments]    ${product_key}
    ${product_list}=    Collections.Get Dictionary Keys    ${product_key}
    ${product_name_list}=    BuiltIn.Create List
    FOR    ${product_item}    IN    @{product_list}
        Collections.Append To List    ${product_name_list}    ${product['${product_item}']}
    END
    RETURN    ${product_name_list}