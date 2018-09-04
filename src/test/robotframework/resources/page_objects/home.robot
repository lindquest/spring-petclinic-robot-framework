*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${WELCOME_URL}                  ${ADDRESS}
${WELCOME_HEADER}               tag:h2
${WELCOME_HEADER_TEXT}          Welcome

*** Keywords ***
Open Browser To PetClinic Welcome Page
    Open Browser To Page                ${WELCOME_URL}
    Wait Until Element Is Visible       ${WELCOME_HEADER}
    Element Text Should Be              ${WELCOME_HEADER}      ${WELCOME_HEADER_TEXT}
