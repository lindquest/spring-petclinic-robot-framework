*** Settings ***
Resource                        ../common/selenium.robot

*** Variables ***
${ERROR_URL}                    ${ADDRESS}/oups
${ERROR_HEADER}                 tag:h2
${ERROR_HEADER_TEXT}            Something happened...
${ERROR_MESSSAGE}               Expected: controller used to showcase what happens when an exception is thrown

*** Keywords ***
Open Browser To PetClinic Error Page
    Open Browser To Page                ${ERROR_URL}
    Wait Until Element Is Visible       ${ERROR_HEADER}
    Element Text Should Be              ${ERROR_HEADER}      ${ERROR_HEADER_TEXT}
    Page Should Contain                 ${ERROR_MESSSAGE}
