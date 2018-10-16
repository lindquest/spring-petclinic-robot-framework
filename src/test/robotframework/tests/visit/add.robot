*** Settings ***
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/pet/visits.robot
Test Setup      Go To Random Owner With A Pet

*** Keywords ***
Go To Random Owner With A Pet
    Go To PetClinic Find Owners Page
    Wait Until Keyword Succeeds         1 min    1 sec  Pick Owner With A Pet

Pick Owner With A Pet
    Search By Owner's Last Name         ${EMPTY}
    Open Random Owner Information
    Owner Should Have Pets

*** Test Cases ***
Add A Visit
    Click On A Random Pet Add Visit Button
    ${Pet Name}=                                Get Pet Name
    Set Visit Date To "2018-10-15"
    Set Visit Description To "Tooth removal"
    Click On Add Visit Button
    Pet Named "${Pet Name}" Should Have A Visit On 2018-10-15 For "Tooth removal"
