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
${ERROR_INDICATOR}      //span[contains(@class, "glyphicon-remove")]
${HELP_INLINE}          //input[@id="[ID]"]/../../span[@class="help-inline"]

*** Keywords ***
Open Browser To Page
    [Arguments]     ${URL}
    Open Browser        ${URL}      ${BROWSER}
    Title Should Be     ${TITLE}
    Location Should Be  ${URL}

Go To Page
    [Arguments]     ${URL}    ${Text}   ${Header}=${DEFAULT_HEADER}
    Go To                               ${URL}
    Wait Until Element Is Visible       ${Header}
    Element Text Should Be              ${Header}      ${Text}

Table Should Contain Expected Headers
    [Arguments]     ${Locator}  ${Headers}
    :FOR    ${Element}  IN  @{Headers}
    \       Table Header Should Contain     ${Locator}   ${Element}

Form Should Contain An Error
    Element Should Be Visible   ${ERROR_INDICATOR}

${ID} Content Should Be Invalid
    ${Locator}=         Convert To Camel Case    ${ID}
    ${Valid}=           Execute Javascript  return window.document.getElementById('${Locator}').checkValidity();
    Should Not Be True  ${Valid}

${Field} Error Message Should Contain "${Message}"
    ${ID}=                  Convert To Camel Case   ${Field}
    ${Locator}=             Replace String  ${HELP_INLINE}  [ID]    ${ID}
    Element Should Contain  ${Locator}  ${Message}
