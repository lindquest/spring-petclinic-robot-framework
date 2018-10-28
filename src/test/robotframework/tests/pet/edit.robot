*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/pet/edit.robot
Test Setup      Go To Random Owner With A Pet

*** Test Cases ***
Edit Pet Information
    Click On A Random Pet Edit Button
    Set Pet Name To "Fluffer"
    Set Pet Birth Date To "2018-10-14"
    Set Pet Type To A Dog
    Click On Update Pet Button
    Dog Named "Fluffer" And Born In "2018-10-14" Should Be Visible
