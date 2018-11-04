*** Settings ***
Library                             String
Resource                            ../../../common/selenium.robot
Resource                            edit.robot
Resource                            pets/new.robot

*** Variables ***
${OWNER_INFO_TABLE}                 //table[@class="table table-striped"][1]
${OWNER_INFO_TABLE_HEADER}          ${OWNER_INFO_TABLE}//th[text()="[HEADER]"]
${OWNER_INFO_TABLE_HEADER_ROW}      ${OWNER_INFO_TABLE_HEADER}/../td
@{OWNER_INFO_TABLE_HEADERS}         Name    Address     City    Telephone
${EDIT_OWNER_BUTTON}                //a[contains(text(), "Edit") and contains(text(), "Owner")]
${ADD_NEW_PET_BUTTON}               //a[contains(text(), "Add") and contains(text(), "New Pet")]

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

Click On Add New Pet
    ${ID}=                  Get Owner's Unique ID
    Click Element           ${ADD_NEW_PET_BUTTON}
    ${URL}=                 Replace String          ${NEW_PET_URL}   [ID]    ${ID}
    Location Should Be      ${URL}

Owner's ${Attribute} Should Be "${Value}"
    ${Row}=                   Replace String    ${OWNER_INFO_TABLE_HEADER_ROW}  [HEADER]    ${Attribute}
    Element Text Should Be    ${Row}            ${Value}

Owner Information Should Be
    [Arguments]     ${First Name}   ${Last Name}    ${Address}  ${City}     ${Telephone}
    Page Should Contain Owner Information Section
    Owner's Name Should Be "${First Name} ${Last Name}"
    Owner's Address Should Be "${Address}"
    Owner's City Should Be "${City}"
    Owner's Telephone Should Be "${Telephone}"
