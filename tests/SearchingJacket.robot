*** Settings ***
Resource          ${CURDIR}/../import/import.resource
Suite Teardown    Close Browser

*** Test Cases ***
Verify that can search Jacket
    Open browser                            https://magento.softwaretestingboard.com/         chrome
    ExcelLibrary.Open Excel Document        ${CURDIR}${/}..${/}test_data${/}SearchingJacket.xlsx    sheet1       
    ${item}=    ExcelLibrary.Read excel Cell     col_num=1        row_num=2
    searching_feature.Searching an item     ${item}
    searching_feature.Verify item search    Jacket