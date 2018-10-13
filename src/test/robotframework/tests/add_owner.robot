*** Settings ***
Resource    ../resources/page_objects/owners/find.robot
Resource    ../resources/page_objects/owners/new.robot
Resource    ../resources/page_objects/owners/owner/owner.robot
Test Setup  Go To PetClinic Add Owner Page

*** Test Cases ***
Add New Owner
    Set Owner's First Name To "John"
    Set Owner's Last Name To "Very-Unique"
    Set Owner's Address To "303 Green Valley Av."
    Set Owner's City To "Springfield"
    Set Owner's Telephone To "1123343229"
    Click On Add Owner button
    Page Should Contain Owner Information Section
    Owner's Name Should Be "John Very-Unique"
    Owner's Address Should Be "303 Green Valley Av."
    Owner's City Should Be "Springfield"
    Owner's Telephone Should Be "1123343229"

Try To Add Owner With Missing First Name
    [Template]  Try To Add Owner With Missing Information
    First Name

Try To Add Owner With Missing Last Name
    [Template]  Try To Add Owner With Missing Information
    Last Name

Try To Add Owner With Missing Address
    [Template]  Try To Add Owner With Missing Information
    Address

Try To Add Owner With Missing City
    [Template]  Try To Add Owner With Missing Information
    City

Try To Add Owner With Missing Telephone
    [Template]  Try To Add Owner With Missing Information
    Telephone

Try To Add Owner With Long Telephone Number
    Set Owner's First Name To "Richard"
    Set Owner's Last Name To "Phoney"
    Set Owner's Address To "883 Red St."
    Set Owner's City To "Wardville"
    Set Owner's Telephone To "01189998819991197253"
    Click On Add Owner button
    Form Should Contain An Error
    Telephone Error Message Should Contain "numeric value out of bounds"