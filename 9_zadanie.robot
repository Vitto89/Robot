*** Settings ***
Library  SeleniumLibrary

Test Setup  Open Browser

*** Variables ***
@{emails}    email13@wp.pl    email23@wp.pl    email33@wp.pl    email43@wp.pl    email53@wp.pl
@{passwords}    pass1    pass2    pass3    pass4    pass5
${message}    Dziękujemy za założenie nowego konta.
*** Keywords ***
Open Web_Browser
    Open Browser    https://gotujmy.pl/forum/    Chrome
    maximize browser window
    click window
    execute javascript    document.body.style.zoom='50%'
Registration in Forum
    [Arguments]    ${name}    ${password}
    Open Web_Browser
    Sleep    10
  # do sprawdzenia  scroll element into view    //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
  #  Sleep    10
  # reczne zmniejszenie strony CTRL -
    Run keyword and ignore error   Click Button     //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]
    Click Element    //*[@id="navTop"]/nav/ul[1]/li[2]/a
    Run keyword and ignore error   Click Button     //*[@id="tcf277-permissions-modal"]/div[3]/div/button[2]

    Input Text    //*[@id="f_cmu_email"]    ${name}
    Input Text    //*[@id="f_cmu_email2"]    ${name}
    input text    //*[@id="f_cmu_password"]    ${password}
    Input Text    //*[@id="f_cmu_password2"]    ${password}
    checkbox should not be selected   //*[@id="newsletter_agree"]
    select checkbox   //*[@id="newsletter_agree"]
    checkbox should not be selected  //*[@id="user_register_form"]/fieldset/label[2]/input
    select checkbox  //*[@id="user_register_form"]/fieldset/label[2]/input
    checkbox should not be selected    //*[@id="user_register_form"]/fieldset/label[3]/input
    select checkbox    //*[@id="user_register_form"]/fieldset/label[3]/input
    click button     //*[@id="user_register_form"]/fieldset/footer/button
    wait until element is visible    //*[@id="main_content"]/div/div/h1    timeout=7
    ${my_message}    Get Text    //*[@id="main_content"]/div/div/h1
    log to console    ${my_message}
    should be equal as strings    ${my_message}  ${message}
    capture page screenshot

*** Test Cases ***
Registration of Multiple User
    FOR   ${i}    IN RANGE  5
        Registration in Forum      ${emails}[${i}]    ${passwords}[${i}]
        Log    User ${emails}[${i}]
    END