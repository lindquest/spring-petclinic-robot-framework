*** Settings ***
Resource                            ../../../../../common/selenium.robot
Library                             String

*** Variables ***
${VISIT_DATE_FIELD}                 date
${VISIT_DESCRIPTION_FIELD}          description
${ADD_VISIT_BUTTON}                 //button[text()="Add Visit"]
${PET_TABLE}                        //table//th[text()="Name"]/../../..
${PET_TABLE_NAME}                   ${PET_TABLE}//td[1]

*** Keywords ***
Click On Add Visit Button
    Click Element   ${ADD_VISIT_BUTTON}

Set Visit Date To "${Date}"
    Input Text  ${VISIT_DATE_FIELD}     ${Date}

Set Visit Description To "${Description}"
    Input Text  ${VISIT_DESCRIPTION_FIELD}  ${Description}

Get Pet Name
    ${Name}=    Get Text    ${PET_TABLE_NAME}
    [Return]    ${Name}
