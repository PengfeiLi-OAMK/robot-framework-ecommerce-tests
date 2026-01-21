*** Settings ***
Documentation    Shopping related test cases
Test Tags    shopping    e2e
Resource     ../Resources/Common.resource
Resource     ../Resources/SwagLabsApp.resource
Test Setup    Begin Web Test 
Test Teardown    End Web Test

# run script: robot -d results tests/Shop_Checkout.robot

*** Test Cases ***
Should be able to add item to cart
    SwagLabsApp.Login As Standard User
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.Verify Item Number In Cart is Correct

Should be able to remove item from cart
    SwagLabsApp.Login As Standard User
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.Verify Item Number In Cart is Correct
    SwagLabsApp.Remove "Backpack" From Cart
    SwagLabsApp.Verify no items in Cart

Should be able to checkout successfully
    SwagLabsApp.Login As Standard User
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.Verify Item Number In Cart is Correct
    SwagLabsApp.Go to "Cart" Page
    SwagLabsApp.Start Checkout
    SwagLabsApp.Add Checkout Information
    SwagLabsApp.Complete Checkout

