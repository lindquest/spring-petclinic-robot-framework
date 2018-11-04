*** Settings ***
Resource                            ../../common/selenium.robot
Resource                            owners.robot

*** Variables ***
${FIND_OWNERS_URL}                  ${ADDRESS}/owners/find
${FIND_OWNERS_HEADER}               tag:h2
${FIND_OWNERS_HEADER_TEXT}          Find Owners
${FIND_OWNERS_LAST_NAME_INPUT}      lastName
${FIND_OWNERS_SUBMIT}               //button[@type="submit"]

*** Keywords ***
Go To PetClinic Find Owners Page
    Go To Page  ${FIND_OWNERS_URL}  ${FIND_OWNERS_HEADER_TEXT}  ${FIND_OWNERS_HEADER}

Search By Owner's Last Name
    [Arguments]     ${Last Name}
    Element Should Be Visible           ${FIND_OWNERS_LAST_NAME_INPUT}
    Input Text                          ${FIND_OWNERS_LAST_NAME_INPUT}  ${Last Name}
    Click Button                        ${FIND_OWNERS_SUBMIT}
