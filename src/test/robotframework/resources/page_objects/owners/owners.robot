*** Settings ***
Library                             String
Library                             Collections
Resource                            ../../common/selenium.robot

*** Variables ***
${OWNERS_URL}                  ${ADDRESS}/owners?lastName=[QUERY]
${OWNERS_HEADER}               tag:h2
${OWNERS_HEADER_TEXT}          Owners
${OWNERS_TABLE}                vets
@{OWNERS_TABLE_HEADERS}        Name     Address     City    Telephone   Pets
${OWNERS_TABLE_OWNER_NAME}     //td/a[contains(@href, "/owners/")]

*** Keywords ***
URL Should Contain Query
    [Arguments]     ${Query}
    ${URL}=                 Replace String  ${OWNERS_URL}   [QUERY]     ${Query}
    Location Should Be      ${URL}

Results Should Be Visible
    Wait Until Element Is Visible           ${OWNERS_HEADER}
    Element Text Should Be                  ${OWNERS_HEADER}      ${OWNERS_HEADER_TEXT}
    Wait Until Element Is Visible           ${OWNERS_TABLE}
    Table Should Contain Expected Headers   ${OWNERS_TABLE}       ${OWNERS_TABLE_HEADERS}

Page Should Contain Multiple Results
    [Arguments]     ${Query}
    URL Should Contain Query        ${Query}
    Results Should Be Visible

Get Visible Last Names
    @{Owners}=                      Get WebElements         ${OWNERS_TABLE_OWNER_NAME}
    @{Last Names}=                  Create List
    :FOR    ${Owner}    IN  @{Owners}
    \       ${Full Name}=               Get Text                ${Owner}
    \       ${First}    ${Last}=        Split String            ${Full Name}                ${SPACE}    1
    \       Append To List              ${Last Names}           ${Last}
    [Return]    @{Last Names}

Page Should Contain Only Relevant Names
    [Arguments]     ${Query}
    @{Last Names}=      Get Visible Last Names
    :FOR    ${Name}     IN  @{Last Names}
    \       Should Be Equal As Strings  ${Query}    ${Name}

