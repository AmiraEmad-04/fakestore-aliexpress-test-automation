*** Variables ***
${URL}            https://ar.aliexpress.com/?gatewayAdapt=glo2ara
${SEARCH_TERM}    smartphone
${BROWSER}        chrome
${TIMEOUT}        30s
${UNITED_STATES_ARABIC}    الولايات المتحدة الأمريكية
${UNITED_STATES_ENGLISH}    United States
${Product}        Cat toy

*** Settings ***
Library           SeleniumLibrary

*** Test Cases ***
Scenario7
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    # Wait if CAPTCHA appears (manual fallback)
    Wait Until Page Contains Element    xpath=//input[@name='searchWords']    timeout=60s
    # Search for the product
    Input Text    xpath=//input[@name='searchWords']    ${SEARCH_TERM}
    Press Key    xpath=//input[@name='searchWords']    \\13
    Wait Until Element Is Visible    xpath=(//a[contains(@href, 'item')])[1]    timeout=20s
    # Click the first product
    Click Element    xpath=//span[@class='mk_a8']
    Wait Until Page Contains Element    xpath=//div[contains(@class, 'image-view')]    timeout=60s
    sleep    60s
    Mouse Over    xpath=//div[contains(@class, 'image-view')]
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'magnifier--behiver--cY4D2TR')]    timeout=10s
    # Verify that the zoomed-in image div is visible
    Element Should Be Visible    xpath=//div[contains(@class, 'magnifier--behiver--cY4')]
    Close Browser

Scenario 8
    Open Browser    ${URL}
    Maximize Browser Window
    Sleep    3s    # Wait for the page to load
    # Scroll to the ship-to section (country)
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div/div
    # Click the country flag dropdown
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div[1]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div[1]
    # Select United States from the dropdown in Arabic
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div[2]/div[3]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[2]/div/div[2]/div[3]
    # Click Save button
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[7]
    # Wait for the page to reflect changes
    Sleep    3s
    #Reload Page
    # Assert: Verify the country is now United States in English
    Page Should Contain    United States
    # Assert: Verify the currency is USD
    Page Should Contain    USD
    # Assert: Verify the language is English
    page Should Contain    English
    Close Browser
