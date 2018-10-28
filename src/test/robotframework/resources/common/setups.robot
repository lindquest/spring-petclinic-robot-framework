*** Settings ***
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/pet/visits.robot

*** Keywords ***
Go To Random Owner Information Page
    Go To PetClinic Find Owners Page
    Search By Owner's Last Name         ${EMPTY}
    Open Random Owner Information

Go To Random Owner With A Pet
    Wait Until Keyword Succeeds         15 sec    1 sec  Pick Owner With A Pet

Pick Owner With A Pet
    Go To Random Owner Information Page
    Owner Should Have Pets

Go To Random Owner Edit Page
    Go To Random Owner Information Page
    Click On Edit Owner
