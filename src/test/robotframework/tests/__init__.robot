*** Settings ***
Resource            ../resources/common/selenium.robot
Resource            ../resources/page_objects/home.robot
Suite Setup         Open Browser To PetClinic Welcome Page
Suite Teardown      Close All Browsers