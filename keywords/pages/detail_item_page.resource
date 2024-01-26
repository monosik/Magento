*** Keywords ***
Verify an item should same as the clcik action
    SeleniumLibrary.Wait Until Element Is Visible    ${ITEM.TITLE}     10s
    ${actual.item}=    SeleniumLibrary.Get Text    ${ITEM.TITLE}
    BuiltIn.Should Be Equal     ${actual.item}      Adrienne Trek Jacket

Verify Instock Stuck
    ${expect.value}=   Set Variable     IN STOCK
    ${actual.value}=   SeleniumLibrary.Get Text    ${AVAILABLE.STATUS.TEXT}
    BuiltIn.Should Be Equal     ${actual.value}      ${expect.value}

Choose size
    SeleniumLibrary.Click Element       ${SIZE.M.OPTION}

Verify size choice
    ${expect.value}=   Set Variable     M
    ${actual.value}=   SeleniumLibrary.Get Text    ${SIZE.M.SELECTED.TEXT}
    BuiltIn.Should Be Equal     ${actual.value}      ${expect.value}

Choose color
    SeleniumLibrary.Click Element       ${COLOR.ORANGE.OPTION}

Verify color choice
    ${expect.value}=   Set Variable     Orange
    ${actual.value}=   SeleniumLibrary.Get Text    ${COLOR.ORANGE.SELECTED.TEXT}
    BuiltIn.Should Be Equal     ${actual.value}      ${expect.value}

Click add to cart
    SeleniumLibrary.Click Element       ${ADD.ITEM.BUTTON}

Check item in cart
    SeleniumLibrary.Wait Until Element Is Visible    ${ITEM.QUANTITY.TEXT}     10s
    SeleniumLibrary.Click Element       ${CART.ITEM}
    SeleniumLibrary.Click Element       ${VIEW.AND.EDIT.CART.BUTTON}