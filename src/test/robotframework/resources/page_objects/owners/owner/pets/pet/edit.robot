*** Settings ***
Resource                            ../../../../../common/selenium.robot
Library                             String

*** Variables ***
${PET_NAME_FIELD}                   name
${PET_BIRTH_DATE_FIELD}             birthDate
${PET_TYPE_DROPDOWN}                type
${UPDATE_PET_BUTTON}                //button[text()="Update Pet"]

*** Keywords ***
Change Pet Name To "${Name}"
    Input Text  ${PET_NAME_FIELD}   ${Name}

Change Pet Birth Date To "${Date}"
    Input Text  ${PET_BIRTH_DATE_FIELD}     ${Date}

Change Pet Type To A ${Type}
    ${Type}=                 Convert To Lowercase    ${Type}
    Select From List By Value   ${PET_TYPE_DROPDOWN}    ${Type}

Click On Update Pet Button
    Click Element   ${UPDATE_PET_BUTTON}
