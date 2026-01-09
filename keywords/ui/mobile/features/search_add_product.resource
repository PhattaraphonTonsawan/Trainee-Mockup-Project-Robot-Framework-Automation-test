*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Search product by name click to product page
    [Documentation]    ค้นหาสินค้าโดยระบุชื่อ และกดเลือกสินค้านั้นเพื่อไปยังหน้ารายละเอียดสินค้า
    home_page.Click search bar
    search_page.Input search
    search_page.Click search icon
    search_page.Click product card

Add product to cart
    [Documentation]    หลังจากค้นหาสินค้าแล้วเพิ่มสินค้า
    product_mobile_page.Click add to cart button
    product_mobile_page.Click add to cart button in modal
    product_mobile_page.Click cart button