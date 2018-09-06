*** Settings ***
Resource                            ../../../common/selenium.robot

*** Variables ***
${OWNER_INFO_TABLE}                 //table[@class="table table-striped"][1]
${OWNER_INFO_TABLE_HEADER}          ${OWNER_INFO_TABLE}//th[text()="[HEADER]"]
${OWNER_INFO_TABLE_HEADER_ROW}      ${OWNER_INFO_TABLE_HEADER}/..
@{OWNER_INFO_TABLE_HEADERS}         Name    Address     City    Telephone

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
