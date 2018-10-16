*** Settings ***
Library         SeleniumLibrary
Library         ../libraries/StringExtra.py

*** Variables ***
${BROWSER}              Chrome
${DELAY}                0
${TIMEOUT}              7
${ADDRESS}              http://localhost:8080
${TITLE}                PetClinic :: a Spring Framework demonstration
${DEFAULT_HEADER}       tag:h2

*** Keywords ***
Open Browser To Page
    [Arguments]     ${URL}
    Open Browser        ${URL}      ${BROWSER}
    Title Should Be     ${TITLE}

Go To Page
    [Arguments]     ${URL}    ${Text}   ${Header}=${DEFAULT_HEADER}
    Go To                               ${URL}
    Wait Until Element Is Visible       ${Header}
    Element Text Should Be              ${Header}      ${Text}

Table Should Contain Expected Headers
    [Arguments]     ${Locator}  ${Headers}
    :FOR    ${Element}  IN  @{Headers}
    \       Table Header Should Contain     ${Locator}   ${Element}

${ID} Content Should Be Invalid
    ${Locator}=         Convert To Camel Case    ${ID}
    ${Valid}=           Execute Javascript  return window.document.getElementById('${Locator}').checkValidity();
    Should Not Be True	${Valid}