*** Settings ***
Resource    ../../resources/page_objects/home.robot

*** Test Cases ***
Check PetClinic Welcome Page
    [Documentation]     https://github.com/spring-projects/spring-boot/issues/14882
    [Tags]              bugs
    Go To PetClinic Welcome Page
