*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/new.robot
Test Setup      Go To Random Owner Information Page

*** Test Cases ***
Add New Pet
    Click On Add New Pet
    Set Pet Name To "Peter Fly"
    Set Pet Birth Date To "2016-06-10"
    Set Pet Type To A Bird
    Click On Add Pet Button
    Bird Named "Peter Fly" And Born In "2016-06-10" Should Be Visible

Add Pet With No Name
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    [Tags]              bugs
    Click On Add New Pet
    Set Pet Birth Date To "2017-10-10"
    Set Pet Type To A Cat
    Click On Add Pet Button
    Form Should Contain An Error
    Name Error Message Should Contain "is required"

Add Pet With Missing Birth Date
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    [Tags]              bugs
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
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    [Tags]              bugs
    [Setup]     Go To Random Owner With A Pet
    ${Name}=                Get Random Pet Name
    Click On Add New Pet
    Set Pet Name To "${Name}"
    Set Pet Birth Date To "2017-10-10"
    Set Pet Type To A Lizard
    Click On Add Pet Button
    Form Should Contain An Error
    Name Error Message Should Contain "is already in use"
