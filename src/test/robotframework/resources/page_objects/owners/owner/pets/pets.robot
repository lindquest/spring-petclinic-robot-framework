*** Settings ***
Library                             String
Resource                            ../../../../common/selenium.robot

*** Variables ***
${PETS_HEADER_TEXT}             Pets and Visits
${PETS_TABLE}                   //h2[text()="${PETS_HEADER_TEXT}"]/following::table[contains(@class, "table-striped")]/tbody
${PETS_TABLE_ROW}               ${PETS_TABLE}/tr
${PETS_TABLE_ROW_EDIT_PET}      ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../../..//tbody//a[contains(text(), "Edit") and contains(text(), "Pet")]
${PETS_TABLE_ROW_ADD_VISIT}     ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../../..//tbody//a[contains(text(), "Add") and contains(text(), "Visit")]
${PET_VISIT_BY_NAME}            ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../../..//tbody//td[not(a)]/..
${PET_BY_NAME_BIRTH_TYPE}       ${PETS_TABLE_ROW}//dd[text()="[NAME]"]/../dd[text()="[BIRTH]"]/../dd[text()="[TYPE]"]

*** Keywords ***
Click On ${Name} Edit Button
    ${Locator}=     Replace String      ${PETS_TABLE_ROW_EDIT_PET}      [NAME]  ${Name}
    Click Element   ${Locator}

Click On ${Name} Add Visit Button
    ${Locator}=     Replace String      ${PETS_TABLE_ROW_ADD_VISIT}     [NAME]  ${Name}
    Click Element   ${Locator}

${Type} Named "${Name}" And Born In "${Date}" Should Be Visible
    ${Type}=                    Convert To Lowercase    ${Type}
    ${Typed}=                   Replace String          ${PET_BY_NAME_BIRTH_TYPE}   [TYPE]      ${Type}
    ${Named}=                   Replace String          ${Typed}                    [NAME]      ${Name} 
    ${Dated}=                   Replace String          ${Named}                    [BIRTH]     ${Date}
    Element Should Be Visible   ${Dated}

Pet Named "${Name}" Should Have A Visit On ${Date} For "${Description}"
    ${Row}=                     Replace String      ${PET_VISIT_BY_NAME}    [NAME]          ${Name}
    @{Visits}=                  Get WebElements     ${Row}
    @{Visits Text}=              Create List
    :FOR    ${Visit}    IN      @{Visits}
    \       ${Text}=        Get Text        ${Visit}
    \       Append To List  ${Visits Text}  ${Text}
    ${Visit}=                   Catenate            ${Date}                 ${Description}
    List Should Contain Value   ${Visits Text}      ${Visit}
