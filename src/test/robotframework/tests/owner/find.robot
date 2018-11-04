*** Settings ***
Resource        ../../resources/common/setups.robot
Resource        ../../resources/page_objects/owners/find.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Test Setup      Go To PetClinic Find Owners Page

*** Test Cases ***
Search For Empty Last Name
    Search By Owner's Last Name             ${EMPTY}
    Page Should Contain Multiple Results    ${EMPTY}

Search For Last Name With Only One Result
    [Setup]    Add New Owner Named "John Random" And Go To Find Owners Page
    Search By Owner's Last Name                     ${Last}
    Page Should Contain Owner Information Section
    Owner's Last Name Should Match Query            ${Last}

Search For Last Name With More Than One Result
    [Setup]     Run Keywords
    ...             Add New Owner Named "George Common" And Go To Find Owners Page
    ...             Add New Owner Named "Jonathan Common" And Go To Find Owners Page
    Search By Owner's Last Name                 Common
    Page Should Contain Only Relevant Names     Common
