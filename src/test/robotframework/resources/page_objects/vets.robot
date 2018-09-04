*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${VETS_URL}                     ${ADDRESS}/vets.html
${VETS_HEADER}                  tag:h2
${VETS_HEADER_TEXT}             Veterinarians
${VETS_TABLE}                   vets
@{VETS_TABLE_HEADERS}           Name    Specialties

*** Keywords ***
Open Browser To PetClinic Veterinarians Page
    Open Browser To Page            ${VETS_URL}
    Wait Until Element Is Visible   ${VETS_HEADER}
    Element Text Should Be          ${VETS_HEADER}      ${VETS_HEADER_TEXT}

Veterinarians Page Should Contain Vets Table
    Element Should Be Visible               ${VETS_TABLE}
    Table Should Contain Expected Headers   ${VETS_TABLE}   ${VETS_TABLE_HEADERS}