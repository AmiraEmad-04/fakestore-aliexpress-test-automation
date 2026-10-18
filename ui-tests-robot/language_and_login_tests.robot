*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${LOGIN_USER}    your_username
${LOGIN_PASSWORD}    your_password

*** Test Cases ***
sen4
    Open Browser    https://ar.aliexpress.com/?gatewayAdapt=glo2ara    chrome
    Maximize Browser Window
    sleep    3s
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div/div
    Wait Until Element Is Visible    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[1]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[1]
    Wait Until Element Is Visible    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[2]/div[2]
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[4]/div/div[2]/div[2]
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[7]
    sleep    3s
    Page Should Contain    English
    Close Browser

sen5
    Open Browser    https://ar.aliexpress.com/?gatewayAdapt=glo2ara    chrome
    Maximize Browser Window
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Wait Until Element Is Visible    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[3]    20s
    sleep    3s
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[3]
    Wait Until Element Is Visible    xpath= /html/body/div[8]/div/div/div[2]/div/div/div[1]/button    20s
    Click Element    xpath= /html/body/div[8]/div/div/div[2]/div/div/div[1]/button
    Wait Until Element Is Visible    xpath=//*[@id="batman-dialog-wrap"]/div/div/div/div[1]/div/div[3]/div[2]/div/span/span[1]/span[1]/input    30s
    ${user}=    Set Variable    ${LOGIN_USER}
    Input Text    xpath=//*[@id="batman-dialog-wrap"]/div/div/div/div[1]/div/div[3]/div[2]/div/span/span[1]/span[1]/input    ${user}@gmail.com
    Wait Until Element Is Visible    xpath=//span[@class='nfm-multiple-email-prefix' and text()='${user}']/ancestor::div[contains(@class, 'nfm-multiple-email-prompt')]    10s
    Click Element    xpath=//span[@class='nfm-multiple-email-prefix' and text()='${user}']/ancestor::div[contains(@class, 'nfm-multiple-email-prompt')]
    Wait Until Element Is Visible    xpath=//div[@class='_1e0Ux']/button/span[text()='مواصلة']    10s
    Click Element    xpath=//div[@class='_1e0Ux']/button/span[text()='مواصلة']
    Wait Until Element Is Visible    xpath=//input[@type='password' and @id='fm-login-password']
    Input Password    xpath=//input[@type='password' and @id='fm-login-password']    ${LOGIN_PASSWORD}
    Click Element    xpath=/html/body/div[9]/div/div[2]/div/div/div/div[1]/div[9]
    Wait Until Element Is Visible    //iframe[@id='baxia-dialog-content']    timeout=10s
    Select Frame    xpath=//iframe[@id='baxia-dialog-content']
    Wait Until Element Is Visible    xpath=//div[contains(@class, 'nc-container')]    timeout=10s
    sleep    30s

sen6
    Open Browser    https://ar.aliexpress.com/?gatewayAdapt=glo2ara    chrome
    Maximize Browser Window
    sleep    3s
    Click Element    xpath=//div[contains(@class, 'Sk1_X') and contains(@class, '_1-SOk')]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div/div
    Wait Until Element Is Visible    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[6]/div/div[1]
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[6]/div/div[1]
    Wait Until Element Is Visible    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[6]/div/div[2]/div[2]
    Click Element    xpath=/html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[6]/div/div[2]/div[2]
    Click Element    xpath= /html/body/div[1]/div[1]/div/div/div[2]/div/div[2]/div[2]/div[2]/div[7]
    Page Should Contain    USD
    sleep    5s
    Close Browser
