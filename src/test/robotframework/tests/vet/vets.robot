*** Settings ***
Resource    ../../resources/page_objects/vets.robot
Test Setup  Go To PetClinic Veterinarians Page

*** Test Cases ***
Check PetClinic Veterinarians Page
    Veterinarians Page Should Contain Vets Table
