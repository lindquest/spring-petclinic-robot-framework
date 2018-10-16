*** Settings ***
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/new.robot
Test Setup      Go To Random Owner Information Page

*** Keywords ***
Go To Random Owner Information Page
    Go To PetClinic Find Owners Page
    Search By Owner's Last Name         ${EMPTY}
    Open Random Owner Information

Go To Random Owner With A Pet
    Go To PetClinic Find Owners Page
    Wait Until Keyword Succeeds         1 min    1 sec  Pick Owner With A Pet

Pick Owner With A Pet
    Search By Owner's Last Name         ${EMPTY}
    Open Random Owner Information
    Owner Should Have Pets

*** Test Cases ***
Add New Pet
    Click On Add New Pet
    Set Pet Name To "Peter Fly"
    Set Pet Birth Date To "2016-06-10"
    Set Pet Type To A Bird
    Click On Add Pet Button
    Bird Named "Peter Fly" And Born In "2016-06-10" Should Be Visible

Add Pet With No Name
    Click On Add New Pet
    Set Pet Birth Date To "2017-10-10"
    Set Pet Type To A Cat
    Click On Add Pet Button
    Form Should Contain An Error
    Name Error Message Should Contain "is required"

Add Pet With Missing Birth Date
    Click On Add New Pet
    Set Pet Name To "Andy"
    Set Pet Type To A Snake
    Click On Add Pet Button
    Form Should Contain An Error
    Birth Date Error Message Should Contain "is required"

Add Pet With Invalid Birth Date
    Click On Add New Pet
    Set Pet Name To "Andy"
    Set Pet Birth Date To "2017-10-1"
    Set Pet Type To A Snake
    Click On Add Pet Button
    Birth Date Content Should Be Invalid

Add Duplicated Pet
    [Setup]     Go To Random Owner With A Pet
    ${Name}=                Get Random Pet Name
    Click On Add New Pet
    Set Pet Name To "${Name}"
    Set Pet Birth Date To "2017-10-10"
    Set Pet Type To A Lizard
    Click On Add Pet Button
    Form Should Contain An Error
    Name Error Message Should Contain "is already in use"
