*** Settings ***
Library                             ../../../../libraries/StringExtra.py
Resource                            pet/edit.robot

*** Variables ***
${NEW_PET_URL}                      ${ADDRESS}/owners/[ID]/pets/new
${ADD_PET_BUTTON}                   //button[text()="Add Pet"]

*** Keywords ***
Click On Add Pet Button
    Click Element   ${ADD_PET_BUTTON}

