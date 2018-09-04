*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${BROWSER}      Chrome
${DELAY}        0
${TIMEOUT}      7
${ADDRESS}      http://localhost:8080
${TITLE}        PetClinic :: a Spring Framework demonstration

*** Keywords ***
Open Browser To Page
    [Arguments]         ${URL}
    Open Browser        ${URL}      ${BROWSER}
    Title Should Be     ${TITLE}

Table Should Contain Expected Headers
    [Arguments]         ${Locator}  ${Headers}
    :FOR    ${Element}  IN  @{Headers}
    \       Table Header Should Contain     ${Locator}   ${Element}