*** Settings ***
Library     OperatingSystem
Resource        ./base_api.robot


*** Variables ***
${email}    bruce@wayne.com


*** Test Cases ***
Create a new user
    remove user by email    ${email}
    #&{body}=                create dictionary       full_name=Bruce Wayne   email=${email}     password=pwd123
    ${body}=                get file                ${EXEC_DIR}/resources/json/post_200.json
    ${response}=            Post User               ${body}
    ${code}=                convert to string       ${response.status_code}
    should be equal         ${code}                 200

Email required 
    &{body}=                            create dictionary       full_name=Bruce Wayne   email=${EMPTY}     password=pwd123
    ${response}=                        Post User               ${body}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on email failed

Password required
    &{body}=                            create dictionary       full_name=Bruce Wayne   email=${email}     password=${EMPTY}
    ${response}=                        Post User               ${body}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on password failed

Name required   
    &{body}=                            create dictionary       full_name=${EMPTY}   email=${email}     password=pwd123
    ${response}=                        Post User               ${body}
    ${code}=                            convert to string       ${response.status_code}
    should be equal                     ${code}                 412
    dictionary should contain value     ${response.json()}      Validation notEmpty on full_name failed
