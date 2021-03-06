*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/edit.robot
Test Setup      Add New Owner Named "John Edit" And Click On Edit Owner

*** Test Cases ***
Edit Owner Information
    Change Owner's First Name To "Alexander"
    Change Owner's Last Name To "Davis"
    Change Owner's Address To "234 Parkins Av."
    Change Owner's City To "New York"
    Change Owner's Telephone To "3031189003"
    Click On Update Owner Button
    Page Should Contain Owner Information Section
    Owner's Name Should Be "Alexander Davis"
    Owner's Address Should Be "234 Parkins Av."
    Owner's City Should Be "New York"
    Owner's Telephone Should Be "3031189003"
