*** Settings ***
Resource          ${CURDIR}/../import/import.resource
Suite Teardown    Close Browser

*** Test Cases ***
Verify that user can add a item
    Open browser                            https://magento.softwaretestingboard.com/         chrome
    ExcelLibrary.Open Excel Document        ${CURDIR}${/}..${/}test_data${/}SearchingJacket.xlsx    sheet1  
    ${item}=    ExcelLibrary.Read excel Cell     col_num=1        row_num=2
    searching_feature.Searching an item     ${item}
    searching_result_page.Click Adrienne Trek Jacket
    detail_item_page.Verify an item should same as the clcik action
    detail_item_page.Choose size
    detail_item_page.Choose color
    addingitem_feature.Verify that item can be added
    detail_item_page.Check item in cart
    addingitem_feature.Verify that item in cart is the same as selection