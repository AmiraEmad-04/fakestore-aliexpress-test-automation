Language: English

*** Keywords ***
performforloop

*** Settings ***
Library           SeleniumLibrary
Library           Collections
Library           String

*** Variables ***
${Product}        Clothes
${cart_count}     \
${cart_count_after}    \
${certain_product}    \
${product_title}    \
${URL}            https://ar.aliexpress.com/?gatewayAdapt=glo2ara
${TIMEOUT}        30s
${UNITED_STATES_ARABIC}    الولايات المتحدة الأمريكية
${UNITED_STATES_ENGLISH}    United States
${minvalue}       850
${maxvalue}       1249
${Category}       \
${selectedcategory}    \
${newCategory}    \
${newselectedcategory}    \
@{prices}
${price_element}    \

*** Test Cases ***
Scenario3
    Open Browser    https://www.aliexpress.com/
    Maximize Browser Window
    Input Text    name=searchWords    ${Product}
    Click Button    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[1]/div/input[2]
    Page Should Contain    ${Product}
    ${cart_count}=    Get Text    xpath=//span[@class='shop-cart--number--axE62FE']
    Click Element    xpath=/html/body/div[2]/div[1]/div/div[2]/div[2]/div/div[1]/div/div/a/div[1]/div[2]/div/span
    Sleep    30s
    Wait Until Element Is Visible    xpath=//button[.//span[contains(text(), 'أضف إلى العربة')]]
    ${certain_product}    Get Text    xpath://h1[@data-pl="product-title"]
    Click Button    xpath=//button[.//span[contains(text(), 'أضف إلى العربة')]]
    Wait Until Element Is Visible    xpath=//a[.//b[text()='سلة']]
    ${cart_count_after}    Get Text    xpath=//span[@class='shop-cart--number--axE62FE']
    Run Keyword And Continue On Failure    Should Be Equal    ${cart_count}    ${cart_count_after}
    Click Element    xpath=//a[.//b[text()='سلة']]
    ${product_title}=    Get Text    xpath://a[@class="cart-product-name-title"]
    Should Be Equal    ${product_title}    ${certain_product}

Scenario2
    Open Browser    https://www.aliexpress.com/    chrome
    Maximize Browser Window
    Input Text    name=searchWords    ${Product}
    Click Button    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[1]/div/input[2]
    Page Should Contain    ${Product}
    ${Category}=    Get Text    xpath=//span[@class="i0_ae"]
    ${selectedcategory}=    Get Text    xpath=//span[text()="طباعة شاملة"]
    Click Element    xpath=//span[@class="jh_jk"]//span[text()="طباعة شاملة"]
    Wait Until Element Is Visible    xpath=//div[@class="a5_be"]//span[@class="a5_ae"]
    ${newCategory}=    Get Text    xpath=//div[@class="a5_be"]//span[@class="a5_ae"]
    ${newselectedcategory}=    Get Text    xpath=//div[@class="a5_be"]//span[@class="a5_bf"]
    ${Category}=    Strip String    ${Category}
    ${newCategory}=    Strip String    ${newCategory}
    ${selectedcategory}=    Strip String    ${selectedcategory}
    ${selectedcategory}    Strip String    ${newselectedcategory}
    Should Be Equal    ${newselectedcategory}    ${selectedcategory}
    Input Text    name=minPrice    ${minvalue}
    Input Text    name=maxPrice    ${maxvalue}
    Click Element    xpath=/html/body/div[2]/div[1]/div/div[1]/div[11]/div[2]/div/div/span[4]
    Wait Until Element Is Visible    xpath=/html/body/div[2]/div[1]/div/div[2]/div[1]/div/div/div/div/span
    Sleep    3s
    @{prices}=    Get WebElements    xpath=//span[contains(@class, 'man-price')]
    FOR    ${price_element}    IN    @{prices}
        ${price_text}=    Get Text    ${price_element}
        ${price_text}=    Replace String    ${price_text}    $
        ${price_text}=    Replace String    ${price_text}    US
        ${price_text}=    Strip String    ${price_text}
        ${price}=    Convert To Number    ${price_text}
        Should Be True    ${price} >= ${minvalue}
        Should Be True    ${price} <= ${maxvalue}
    END

Scenario1
    Open Browser    https://www.aliexpress.com/
    Maximize Browser Window
    Input Text    name=searchWords    ${Product}
    Click Button    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[1]/div/input[2]
    Page Should Contain    ${Product}
