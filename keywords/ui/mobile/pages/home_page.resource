*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Click search bar
    [Documentation]    กดที่แถบค้นหาเพื่อเริ่มการพิมพ์
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['txt_seach_item']}
    common_mobile.Click element when ready    locator=${home_page_locator['txt_seach_item']}

Click product card
    [Documentation]    กดเลือกสินค้าชิ้นแรก หรือสินค้าที่แสดงผลอยู่ (Product Card)
    common_mobile.Swipe into element and wait until element ready    locator=${home_page_locator['product_card']}
    common_mobile.Click element when ready    locator=${home_page_locator['product_card']}

Click user menu
    [Documentation]    กดเมนู "ฉัน" (User Profile) ที่แถบด้านล่าง
    common_mobile.Click element when ready    locator=${home_page_locator['btn_profile']}

Click coin reward menu
    [Documentation]    กดเมนูสะสมเหรียญรางวัล (Coin Rewards)
    common_mobile.Click element when ready    locator=${home_page_locator['btn_coin_menu']}