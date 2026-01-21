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
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Valid Credentials
    SwagLabsApp.Verify Login Successful
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.verify Item number in Cart is correct

Should be able to remove item from cart
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Valid Credentials
    SwagLabsApp.Verify Login Successful
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.verify Item number in Cart is correct
    SwagLabsApp.Remove "Backpack" From Cart
    SwagLabsApp.Verify no items in Cart

Should be able to checkout successfully
    SwagLabsApp.Go to "Login" Page
    SwagLabsApp.Login With Valid Credentials
    SwagLabsApp.Verify Login Successful
    SwagLabsApp.Add "Backpack" To Cart
    SwagLabsApp.Verify Item Number In Cart is Correct
    SwagLabsApp.Go to "Cart" Page
    SwagLabsApp.Go to Checkout
    SwagLabsApp.Complete Checkout

