*** Settings ***
Library           Selenium2Library
Library           Collections
Library           String

*** Variables ***
@{LIST_COMMON}    ${1}    ${2}    ${3}    ${4}    ${5}    ${6}    ${7}
...               ${8}    ${9}    ${10}    ${11}    ${12}    ${13}    ${14}
...               ${15}    ${16}    ${17}    ${18}    ${19}    ${20}
${title_question}    ${EMPTY}
${time_question}    ${EMPTY}
${content_question}    ${EMPTY}
${author_question}    ${EMPTY}
${title_question1}    ${EMPTY}
${time_question1}    ${EMPTY}
${content_question1}    ${EMPTY}
${author_question1}    ${EMPTY}

*** Test Cases ***
Compare_Question
    Open Browser    http://www.lamsao.com/hoi-dap
    Maximize Browser Window
    @{list_question}    Create List    ${1}    ${2}    ${3}    ${4}    ${5}
    ...    ${6}    ${7}    ${8}    ${9}    ${10}    ${11}
    ...    ${12}    ${13}    ${14}    ${15}    ${16}    ${17}
    ...    ${18}    ${19}    ${20}
    : FOR    ${index}    IN    @{list_question}
    \    ${title_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.title_question > h2 > a
    \    ${time_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.createdon-question
    \    ${content_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.question_content
    \    ${author_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.question_info > div.author > strong > a > span
    \    Click Element    css=#div_new_question > div:nth-child(${index}) > div.right > div.title_question > h2 > a
    \    ${title_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > h1
    \    ${time_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > div.question_date > strong
    \    ${content_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > div.question_content > p
    \    ${author_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_left > div.realname > a
    \    Go Back
    \    Exit For Loop If    '${title_question}' != '${title_question1}'

*** Keywords ***
information_common
    [Arguments]    ${index}
    ${title_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.title_question > h2 > a    ##div_new_question > div:nth-child(2) > div.right > div.title_question > h2 > a
    ${time_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.createdon-question
    ${content_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.question_content
    ${author_question}    Get Text    css=#div_new_question > div:nth-child(${index}) > div.right > div.question_info > div.author > strong > a > span
    Click Element    css=#div_new_question > div:nth-child(${index}) > div.right > div.title_question > h2 > a

information_description
    ${title_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > h1
    ${time_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > div.question_date > strong
    ${content_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_right > div.question_content > p
    ${author_question1}    Get Text    css=#question_detail > div.question > div > div.question_content_top > div.question_content_left > div.realname > a
