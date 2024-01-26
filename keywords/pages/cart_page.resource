*** Keywords ***
Verify size choice
    ${expect.value}=   Set Variable     M
    ${actual.value}=   SeleniumLibrary.Get Text         ${CART.SIZE.M.SELECTED.TEXT}
    BuiltIn.Should Be Equal     ${actual.value}         ${expect.value}

Verify color choice
    ${expect.value}=   Set Variable     Orange
    ${actual.value}=   SeleniumLibrary.Get Text         ${CART.COLOR.ORANGE.SELECTED.TEXT}
    BuiltIn.Should Be Equal     ${actual.value}         ${expect.value}