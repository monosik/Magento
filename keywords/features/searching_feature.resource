*** Keywords ***
Searching an item
    [Arguments]                                      ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${SEARCH.AN.ITEM.TEXTBOX}
    SeleniumLibrary.Input Text                       ${SEARCH.AN.ITEM.TEXTBOX}    ${text}
    SeleniumLibrary.Press keys                       ${SEARCH.AN.ITEM.TEXTBOX}    RETURN

Verify item search
    [Arguments]                                      ${text}
    SeleniumLibrary.Wait Until Element Is Visible    ${SEARCHING.JACKET.RESULT.TEXTBOX}     10s
    ${actual.result}=  SeleniumLibrary.Get Text     ${SEARCHING.JACKET.RESULT.TEXTBOX}
    Log To Console      ${actual.result}
    # SeleniumLibrary.Wait Until Page Contains         ${SEARCHING.JACKET.RESULT.TEXTBOX} 
    ${item_list}=    Create List
    ${elements}=    Get WebElements    ${SEARCHING.JACKET.RESULT.TEXTBOX} 
    FOR    ${element}    IN    @{elements}
        ${item}=    SeleniumLibrary.Get Text    ${element}
        BuiltIn.Should Contain      ${item}     ${text}
    END

Change to ascending price and verify price
    searching_result_page.Select sort by   Price
    searching_result_page.Click ascending icon
    ${price_list}=    Create List
    ${elements}=    Get WebElements    ${ITEM.PRICE.TEXTBOX} 
    FOR    ${element}    IN    @{elements}
        ${price}=    SeleniumLibrary.Get Text    ${element}
        ${price}=    String.Replace String    ${price}    $    ${EMPTY}
        ${price}=    BuiltIn.Convert To Number    ${price}
        Collections.Append To List    ${price_list}    ${price}
    END
    # Log To Console  ${price_list}
    ${length}=   BuiltIn.Get Length    ${price_list}
    FOR    ${index}    IN RANGE    0    ${length-2}
        ${current_price}=    Collections.Get From List    ${price_list}    ${index}
        ${next_price}=    Collections.Get From List    ${price_list}    ${index+1}
        BuiltIn.Should Be True    ${current_price} <= ${next_price}
    END

Change to descending price and verify price
    searching_result_page.Select sort by   Price
    searching_result_page.Click ascending icon
    searching_result_page.Click descending icon
    ${price_list}=    Create List
    ${elements}=    Get WebElements    ${ITEM.PRICE.TEXTBOX} 
    FOR    ${element}    IN    @{elements}
        ${price}=    SeleniumLibrary.Get Text    ${element}
        ${price}=    String.Replace String    ${price}    $    ${EMPTY}
        ${price}=    BuiltIn.Convert To Number    ${price}
        Collections.Append To List    ${price_list}    ${price}
    END
    # Log To Console  ${price_list}
    ${length}=   BuiltIn.Get Length    ${price_list}
    FOR    ${index}    IN RANGE    0    ${length-2}
        ${current_price}=    Collections.Get From List    ${price_list}    ${index}
        ${next_price}=    Collections.Get From List    ${price_list}    ${index+1}
        BuiltIn.Should Be True    ${current_price} >= ${next_price}
    END