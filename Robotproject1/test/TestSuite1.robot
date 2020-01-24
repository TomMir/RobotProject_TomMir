*** Settings ***
Library     SeleniumLibrary    

Suite Setup       Log    I am inside Test Suite Setup
Suite Teardown    Log    I am inside Test Suite Teardown
Test Setup        Log    I am inside Test Setup
Test Teardown     Log    I am inside Test Teardown                

*** Test Cases ***
MyFirstTest
    Log    Hello world...    
        
FirstSeleniumTest
    Create Webdriver    Chrome        
    Set Browser Implicit Wait    5
    Open Browser    https:google.com    chrome
    Input Text      name=q    Automation step by step
    Press Keys    name=q    ENTER
    Click Button    name=btnk    
    Sleep    2        
    Close Browser
    Log    Test Completed
    

SampleLoginTest
    [Documentation]     This is a sample login test
    Open Browser      ${URL} Chrome
    Set Browser Implicit Wait    5
    LoginKW
    Click Element     id=welcome
    Click Element     id=Logout
    Close Browser
    Log               Test completed   
    Log               This test was executed by %{username} on %{os}             
    
*** Variables ***
${URL}    https://opensource-demo.orangehrmlive.com/
@{CREDENTIALS}    Admin    admin123
&{LOGINDATA}    username=Admin    password=admin123


*** Keywords ***
LoginKW
    Input Text        id=txtUsername    @{CREDENTIALS}[0]    
    Input Password    id=txtPassword    &{LOGINDATA}[password]    
    Click Button      id=btnLogin

