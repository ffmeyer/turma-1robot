*** Settings ***

Library     RequestsLibrary
Library     Collections
Library     JSONLibrary
Library     ../../resources/lib/db.py 


*** Keywords ***

Get Token
    [Arguments]                         
    create session                      nplus                   http://ninjaplus-api:3000
    &{body}                             create dictionary       email=papito@ninjaplus.com      password=pwd123
    &{headers}=                         create dictionary       Content-type=application/json
    ${response}=                        post request            nplus       /auth      data=${body}      headers=${headers}
    ${token}=                           convert to string       JWT ${response.json()['token']}
    log                                 ${response.text}
    [return]                            ${token}

Get User
    [Arguments]                         ${user_id}
    ${token}=                           Get Token
    create session                      nplus                   http://ninjaplus-api:3000
    &{headers}=                         create dictionary       Content-type=application/json       Authorization=${TOKEN}
    ${response}=                        get request            nplus       /user/${user_id}            headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}

Post User
    [Arguments]                         ${body}
    create session                      nplus                   http://ninjaplus-api:3000
    &{headers}=                         create dictionary       Content-type=application/json
    ${response}=                        post request            nplus       /user       data=${body}        headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}

Post User Return Id
    [Arguments]                         ${body}
    create session                      nplus                   http://ninjaplus-api:3000
    &{headers}=                         create dictionary       Content-type=application/json
    ${response}=                        post request            nplus       /user       data=${body}        headers=${headers}
    log                                 ${response.text}
    ${user_id}                          convert to string       ${response.json()['id']}
    [return]                            ${user_id}

Delete User
    [Arguments]                         ${user_id}
    ${token}=                           Get Token
    create session                      nplus                   http://ninjaplus-api:3000
    &{headers}=                         create dictionary       Content-type=application/json       Authorization=${TOKEN}
    ${response}=                        delete request          nplus       /user/${user_id}            headers=${headers}
    log                                 ${response.text}
    [return]                            ${response}