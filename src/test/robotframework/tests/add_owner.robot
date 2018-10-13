*** Settings ***
Resource    ../resources/page_objects/owners/find.robot
Resource    ../resources/page_objects/owners/new.robot
Resource    ../resources/page_objects/owners/owner/owner.robot
Test Setup  Go To PetClinic Add Owner Page

*** Test Cases ***
Add New Owner
    Set Owner's First Name To "John"
    Set Owner's Last Name To "Very-Unique"
    Set Owner's Address To "303 Green Valley Av."
    Set Owner's City To "Springfield"
    Set Owner's Telephone To "1123343229"
    Click On Add Owner button
    Page Should Contain Owner Information Section
    Owner's Name Should Be "John Very-Unique"
    Owner's Address Should Be "303 Green Valley Av."
    Owner's City Should Be "Springfield"
    Owner's Telephone Should Be "1123343229"
