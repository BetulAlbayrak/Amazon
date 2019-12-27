*** Settings ***
Library  SeleniumLibrary
Resource  ../Resources/PO/HomePage.robot
Resource  ../Resources/PO/LoginPage.robot
Resource  ../Resources/PO/ProductPage.robot
Resource  ../Resources/PO/ListPage.robot



*** Variables ***



*** Keywords ***


GO TO AMAZON
    Open Browser  ${HOME_PAGE_URL}  chrome
    location should be  ${HOME_PAGE_URL}
    title should be  ${HOME_PAGE_TITLE}

LOGIN
    mouse over  ${HOME_PAGE_HESAPLAR_VE_LISTELER_MENU}
    wait until element is visible  ${HOME_PAGE_GIRIS_YAP}
    click element  ${HOME_PAGE_GIRIS_YAP}
    wait until element is visible  ${LOGIN_PAGE_INPUT_EMAIL}
    input text  ${LOGIN_PAGE_INPUT_EMAIL}  ${LOGIN_PAGE_INPUT_EMAIL_VALUE}
    click element  ${LOGIN_PAGE_DEVAM_ET_BUTTON}
    wait until element is visible  ${LOGIN_PAGE_INPUT_PASSWORD}
    input text  ${LOGIN_PAGE_INPUT_PASSWORD}  ${LOGIN_PAGE_INPUT_PASSWORD_VALUE}
    click element  ${LOGIN_PAGE_GIRIS_YAP_BUTTON}

SEARCH PRODUCT AND ADD TO LIST
    wait until element is visible  ${HOME_PAGE_SEARCH_TEXT}
    input text  ${HOME_PAGE_SEARCH_TEXT}  ${PRODUCT_NAME}
    wait until element is visible   ${HOME_PAGE_SEARCH_BUTTON}
    click element  ${HOME_PAGE_SEARCH_BUTTON}
    page should contain  Aranan ürün: "${PRODUCT_NAME}"
    wait until element is visible  ${PRODUCT_PAGE_SECOND_PAGE_lINK}
    click element  ${PRODUCT_PAGE_SECOND_PAGE_lINK}
    location should contain  page=2
    click element  ${PRODUCT_PAGE_THIRTH_PRODUCT}
    wait until element is visible  ${PRODUCT_PAGE_ADD_LIST}
    click element  ${PRODUCT_PAGE_ADD_LIST}

ASSERT THE PRODUCT HAS BEEN ADDED
    wait until element is visible   ${PRODUCT_PAGE_VIEW_LIST}
    click element   ${PRODUCT_PAGE_VIEW_LIST}

REMOVE PRODUCT FROM THE LIST
    wait until element is visible  ${LIST_PAGE_ADDED_PRODUCT}
    click link  Ürünü kaldır

ASSERT THE PRODUCT HAS BEEN REMOVED
    reload page
    wait until element is not visible  ${LIST_PAGE_ADDED_PRODUCT}
    page should contain  ${LIST_PAGE_HAS_NO_PRODUCT}
    close browser



