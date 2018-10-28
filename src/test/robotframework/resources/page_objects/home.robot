*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${WELCOME_URL}                  ${ADDRESS}
${WELCOME_HEADER}               tag:h2
${WELCOME_HEADER_TEXT}          Welcome

*** Keywords ***
Go To PetClinic Welcome Page
    Go To Page      ${WELCOME_URL}      ${WELCOME_HEADER_TEXT}     ${WELCOME_HEADER}
