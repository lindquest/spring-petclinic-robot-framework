*** Settings ***
Library                             ../../libraries/StringExtra.py
Resource                            ../../common/selenium.robot

*** Variables ***
${ADD_OWNER_URL}            ${ADDRESS}/owners/new
${ADD_OWNER_HEADER}         tag:h2
${ADD_OWNER_HEADER_TEXT}    Owner
${ADD_OWNER_BUTTON}         //button[text()="Add Owner"]
${HELP_INLINE}              //input[@id="[ID]"]/../../span[@class="help-inline"]
@{ADD_OWNER_FIELDS}         First Name      Last Name   Address     City    Telephone
&{ADD_OWNER_VALUES}         
...                         firstName=John    
...                         lastName=Noluck 
...                         address=11 Marina Rd.   
...                         city=Madison     
...                         telephone=1122334455
${ERROR_INDICATOR}          //span[contains(@class, "glyphicon-remove")]
${DEFAULT_ERROR}            must not be empty

*** Keywords ***
Go To PetClinic Add Owner Page
    Go To Page  ${ADD_OWNER_URL}  ${ADD_OWNER_HEADER_TEXT}  ${ADD_OWNER_HEADER}

Set Owner's ${Attribute} To "${Value}"
    ${Element}=             Convert To Camel Case   ${Attribute}
    Input Text              ${Element}              ${Value}

Click On Add Owner button
    Click Element           ${ADD_OWNER_BUTTON}

${Field} Error Message Should Contain "${Message}"
    ${ID}=                  Convert To Camel Case   ${Field}
    ${Locator}=             Replace String  ${HELP_INLINE}  [ID]    ${ID}
    Element Should Contain  ${Locator}  ${Message}

Form Should Contain An Error
    Element Should Be Visible   ${ERROR_INDICATOR}

Try To Add Owner With Missing Information
    [Arguments]     ${Attribute}
    :FOR    ${Field}    IN  @{ADD_OWNER_FIELDS}
    \       ${Key}=     Convert To Camel Case   ${Field}
    \       Run Keyword If  "${Field}" != "${Attribute}"    Set Owner's ${Field} To "&{ADD_OWNER_VALUES}[${Key}]"
    Click On Add Owner button
    Form Should Contain An Error
    ${Attribute} Error Message Should Contain "${DEFAULT_ERROR}"
