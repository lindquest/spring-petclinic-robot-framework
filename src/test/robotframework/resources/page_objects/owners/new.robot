*** Settings ***
Library                             ../../libraries/StringExtra.py
Resource                            ../../common/selenium.robot

*** Variables ***
${ADD_OWNER_URL}            ${ADDRESS}/owners/new
${ADD_OWNER_HEADER}         tag:h2
${ADD_OWNER_HEADER_TEXT}    Owner
${ADD_OWNER_BUTTON}         //button[text()="Add Owner"]
@{ADD_OWNER_FIELDS}         First Name      Last Name   Address     City    Telephone
&{ADD_OWNER_VALUES}         
...                         firstName=John    
...                         lastName=Noluck 
...                         address=11 Marina Rd.   
...                         city=Madison     
...                         telephone=1122334455
${DEFAULT_ERROR}            must not be empty

*** Keywords ***
Go To PetClinic Add Owner Page
    Go To Page  ${ADD_OWNER_URL}  ${ADD_OWNER_HEADER_TEXT}  ${ADD_OWNER_HEADER}

Set Owner's ${Attribute} To "${Value}"
    ${Element}=             Convert To Camel Case   ${Attribute}
    Input Text              ${Element}              ${Value}

Click On Add Owner button
    Click Element           ${ADD_OWNER_BUTTON}

Add A New Owner
    [Arguments]     ${First Name}   ${Last Name}    ${Address}  ${City}     ${Telephone}
    Go To PetClinic Add Owner Page
    Set Owner's First Name To "${First Name}"
    Set Owner's Last Name To "${Last Name}"
    Set Owner's Address To "${Address}"
    Set Owner's City To "${City}"
    Set Owner's Telephone To "${Telephone}"
    Click On Add Owner button    

Add A New Owner And Verify
    [Arguments]     ${First Name}   ${Last Name}    ${Address}  ${City}     ${Telephone}
    Add A New Owner                 ${First Name}   ${Last Name}    ${Address}  ${City}     ${Telephone}
    Owner Information Should Be     ${First Name}   ${Last Name}    ${Address}  ${City}     ${Telephone}

Try To Add Owner With Missing Information
    [Arguments]     ${Attribute}
    :FOR    ${Field}    IN  @{ADD_OWNER_FIELDS}
    \       ${Key}=     Convert To Camel Case   ${Field}
    \       Run Keyword If  "${Field}" != "${Attribute}"    Set Owner's ${Field} To "&{ADD_OWNER_VALUES}[${Key}]"
    Click On Add Owner button
    Form Should Contain An Error
    ${Attribute} Error Message Should Contain "${DEFAULT_ERROR}"
