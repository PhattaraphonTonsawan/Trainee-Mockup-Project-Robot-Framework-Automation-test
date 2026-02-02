*** Settings ***
Resource    ${CURDIR}/../../../resources/import.resource

*** Test Cases ***
TS_01001_001
    [Documentation]    ทดสอบการทำการสั่งซื้อสินค้า 1 ชิ้น แล้วมาที่หน้าแสดงหน้าทำการสั่งซื้อ ด้วยการเข้าสู่ระบบด้วย บัญชี google 
    [Tags]    F_0001    TS_01001    TS_01001_001    add_product_to_cart
    
    #Step 10: ค้นหาสินค้าด้วยการ Search ชื่อสินค้า
    shopee_search_feature.Input product name in search box and tap search button
    ...    product_name=${product_detail['product_name']}
    #Step 11: ค้นหาสินค้าจากผลลัพธ์การค้นหากดเลือกสินค้าเป้าหมาย
    shopee_search_feature.Filter search results by shopee mall
    shopee_search_feature.Find product in search results and tap product item
    ...    product_name=${product_detail['product_name']}
    shopee_product_page.Check product name on product page
    ...    product_name=${product_detail['product_name']}
    #Step 12: สั่งซื้อสินค้า
    shopee_product_feature.Buy item now from product page
    shopee_checkout_page.Check checkout page title
    shopee_checkout_feature.Verify order details on checkout page
    ...    product_name=${product_detail['product_name']}
    ...    product_qty=${product['quantity']}
