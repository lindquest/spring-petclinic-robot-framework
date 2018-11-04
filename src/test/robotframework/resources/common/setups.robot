*** Settings ***
Resource        ../../resources/page_objects/owners/new.robot
Resource        ../../resources/page_objects/owners/owners.robot
Resource        ../../resources/page_objects/owners/owner/owner.robot
Resource        ../../resources/page_objects/owners/owner/pets/pets.robot
Resource        ../../resources/page_objects/owners/owner/pets/new.robot
Library         String

*** Keywords ***
Add New Owner Named "${Name}" And Click On ${Section}
    ${First}    ${Last}=    Split String    ${Name}     max_split=1
    ${Last}=            Run Keyword If      '${Last}' == 'Random'   Generate Random String  length=10   chars=[LETTERS]
    ...                 ELSE                Set Variable            ${Last}
    Set Test Variable   ${Last}
    Add A New Owner
    ...     ${First}
    ...     ${Last}
    ...     101 Testing St.
    ...     Testville
    ...     121760662
    Run Keyword     Click On ${Section}

Add New Owner Named "${Name}" And Go To ${Section} Page
    ${First}            ${Last}=            Split String            ${Name}                 max_split=1
    ${Last}=            Run Keyword If      '${Last}' == 'Random'   Generate Random String  length=10   chars=[LETTERS]
    ...                 ELSE                Set Variable            ${Last}
    Set Test Variable   ${Last}
    Add A New Owner
    ...     ${First}
    ...     ${Last}
    ...     102 Yet Test Av.
    ...     Exampletown
    ...     123444444
    Run Keyword     Go To PetClinic ${Section} Page

Add New Owner Named "${Name}" And Add New ${Type} Named "${Pet}"
    Add New Owner Named "${Name}" And Click On Add New Pet
    Add New Pet And Verify  
    ...     ${Pet}
    ...     2010-10-10
    ...     ${Type}
