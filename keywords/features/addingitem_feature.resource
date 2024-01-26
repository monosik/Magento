*** Keywords ***
Verify that item can be added
    detail_item_page.Verify Instock Stuck
    detail_item_page.Verify size choice
    detail_item_page.Verify color choice
    detail_item_page.Click add to cart

Verify that item in cart is the same as selection
    cart_page.Verify size choice
    cart_page.Verify color choice