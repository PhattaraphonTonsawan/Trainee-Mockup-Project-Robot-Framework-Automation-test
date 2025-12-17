*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add products to cart
    [Documentation]    เพิ่มสินค้าหลายรายการลงในตะกร้าโดยใช้ลิสต์สินค้าที่กำหนด
    [Arguments]    @{target_product_keys}
    @{product_data_list}=    Create product item list    @{target_product_keys}
    FOR    ${item_data}    IN    @{product_data_list}
        product_list_page.Click add one item to cart    ${item_data['product_name']}
    END
    RETURN    ${product_data_list}

Create product item list
    [Documentation]    สร้างและส่งคืนลิสต์ชื่อสินค้าทั้งหมดจาก dictionary ของสินค้า
    [Arguments]    @{target_keys}
    ${product_list}=    BuiltIn.Create List
    FOR    ${key}    IN    @{target_keys}
        Collections.Append To List    ${product_list}    ${product['${key}']}
    END
    RETURN    ${product_list}