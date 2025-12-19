*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Add products to cart
    [Documentation]    เพิ่มสินค้าหลายรายการลงในตะกร้าโดยใช้ลิสต์สินค้าที่กำหนด
    [Arguments]    ${target_product_keys}
    @{product_data_list}=    Create product item list    target_keys=${target_product_keys}
    FOR    ${item_data}    IN    @{product_data_list}
        product_list_page.Click add one item to cart    ${item_data['product_name']}
    END
    RETURN    ${product_data_list}

Create product item list
    [Documentation]    สร้างและส่งคืนลิสต์ชื่อสินค้าทั้งหมดจาก dictionary ของสินค้า
    [Arguments]    ${target_keys}
    ${product_type}=    Collections.Get Dictionary Keys    ${product}
    ${product_category}=    BuiltIn.Create Dictionary
    FOR    ${type}    IN    @{product_type}
        ${item_list}=    Collections.Get Dictionary Keys    ${product['${type}']}
        FOR    ${property}    IN    @{item_list}
            Collections.Set To Dictionary    ${product_category}    ${property}=${product['${type}']['${property}']}
        END
    END
    ${is_string}=    BuiltIn.Evaluate    isinstance($target_keys, str)
    IF    ${is_string}
        ${keys_list}=    BuiltIn.Create List   ${target_keys}
    ELSE
        ${keys_list}=    BuiltIn.Set Variable    ${target_keys}
    END
    ${product_list}=    BuiltIn.Create List
    FOR    ${key}    IN    @{keys_list}
        Collections.Append To List    ${product_list}    ${product_category['${key}']}
    END
    RETURN    ${product_list}