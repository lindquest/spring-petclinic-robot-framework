*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/new.robot
Test Setup      Add New Owner Named "Kate Random" And Click On Add New Pet

*** Test Cases ***
Add New Pet
    [Template]  Add New Pet And Verify
    Peter Fly   2016-06-10  Bird

Add Pet With No Name
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    Add New Pet
    ...     ${EMPTY}
    ...     2017-10-10
    ...     Cat
    Form Should Contain An Error
    Name Error Message Should Contain "is required"

Add Pet With Missing Birth Date
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    Add New Pet
    ...     Andy
    ...     ${EMPTY}
    ...     Snake
    Set Pet Name To "Andy"
    Set Pet Type To A Snake
    Click On Add Pet Button
    Form Should Contain An Error
    Birth Date Error Message Should Contain "is required"

Add Pet With Invalid Birth Date
    Add New Pet
    ...     Andy
    ...     2017-10-1
    ...     Snake
    Set Pet Name To "Andy"
    Set Pet Birth Date To "2017-10-1"
    Set Pet Type To A Snake
    Click On Add Pet Button
    Birth Date Content Should Be Invalid

Add Duplicated Pet
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    [Setup]     Add New Owner Named "Edward Random" And Add New Dog Named "Kindle"
    Click On Add New Pet
    Set Pet Name To "kindle"
    Set Pet Birth Date To "2017-10-10"
    Set Pet Type To A Lizard
    Click On Add Pet Button
    Form Should Contain An Error
    Name Error Message Should Contain "is already in use"
