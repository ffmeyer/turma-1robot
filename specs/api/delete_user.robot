*** Settings ***
Resource        ./base_api.robot

*** Variables ***
${email}   papito@yahoo.com


*** Test Cases ***
Test: Unique Id
    remove user by email    ${email}
    &{user}=                create dictionary       full_name=papito        email=${email}       password=vaiplaneta
    ${user_id}=             post user return id     ${user}
    ${response}             delete user             ${user_id}
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 204
    

Test: User not found
    ${user_id}              convert to string       9999
    ${response}             delete user             ${user_id}    
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 404