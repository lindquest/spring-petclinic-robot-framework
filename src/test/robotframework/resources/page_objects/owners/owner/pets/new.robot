*** Settings ***
Library                             ../../../../libraries/StringExtra.py
Resource                            pet/edit.robot
Resource                            pets.robot

*** Variables ***
${NEW_PET_URL}                      ${ADDRESS}/owners/[ID]/pets/new
${ADD_PET_BUTTON}                   //button[text()="Add Pet"]

*** Keywords ***
Click On Add Pet Button
    Click Element   ${ADD_PET_BUTTON}

Add New Pet
    [Arguments]     ${Name}     ${Date}    ${Type}
    Set Pet Name To "${Name}"
    Set Pet Birth Date To "${Date}"
    Set Pet Type To A ${Type}
    Click On Add Pet Button

Add New Pet And Verify
    [Arguments]     ${Name}     ${Date}    ${Type}
    Add New Pet     ${Name}     ${Date}    ${Type}
    ${Type} Named "${Name}" And Born In "${Date}" Should Be Visible
