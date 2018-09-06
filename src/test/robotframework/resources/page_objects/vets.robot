*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${VETS_URL}                     ${ADDRESS}/vets.html
${VETS_HEADER}                  tag:h2
${VETS_HEADER_TEXT}             Veterinarians
${VETS_TABLE}                   vets
@{VETS_TABLE_HEADERS}           Name    Specialties

*** Keywords ***
Go To PetClinic Veterinarians Page
    Go To Page  ${VETS_URL}     ${VETS_HEADER_TEXT}     ${VETS_HEADER}

Veterinarians Page Should Contain Vets Table
    Element Should Be Visible               ${VETS_TABLE}
    Table Should Contain Expected Headers   ${VETS_TABLE}   ${VETS_TABLE_HEADERS}
