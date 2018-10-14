*** Settings ***
Resource    ../../resources/page_objects/oups.robot
Test Setup  Go To PetClinic Error Page

*** Test Cases ***
Check PetClinic Error Page
    Page Should Contain Expected Error
