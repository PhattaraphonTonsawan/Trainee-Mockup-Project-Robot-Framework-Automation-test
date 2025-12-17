*** Settings ***
Resource    ${CURDIR}/../../../../resources/import.resource

*** Keywords ***
Compare total price
    [Documentation]    เปรียบเทียบราคาทั้งหมดบนหน้าเว็บกับราคาจริง (รวมภาษี)
    [Arguments]    ${items_price}
    ${tax_element_text}=    checkout_overview_page.Get item tax
    ${clean_tax_str}=    common.Sanitize text    ${tax_element_text}
    ${clean_tax}=    String.Remove String    ${clean_tax_str}    Tax
    ${expected_total_float}=    BuiltIn.Evaluate    round(${items_price} + float('${clean_tax}'), 2)
    ${page_total_text}=    checkout_overview_page.Get total price
    ${clean_page_total_str}=    common.Sanitize text    ${page_total_text}
    ${clean_page_total}=    String.Remove String    ${clean_page_total_str}    Total
    ${page_total_float}=    BuiltIn.Evaluate    float('${clean_page_total}')
    BuiltIn.Should Be Equal As Numbers    ${page_total_float}    ${expected_total_float}

Get all product price
    [Documentation]    รวมราคาของสินค้าทั้งหมดบนหน้าเว็บ
    ${list_product_price}=    checkout_overview_page.Get list of product price
    ${total_sum}=    BuiltIn.Set Variable    0.0
    FOR    ${element}    IN    @{list_product_price}
        ${price_text}=    common_web.Get element text when visible    locator=${element}
        ${clean_price_str}=    common.Sanitize text    ${price_text}
        ${clean_price}=    String.Remove String    ${clean_price_str}    Item total
        ${total_sum}=    BuiltIn.Evaluate    ${total_sum} + float('${clean_price}')
    END
    RETURN    ${total_sum}