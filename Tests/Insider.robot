*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/Insider.robot



*** Variables ***



*** Test Cases ***

AMAZON TEST

    Insider.GO TO AMAZON
    Insider.LOGIN
    Insider.SEARCH PRODUCT AND ADD TO LIST
    Insider.ASSERT THE PRODUCT HAS BEEN ADDED
    Insider.REMOVE PRODUCT FROM THE LIST
    Insider.ASSERT THE PRODUCT HAS BEEN REMOVED




