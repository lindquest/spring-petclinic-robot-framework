*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${ERROR_URL}                    ${ADDRESS}/oups
${ERROR_HEADER}                 tag:h2
${ERROR_HEADER_TEXT}            Something happened...
${ERROR_MESSSAGE}               Expected: controller used to showcase what happens when an exception is thrown

*** Keywords ***
Go To PetClinic Error Page
    Go To Page      ${ERROR_URL}    ${ERROR_HEADER_TEXT}    ${ERROR_HEADER}

Page Should Contain Expected Error
    Page Should Contain                 ${ERROR_MESSSAGE}
