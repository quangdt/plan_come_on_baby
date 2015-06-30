*** Settings ***
Library           Selenium2Library    timeout=5.0    implicit_wait=5.0    run_on_failure=Capture Page Screenshot
Library           String

*** Test Cases ***    TC            Action                              Username    Password    Alert                                     Page Content                           Username Return
Login_Invalid_To_Valid
                      [Setup]       Setup_Login
                      [Template]    Flow_Login_From_Invalid_To_Valid
                      TC1           Leave Username and password null    ${EMPTY}    ${EMPTY}    Yêu cầu nhập thông tin Tên đăng nhập !    ${EMPTY}                               ${EMPTY}
                      TC2           Leave Password null                 quang       ${EMPTY}    Yêu cầu nhập thông tin Mật khẩu !         ${EMPTY}                               ${EMPTY}
                      TC3           Leave Username is null              ${EMPTY}    12345       Yêu cầu nhập thông tin Tên đăng nhập !    ${EMPTY}                               ${EMPTY}
                      TC4           Username invalid                    abcdefgh    111111      ${EMPTY}                                  Tài khoản đăng nhập không tồn tại !    ${EMPTY}
                      TC5           Password invalid                    quang       1           ${EMPTY}                                  Tài khoản đăng nhập không hợp lệ !     ${EMPTY}
                      TC6           Username and Password invalid       abcdefgh    123         ${EMPTY}                                  Tài khoản đăng nhập không tồn tại !    ${EMPTY}
                      TC7           Username and Password valid         quang       111111      ${EMPTY}                                  ${EMPTY}                               quang
                      [Teardown]    Setup_Logout

*** Keywords ***
Setup_Login
    Open Browser    http://www.lamsao.com/
    Maximize Browser Window
    Page Should Contain    Làm sao
    Click Link    css=#login

Flow_Login_From_Invalid_To_Valid
    [Arguments]    ${id}    ${action}    ${username}    ${password}    ${alert}    ${pagecontain}
    ...    ${userreturn}=${EMPTY}
    Login_Username_Password    ${username}    ${password}
    Run Keyword If    '${alert}' != '${EMPTY}'    Check_Valid_Alert_Login    ${alert}
    Run Keyword If    '${alert}' == '${EMPTY}'    Check_Valid_Page_Contain_Login    ${pagecontain}    ${userreturn}

Login_Username_Password
    [Arguments]    ${username}    ${password}=${EMPTY}
    Focus    css=#ctl00_cphMain_ctl00_ctl00_ctl00_txtUserName
    Input Text    css=#ctl00_cphMain_ctl00_ctl00_ctl00_txtUserName    ${username}
    Focus    css=#ctl00_cphMain_ctl00_ctl00_ctl00_txtPassword
    Input Password    css=#ctl00_cphMain_ctl00_ctl00_ctl00_txtPassword    ${password}
    Click Button    css=#ctl00_cphMain_ctl00_ctl00_ctl00_btnLogin

Check_Valid_Alert_Login
    [Arguments]    ${alert}=${EMPTY}
    Alert Should Be Present    ${alert}

Check_Valid_Page_Contain_Login
    [Arguments]    ${pagecontain}    ${userreturn}=${EMPTY}
    Run Keyword If    '${pagecontain}'!='${EMPTY}'    Page Should Contain Element    css=#login_new > div.table_login > div:nth-child(1) > div.value    ${pagecontain}
    Run Keyword If    '${pagecontain}'=='${EMPTY}'    Page Should Contain Element    css=#banner > div > div:nth-child(1) > div.headerCopy > div > div > a:nth-child(4)    ${userreturn}

Setup_Logout
    Click Element    css=#logout
    Choose Ok On Next Confirmation
    Close All Browsers
