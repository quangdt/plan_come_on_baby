*** Settings ***
Library           String

*** Test Cases ***
Catenate

Convert_To_Lowercase_Uppercase

Decode_Encode_String_and_Byte
    ${byte}=    Encode String To Bytes    Đỗ Thị Quang    UTF-8
    Log    ${byte}
    ${str1}=    Decode Bytes To String    ${byte}    UTF-8
    Log    ${str1}
    ${byte}=    Encode String To Bytes    quang    ASCII    erros=ignore
    Log    ${byte}
    ${str1}=    Decode Bytes To String    ${byte}    ASCII    erros=ignore
    Log    ${str1}
    ${byte}=    Encode String To Bytes    quang    ASCII    erros=ignore
    Log    ${byte}
    ${str1}=    Decode Bytes To String    ${byte}    UTF-8
    Log    ${str1}
    #case test chuỗi nhập vào theo định dạng UTF-8
    #${byte}=    Encode String To Bytes    Đỗ Thị Quang    ASCII    erros=ignore
    #Log    ${byte}
    #${str1}=    Decode Bytes To String    ${byte}    UTF-8
    #Log    ${str1}

Generate_Random
    ${ret}=    Generate Random String
    Log    ${ret}
    ${low}=    Generate Random String    20    [LOWER]
    Log    ${low}
    ${upper}=    Generate Random String    10    [UPPER]
    Log    ${upper}
    ${bin}=    Generate Random String    8    01
    log    ${bin}
    ${hex}=    Generate Random String    4    [NUMBERS]abcdef
    log    ${hex}

Get_Line_Count_Contain
    #${contain}=    Đỗ Thị Quang
    #${str}=    Get Line Count    ${contain}
    #log    ${str}
    ${result}=    adkdjakdakl
    ${lines}=    Get Lines Containing String    ${result}    An example
    ${ret}=    Get Lines Containing String    ${ret}    FAIL    case-insensitive
