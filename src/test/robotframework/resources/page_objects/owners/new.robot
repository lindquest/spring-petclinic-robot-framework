*** Settings ***
Library                             ../../libraries/StringExtra.py
Resource                            ../../common/selenium.robot

*** Variables ***
${ADD_OWNER_URL}            ${ADDRESS}/owners/new
${ADD_OWNER_HEADER}         tag:h2
${ADD_OWNER_HEADER_TEXT}    Owner
${ADD_OWNER_BUTTON}         //button[text()="Add Owner"]
${HELP_INLINE}              //input[@id="[ID]"]/../../span[@class="help-inline"]

*** Keywords ***
Go To PetClinic Add Owner Page
    Go To Page  ${ADD_OWNER_URL}  ${ADD_OWNER_HEADER_TEXT}  ${ADD_OWNER_HEADER}

Set Owner's ${Attribute} To "${Value}"
    ${Element}=             Convert To Camel Case   ${Attribute}
    Input Text              ${Element}              ${Value}

Click On Add Owner button
    Click Element           ${ADD_OWNER_BUTTON}

${Field} Error Message Should Be "${Message}"
    ${ID}=                  Convert To Camel Case   ${Field}
    ${Locator}=             Replace String  ${HELP_INLINE}  [ID]    ${ID}
    Element Should Contain  ${Locator}  ${Message}
