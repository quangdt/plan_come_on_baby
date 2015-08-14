*** Settings ***
Library           Selenium2Library    timeout=5.0    implicit_wait=5.0    run_on_failure=Capture Page Screenshot
Library           OperatingSystem

*** Test Cases ***
SetupApp
    [Setup]    Give_App
    [Template]    Select_App
    1    1    test-website1.bizwebvietnam.net

Return_Values
    #    Create List    1    2    3
    ${scalar}=    Get 3
    ${a}    ${b}    ${c}=    Get 3
    ${first}    @{rest}=    Get 3
    @{list}=    Get 3

variable_buil-in
    log    ${CURDIR}
    log    ${TEMPDIR}
    log    ${EXECDIR}
    log    ${/}
    log    ${:}
    log    ${\n}

*** Keywords ***
Order_App
    [Arguments]    ${link_css}=1
    Click Element    css=#divApp > div > div:nth-child(${link_css}) > div > a    ##divApp > div > div:nth-child(1) > div > a

Link_store
    [Arguments]    ${link_store}=mylove.bizwebvietnam.net
    Wait Until Element Is Visible    css=#formLoginRedirect > div > div.col-xs-8 > input
    Input Text    css=#formLoginRedirect > div > div.col-xs-8 > input    ${link_store}    #mylove.bizwebvietnam.net
    Click Element    css=#btnLogin

Select_App
    [Arguments]    ${stt}    ${link_css}    ${link_store}=${EMPTY}
    Order_App    ${link_css}
    Click Element    css=#AppInfo > ul:nth-child(1) > li.list-group-item.btn.dvSetting > a > h4    ##AppInfo > ul:nth-child(1) > li.list-group-item.btn.dvSetting > a > h4
    ${Name_App_Preview}    Get Text    css=#media-heading
    Link_store    ${link_store}
    Login_Store
    Click Element    css=#app-install > form > input.btn.btn-primary.btn-large.top10
    ${Name_App}=    Get Text    css=body > div.page-wrapper > div > div > div > div.page-heading.page-heading-md > h2 > span.breadcrumb > a
    Run Keyword If    '${Name_App_Preview}'=='{Name_App}'    Log    cai dung app

Login_Store
    Input Text    css=#Email    quangdt@dkt.com.vn
    Input Password    css=#Password    123456
    Click Element    css=body > div.container > div > div:nth-child(1) > form > input

Give_App
    Open Browser    https://apps.bizweb.vn/
    Maximize Browser Window
