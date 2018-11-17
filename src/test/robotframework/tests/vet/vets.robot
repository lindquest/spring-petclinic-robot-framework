*** Settings ***
Resource    ../../resources/page_objects/vets.robot
Resource    ../../resources/endpoints/vets.robot
Test Setup  Go To PetClinic Veterinarians Page

*** Test Cases ***
Check PetClinic Veterinarians Page
    Veterinarians Page Should Contain Vets Table

Validate Veterinarians Page Results
    Veterinarians Page Should Contain Vets Table
    &{Page Results}=                Get Veterinarians Page Table Information
    &{Endpoint Results}=            Get Veterinarians Endpoint Information
    Vets Information Should Match   ${Page Results}                             ${Endpoint Results}
