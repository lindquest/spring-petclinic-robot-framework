*** Settings ***
Resource            ../resources/common/selenium.robot
Suite Setup         Open Browser To Page                    ${ADDRESS}/
Suite Teardown      Close All Browsers
