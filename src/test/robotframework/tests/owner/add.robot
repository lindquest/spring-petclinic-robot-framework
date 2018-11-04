*** Settings ***
Resource    ../../resources/page_objects/owners/find.robot
Resource    ../../resources/page_objects/owners/new.robot
Resource    ../../resources/page_objects/owners/owner/owner.robot
Test Setup  Go To PetClinic Add Owner Page

*** Test Cases ***
Add New Owner
    [Template]  Add A New Owner And Verify
    John    Doe     303 Green Valley Av.    Springfield     1123343229

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
    Add A New Owner     
    ...     Richard
    ...     Phoney
    ...     883 Red St.
    ...     Wardville
    ...     01189998819991197253
    Form Should Contain An Error
    Telephone Error Message Should Contain "numeric value out of bounds"
