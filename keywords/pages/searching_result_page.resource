*** Keywords ***
Verify descending icon
    SeleniumLibrary.Wait Until Element Is Visible    ${DESCENDING.ICON}     10s

Verify ascending icon
    SeleniumLibrary.Wait Until Element Is Visible    ${ASCENDING.ICON}     10s

Click descending icon
    SeleniumLibrary.Click Element    ${DESCENDING.ICON}     

Click ascending icon
    SeleniumLibrary.Click Element    ${ASCENDING.ICON} 

Select sort by
    [Arguments]         ${value}
    SeleniumLibrary.Click element   ${SORT.SELECT} 
    IF    "${value}" == "Price"
        SeleniumLibrary.Click element    ${SORT.PRICE.SELECT} 
    ELSE IF    "${value}" == "Name"
        SeleniumLibrary.Click element    ${SORT.NAME.SELECT}
    END

Click Adrienne Trek Jacket
    SeleniumLibrary.Click Element    ${ADRIENNE.JACKET.TEXTBOX}

