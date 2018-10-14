*** Settings ***
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Test Setup      Go To PetClinic Find Owners Page

*** Test Cases ***
Search For Empty Last Name
    Search By Owner's Last Name             ${EMPTY}
    Page Should Contain Multiple Results    ${EMPTY}

Search For Last Name With Only One Result
    ${Last Name}=                                   Get Unique Last Name
    Search By Owner's Last Name                     ${Last Name}
    Page Should Contain Owner Information Section
    Owner's Last Name Should Match Query            ${Last Name}

Search For Last Name With More Than One Result
    ${Last Name}=                               Get Non-Unique Last Name
    Search By Owner's Last Name                 ${Last Name}
    Page Should Contain Only Relevant Names     ${Last Name}
