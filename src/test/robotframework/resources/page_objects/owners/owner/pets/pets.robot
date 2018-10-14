*** Settings ***
Library                             String
Library                             ../../../../libraries/Random.py
Resource                            ../../../../common/selenium.robot

*** Variables ***
${PETS_HEADER_TEXT}         Pets and Visits
${PETS_TABLE}               //h2[text()="${PETS_HEADER_TEXT}"]/following::table[contains(@class, "table-striped")]/tbody
${PETS_TABLE_ROW}           ${PETS_TABLE}/tr
${PETS_TABLE_ROW_EDIT_PET}  ${PETS_TABLE_ROW}//a[contains(text(), "Edit") and contains(text(), "Pet")]
${PET_BY_NAME_BIRTH_TYPE}   ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../dd[text()="[BIRTH]"]/../dd[text()="[TYPE]"]

*** Keywords ***
Owner Should Have Pets
    ${Count}=       Get Element Count   ${PETS_TABLE_ROW}
    Should Be True  ${Count} > 0        Owner has not pets.

Get All Pets' Edit Button
    @{Pets Edit}=   Get WebElements     ${PETS_TABLE_ROW_EDIT_PET}
    [Return]    @{Pets Edit}

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
