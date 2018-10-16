*** Settings ***
Library                             String
Library                             ../../../../libraries/Random.py
Resource                            ../../../../common/selenium.robot

*** Variables ***
${PETS_HEADER_TEXT}             Pets and Visits
${PETS_TABLE}                   //h2[text()="${PETS_HEADER_TEXT}"]/following::table[contains(@class, "table-striped")]/tbody
${PETS_TABLE_ROW}               ${PETS_TABLE}/tr
${PETS_TABLE_ROW_NAME}          ${PETS_TABLE_ROW}//dd[1]
${PETS_TABLE_ROW_EDIT_PET}      ${PETS_TABLE_ROW}//a[contains(text(), "Edit") and contains(text(), "Pet")]
${PETS_TABLE_ROW_ADD_VISIT}     ${PETS_TABLE_ROW}//a[contains(text(), "Add") and contains(text(), "Visit")]
${PET_VISIT_BY_NAME}            ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../../..//tbody//td[not(a)]/..
${PET_BY_NAME_BIRTH_TYPE}       ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../dd[text()="[BIRTH]"]/../dd[text()="[TYPE]"]

*** Keywords ***
Owner Should Have Pets
    ${Count}=       Get Element Count   ${PETS_TABLE_ROW}
    Should Be True  ${Count} > 0        Owner has not pets.

Get All Pets' Names
    @{Pets}=    Get WebElements     ${PETS_TABLE_ROW_NAME}
    @{Names}=   Create List
    :FOR    ${Name}  IN  @{Pets}
    \       ${Name}=        Get Text    ${Name}
    \       Append To List  ${Names}    ${Name}
    [Return]    @{Names}
 
Get All Pets' Edit Button
    @{Pets Edit}=   Get WebElements     ${PETS_TABLE_ROW_EDIT_PET}
    [Return]    @{Pets Edit}

Get All Pets' Add Visit Button
    @{Pets Visit}=   Get WebElements     ${PETS_TABLE_ROW_ADD_VISIT}
    [Return]    @{Pets Visit}

Click On A Random Pet Add Visit Button
    @{Visits}=      Get All Pets' Add Visit Button
    ${Random}=      Pick Random Element         ${Visits}
    Click Element   ${Random}

Click On A Random Pet Edit Button
    @{Pets}=        Get All Pets' Edit Button
    ${Random}=      Pick Random Element         ${Pets}
    Click Element   ${Random}

${Type} Named "${Name}" And Born In "${Date}" Should Be Visible
    ${Type}=                    Convert To Lowercase    ${Type}
    ${Typed}=                   Replace String          ${PET_BY_NAME_BIRTH_TYPE}   [TYPE]      ${Type}
    ${Named}=                   Replace String          ${Typed}                    [NAME]      ${Name} 
    ${Dated}=                   Replace String          ${Named}                    [BIRTH]     ${Date}
    Element Should Be Visible   ${Dated}

Get Random Pet Name
    @{Names}=   Get All Pets' Names
    ${Random}=  Pick Random Element     ${Names}
    [Return]    ${Random}

Pet Named "${Name}" Should Have A Visit On ${Date} For "${Description}"
    ${Row}=                     Replace String      ${PET_VISIT_BY_NAME}    [NAME]          ${Name}
    @{Visits}=                  Get WebElements     ${Row}
    @{Visits Text}=              Create List
    :FOR    ${Visit}    IN      @{Visits}
    \       ${Text}=        Get Text        ${Visit}
    \       Append To List  ${Visits Text}  ${Text}
    ${Visit}=                   Catenate            ${Date}                 ${Description}
    List Should Contain Value   ${Visits Text}      ${Visit}
