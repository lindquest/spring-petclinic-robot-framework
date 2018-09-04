*** Settings ***
Resource    ../resources/page_objects/vets.robot

*** Test Cases ***
Open PetClinic Veterinarians Page
    Open Browser To PetClinic Veterinarians Page
    Veterinarians Page Should Contain Vets Table