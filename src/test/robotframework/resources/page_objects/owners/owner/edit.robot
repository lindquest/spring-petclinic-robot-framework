*** Settings ***
Library                             ../../../libraries/StringExtra.py
Resource                            ../../../common/selenium.robot

*** Variables ***
${EDIT_OWNER_URL}           ${ADDRESS}/owners/[ID]/edit
${UPDATE_OWNER_BUTTON}      //button[text()="Update Owner"]

*** Keywords ***
Change Owner's ${Attribute} To "${Value}"
    ${Element}=             Convert To Camel Case   ${Attribute}
    Input Text              ${Element}              ${Value}

Click On Update Owner Button
    Click Element   ${UPDATE_OWNER_BUTTON}
