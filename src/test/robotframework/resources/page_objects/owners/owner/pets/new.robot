*** Settings ***
Library                             ../../../../libraries/StringExtra.py
Resource                            pet/edit.robot

*** Variables ***
${NEW_PET_URL}                      ${ADDRESS}/owners/[ID]/pets/new
${ADD_PET_BUTTON}                   //button[text()="Add Pet"]
${ERROR_INDICATOR}                  //span[contains(@class, "glyphicon-remove")]
${HELP_INLINE}                      //input[@id="[ID]"]/../../span[@class="help-inline"]


*** Keywords ***
Click On Add Pet Button
    Click Element   ${ADD_PET_BUTTON}

Form Should Contain An Error
    Element Should Be Visible   ${ERROR_INDICATOR}

${Field} Error Message Should Contain "${Message}"
    ${ID}=                  Convert To Camel Case   ${Field}
    ${Locator}=             Replace String  ${HELP_INLINE}  [ID]    ${ID}
    Element Should Contain  ${Locator}  ${Message}
