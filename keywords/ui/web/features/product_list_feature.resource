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
    ${is_string}=    BuiltIn.Evaluate    isinstance($target_keys, str)
    IF    ${is_string}
        ${keys_list}=    BuiltIn.Create List   ${target_keys}
    ELSE
        ${keys_list}=    BuiltIn.Set Variable    ${target_keys}
    END
    ${product_list}=    BuiltIn.Create List
    FOR    ${key}    IN    @{keys_list}
        Collections.Append To List    ${product_list}    ${product['${key}']}
    END
    RETURN    ${product_list}

Verify products are sorted by name from a to z
    [Documentation]    ตรวจสอบว่าสินค้าเรียงตามชื่อ A -> Z ถูกต้อง
    ${default_list}=    product_list_page.Get product name list from page
    ${expected_list}=    Collections.Copy List    list_=${default_list}
    Collections.Sort List    list_=${expected_list}
    Collections.Lists Should Be Equal    list1=${default_list}    list2=${expected_list}

Verify products are sorted by name from z to a
    [Documentation]    ตรวจสอบว่าสินค้าเรียงตามชื่อ z -> A ถูกต้อง
    ${default_list}=    product_list_page.Get product name list from page
    ${expected_list}=    Collections.Copy List    list_=${default_list}
    Collections.Sort List    list_=${expected_list}
    Collections.Reverse List    list_=${expected_list}
    Collections.Lists Should Be Equal    list1=${default_list}    list2=${expected_list}

Verfiy products are sorted by price from low to high
    [Documentation]    ตรวจสอบว่าสินค้าเรียงตามราคา ต่ำ ไป สูง ถูกต้อง
    ${default_list}=    product_list_page.Get product price list from page
    ${expected_list}=    Collections.Copy List    list_=${default_list}
    Collections.Sort List    list_=${expected_list}
    Collections.Lists Should Be Equal    list1=${default_list}    list2=${expected_list}

Verfiy products are sorted by price from high to low
    [Documentation]    ตรวจสอบว่าสินค้าเรียงตามราคา สูง ไป ต่ำ ถูกต้อง
    ${default_list}=    product_list_page.Get product price list from page
    ${expected_list}=    Collections.Copy List    list_=${default_list}
    Collections.Sort List    list_=${expected_list}
    Collections.Lists Should Be Equal    list1=${default_list}    list2=${expected_list}