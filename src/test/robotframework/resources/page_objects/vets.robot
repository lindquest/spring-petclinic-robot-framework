*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${VETS_URL}                     ${ADDRESS}/vets.html
${VETS_HEADER}                  tag:h2
${VETS_HEADER_TEXT}             Veterinarians
${VETS_TABLE}                   vets
@{VETS_TABLE_HEADERS}           Name    Specialties
${VETS_TABLE_ROW}               //table[@id="vets"]/tbody/tr
${VETS_TABLE_ROW_NAME}          ${VETS_TABLE_ROW}/td[1]
${VETS_TABLE_ROW_SPECIALTIES}   ${VETS_TABLE_ROW}/td[2]

*** Keywords ***
Go To PetClinic Veterinarians Page
    Go To Page  ${VETS_URL}     ${VETS_HEADER_TEXT}     ${VETS_HEADER}

Veterinarians Page Should Contain Vets Table
    Element Should Be Visible               ${VETS_TABLE}
    Table Should Contain Expected Headers   ${VETS_TABLE}   ${VETS_TABLE_HEADERS}

Get Veterinarians Page Table Information
    @{Names}=           Get Veterinarians Names
    @{Specialties}=     Get Veterinarians Specialties
    &{Info}=            Create Dictionary                   names=${Names}      specialties=${Specialties}
    [Return]    ${Info}

Get Veterinarians Names
    @{Name Rows}=                   Get WebElements     ${VETS_TABLE_ROW_NAME}
    @{Names}=                       Create List
    :FOR    ${Row}     IN      @{Name Rows}
    \       ${Name}=        Get Text    ${Row}
    \       Append To List  ${Names}    ${Name}
    [Return]    ${Names}

Get Veterinarians Specialties
    @{Specialties Rows}=                   Get WebElements     ${VETS_TABLE_ROW_SPECIALTIES}
    @{Specialties}=                        Create List
    :FOR    ${Row}     IN      @{Specialties Rows}
    \       ${Specialty}=   Get Text        ${Row}
    \       Append To List  ${Specialties}  ${Specialty}
    [Return]    ${Specialties}
