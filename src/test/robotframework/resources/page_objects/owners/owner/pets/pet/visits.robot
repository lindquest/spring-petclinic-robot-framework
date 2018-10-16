*** Settings ***
Resource                            ../../../../../common/selenium.robot
Library                             String

*** Variables ***
${VISIT_DATE_FIELD}                 date
${VISIT_DESCRIPTION_FIELD}          description
${ADD_VISIT_BUTTON}                 //button[text()="Add Visit"]
${PET_TABLE}                        //table//th[text()="Name"]/../../..
${PET_TABLE_NAME}                   ${PET_TABLE}//td[1]
${ERROR_INDICATOR}                  //span[contains(@class, "glyphicon-remove")]
${HELP_INLINE}                      //input[@id="[ID]"]/../../span[@class="help-inline"]

*** Keywords ***
Click On Add Visit Button
    Click Element   ${ADD_VISIT_BUTTON}

Set Visit Date To "${Date}"
    Input Text  ${VISIT_DATE_FIELD}     ${Date}

Set Visit Description To "${Description}"
    Input Text  ${VISIT_DESCRIPTION_FIELD}  ${Description}

Form Should Contain An Error
    Element Should Be Visible   ${ERROR_INDICATOR}

Get Pet Name
    ${Name}=    Get Text    ${PET_TABLE_NAME}
    [Return]    ${Name}

${Field} Error Message Should Contain "${Message}"
    ${ID}=                  Convert To Camel Case   ${Field}
    ${Locator}=             Replace String  ${HELP_INLINE}  [ID]    ${ID}
    Element Should Contain  ${Locator}  ${Message}
