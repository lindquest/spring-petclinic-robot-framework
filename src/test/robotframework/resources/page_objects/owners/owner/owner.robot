*** Settings ***
Library                             String
Resource                            ../../../common/selenium.robot
Resource                            edit.robot

*** Variables ***
${OWNER_INFO_TABLE}                 //table[@class="table table-striped"][1]
${OWNER_INFO_TABLE_HEADER}          ${OWNER_INFO_TABLE}//th[text()="[HEADER]"]
${OWNER_INFO_TABLE_HEADER_ROW}      ${OWNER_INFO_TABLE_HEADER}/../td
@{OWNER_INFO_TABLE_HEADERS}         Name    Address     City    Telephone
${EDIT_OWNER_BUTTON}                //a[text()="Edit\n${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}${SPACE}Owner"]

*** Keywords ***
Page Should Contain Owner Information Section
    Wait Until Element Is Visible   ${OWNER_INFO_TABLE}
    :FOR    ${Header}   IN  @{OWNER_INFO_TABLE_HEADERS}
    \       ${Header}=  Replace String  ${OWNER_INFO_TABLE_HEADER}  [HEADER]    ${Header}
    \       Element Should Be Visible   ${Header}

Owner's Last Name Should Match Query
    [Arguments]     ${Query}
    ${Row}=                   Replace String    ${OWNER_INFO_TABLE_HEADER_ROW}  [HEADER]    Name
    Element Should Contain    ${Row}            ${Query}

Get Owner's Unique ID
    ${URL}=     Get Location
    ${ID}=      Fetch From Right    ${URL}      /
    [Return]    ${ID}

Click On Edit Owner
    ${ID}=                  Get Owner's Unique ID
    Click Element           ${EDIT_OWNER_BUTTON}
    ${URL}=                 Replace String          ${EDIT_OWNER_URL}   [ID]    ${ID}
    Location Should Be      ${URL}

Owner's ${Attribute} Should Be "${Value}"
    ${Row}=                   Replace String    ${OWNER_INFO_TABLE_HEADER_ROW}  [HEADER]    ${Attribute}
    Element Text Should Be    ${Row}            ${Value}