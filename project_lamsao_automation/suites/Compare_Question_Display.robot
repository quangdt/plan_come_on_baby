*** Settings ***
Library           Selenium2Library

*** Test Cases ***
Compare_Question
    Open Browser    http://www.lamsao.com/hoi-dap
    ${title_question}    Get Text    css=#div_new_question > div:nth-child(1) > div.right > div.title_question > h2 > a
    ${time_post}    Get Text    css=#div_new_question > div:nth-child(1) > div.right > div.createdon-question
