*** Keywords ***
is "${elementName}" visible
    Register Keyword To Run On Failure  Nothing
    Wait Until Page Contains Element     //android.widget.TextView[@text='${elementName}']    1

is "${buttonName}" button visible
    Register Keyword To Run On Failure  Nothing
    Wait Until Page Contains Element     //android.widget.Button[@text='${buttonName}']    1

scroll down to "${elementName}"
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is "${elementName}" visible
      run keyword if  ${element} == False    Scroll down
      exit for loop if  ${element}==True
    END

scroll up to "${elementName}"
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is "${elementName}" visible
      run keyword if  ${element} == False    Scroll up
      exit for loop if  ${element}==True
    END

scroll down to button "${buttonName}"
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is "${buttonName}" button visible
      run keyword if  ${element} == False    Scroll down
      exit for loop if  ${element}==True
    END

wait and click1 "${locator}"
    Wait Until Page Contains Element    ${locator}    ${timeOutSeconds}
    Click Element       ${locator}

Scroll down
    Swipe By Percent    50  70  50  30

Swipe down notification bar
    Swipe By Percent    40  0  40  90

Scroll up
    Swipe By Percent    50  30  50  70

Scroll left
    Swipe By Percent    20  50  40  50

Scroll right
    Swipe By Percent    40  50  20  50

Swipe up lock screen
    Swipe By Percent    50  90  50  10

click back button
    Press Keycode  4

click skip button
    wait and click1 "//android.widget.Button[@text='Skip']"

turn off network connection
    Set Network Connection status    0

turn on network connection
    Set Network Connection Status    6

press power key to suspend screen
    Press Keycode  26

long press power key
    Long Press Keycode  26

click "${buttonName}" button
    Wait Until Page Contains Element    //android.widget.Button[@text='${buttonName}']    ${timeOutSeconds}
    Click Element       //android.widget.Button[@text='${buttonName}']

close application
    Quit Application

switch application "${alias}"
    switch application    ${alias}



