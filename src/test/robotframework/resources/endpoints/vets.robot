*** Settings ***
Library                             Collections
Library                             RequestsLibrary
Library                             ../libraries/StringExtra.py

*** Variables ***
${VETS_ENDPOINT}                    vets
${VETS_ENDPOINT_ADDRESS}            ${ADDRESS}/${VETS_ENDPOINT}
${VETS_DATA_ROOT}                   vetList
${VETS_DATA_FIRST_NAME}             firstName
${VETS_DATA_LAST_NAME}              lastName
${VETS_DATA_NUMBER_SPECIALTIES}     nrOfSpecialties
${VETS_DATA_EMPTY_SPECIALTY}        none
${VETS_DATA_SPECIALTIES}            specialties
${VETS_DATA_SPECIALTY_NAME}         name

*** Keywords ***
Get Veterinarians Endpoint Information
    Create Session              ${VETS_ENDPOINT}            ${VETS_ENDPOINT_ADDRESS}
    ${Resp}=                    Get Request                 ${VETS_ENDPOINT}            /
    Should Be Equal As Strings  ${Resp.status_code}         200
    Log                         ${Resp.json()}
    &{Vets}=                    Get Veterinarians Information From Data     ${Resp.json()}
    [Return]                    ${Vets}

Get Veterinarians Information From Data
    [Arguments]     ${Data}
    @{Vets}=            Get From Dictionary     ${Data}     ${VETS_DATA_ROOT}
    @{Names}=           Create List
    @{Specialties}=     Create List
    :FOR    ${Vet}      IN      @{Vets}
    \       ${Name}=            Get Veterinarian's Name From Data           ${Vet}
    \       ${Specs}=           Get Veterinarian's Specialties From Data    ${Vet}
    \       Append To List      ${Names}                                    ${Name}
    \       Append To List      ${Specialties}                              ${Specs}
    &{Info}=            Create Dictionary   names=${Names}      specialties=${Specialties}
    [Return]    ${Info}

Get Veterinarian's Name From Data
    [Arguments]     ${Vet}
    ${First}=       Get From Dictionary     ${Vet}      ${VETS_DATA_FIRST_NAME}
    ${Last}=        Get From Dictionary     ${Vet}      ${VETS_DATA_LAST_NAME}
    ${Name}=        Catenate                ${First}    ${Last}
    [Return]    ${Name}

Get Veterinarian's Specialties From Data
    [Arguments]     ${Vet}
    ${Number Specs}=        Get From Dictionary         ${Vet}                          ${VETS_DATA_NUMBER_SPECIALTIES}
    Return From Keyword If  ${Number Specs} < 1         ${VETS_DATA_EMPTY_SPECIALTY}
    @{Specialities}=        Get From Dictionary         ${Vet}                          ${VETS_DATA_SPECIALTIES}
    @{Names}=               Create List
    :FOR    ${Speciality}   IN      @{Specialities}
    \       ${Name}=        Get From Dictionary         ${Speciality}                   ${VETS_DATA_SPECIALTY_NAME}
    \       Append To List  ${Names}                    ${Name}
    ${Names}=               Create String From List     ${Names}
    [Return]    ${Names}

Vets Information Should Match
    [Arguments]     ${Info1}    ${Info2}
    Dictionaries Should Be Equal    ${Info1}    ${Info2}
