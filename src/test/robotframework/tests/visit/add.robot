*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/pet/visits.robot
Test Setup      Add New Owner Named "Catherine Random" And Add New Cat Named "${PET}"

*** Variables ***
${PET}          Gump

*** Test Cases ***
Add A Visit
    Click On ${PET} Add Visit Button
    Set Visit Date To "2018-10-15"
    Set Visit Description To "Tooth removal"
    Click On Add Visit Button
    Pet Named "${PET}" Should Have A Visit On 2018-10-15 For "Tooth removal"

Add Visit With Missing Description
    Click On ${PET} Add Visit Button
    Click On Add Visit Button
    Description Error Message Should Contain "must not be empty"

Add Visit With Empty Date
    [Documentation]     Original spring-petclinic allows empty date
    Click On ${PET} Add Visit Button
    Set Visit Date To ""
    Set Visit Description To "Vaccination"
    Click On Add Visit Button
    Date Error Message Should Contain "must not be null"
