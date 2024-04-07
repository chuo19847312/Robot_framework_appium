*** Keywords ***
Launch settings
    Open Application        ${appiumServer}         platformName=${platformName}   platformVersion=${platformVersion}       deviceName=${deviceName}        appPackage=${settingsAppPackageName}        appActivity=${settingsAppActivityName}         newCommandTimeout=600000         deviceReadyTimeout=40     automationName=${automationName}    alias=SettingsApp

open settings
    Start Activity    ${settingsAppPackageName}    ${settingsAppActivityName}

Launch files
    Open Application        ${appiumServer}         platformName=${platformName}   platformVersion=${platformVersion}       deviceName=${deviceName}        appPackage=${filesAppPackageName}        appActivity=${filesAppActivityName}         newCommandTimeout=600000         deviceReadyTimeout=40     automationName=${automationName}    alias=filesApp

click "${settingsOptionName}" in Settings
    scroll down to "${settingsOptionName}"
    Register Keyword To Run On Failure  Nothing
    Wait Until Page Contains Element   //android.widget.TextView[@text='${settingsOptionName}']     ${timeOutSeconds}
    Click Element   //android.widget.TextView[@text='${settingsOptionName}']

turn off wifi and data
    Set Network Connection Status    0

turn on wifi
    Set Network Connection Status    2

turn on data connection
    Set Network Connection Status    4

set up screen lock pin code
    remove screen lock
    wait and click1 "//android.widget.TextView[@text='Screen lock']"
    wait and click1 "//android.widget.TextView[@text='PIN']"
    Wait Until Page Contains Element    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${pin}
    wait and click1 "//android.widget.Button[@text='Next' and @enabled='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your PIN']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${pin}
    wait and click1 "//android.widget.Button[@text='Confirm' and @enabled='true']"
    wait and click1 "//android.widget.Button[@text='Done']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='PIN']    ${timeOutSeconds}

re-enter pin code
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your PIN']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${pin}
    Press Keycode    66

click "${button}" at set up Face Unlock page
    FOR  ${index}  IN RANGE  0  10
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is "I agree" button visible
      run keyword if  ${element} == False    click more button
      exit for loop if  ${element}== True
    END
    wait and click1 "//android.widget.Button[@text='${button}']"

click more button
    wait and click1 "//android.widget.Button[@text='More']"

click Agree button
    wait and click1 "//android.widget.Button[@text='Agree']"

click "${button}" at how to set up Face Unlock page
    scroll down to button "${button}"
    wait and click1 "//android.widget.Button[@text='${button}']"

should skip face authentication set up
    Wait Until Page Contains Element    //android.widget.TextView[@text='Face Unlock']/../android.widget.TextView[@text='Tap to set up face']    ${timeOutSeconds}

close settings
    Close Application

set up screen lock password
    remove screen lock
    wait and click1 "//android.widget.TextView[@text='Screen lock']"
    wait and click1 "//android.widget.TextView[@text='Password']"
    Wait Until Page Contains Element    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${password}
    wait and click1 "//android.widget.Button[@text='Next' and @enabled='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your password']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${password}
    wait and click1 "//android.widget.Button[@text='Confirm' and @enabled='true']"
    wait and click1 "//android.widget.Button[@text='Done']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='Password']    ${timeOutSeconds}

re-enter password
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your password']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${password}
    Press Keycode    66

re-enter pin
    run process     adb  shell  input  text  ${pin}    shell=True    timeout=15s
    Press Keycode    66

re-enter wrong pin/password
    run process     adb  shell  input  text  0000    shell=True    timeout=15s
    Press Keycode    66

re-enter pattern
    Wait Until Page Contains Element    //android.widget.TextView[@text='Confirm your pattern']    ${timeOutSeconds}
    ${height}  Get Window Height
    run keyword if  '${height}' < '2100'    re-enter pattern 2100
    run keyword if  '2100' <= '${height}' < '2140'   re-enter pattern 2160 or 2220
    run keyword if  '2150' <= '${height}' < '2240'   re-enter pattern 2340 or 2280
    run keyword if  '2240' <= '${height}' <= '2300'    re-enter pattern 2400
    run keyword if  '2700' <= '${height}' <= '2900'    re-enter pattern 3040
    run keyword if  '${height}' > '2900'    re-enter pattern 2935

re-enter pattern 2100
    draw lock pattern    216  1028  216  1713  868  1713

re-enter pattern 2340 or 2280
    draw lock pattern    211  1117  211  1737  864  1737

re-enter pattern 2160 or 2220
    draw lock pattern    204  1103  204  1767  871  1767

re-enter pattern 3040
    draw lock pattern    275  1560  275  2460  1148  2460

re-enter pattern 2935
    draw lock pattern    284  1475  284  2415  1146  2415

re-enter pattern 2400
    draw lock pattern    210  1145  210  1821  871  1821

set up screen lock pattern
    remove screen lock
    wait and click1 "//android.widget.TextView[@text='Screen lock']"
    wait and click1 "//android.widget.TextView[@text='Pattern']"
    Wait Until Page Contains Element    id=lockPattern    ${timeOutSeconds}
    ${height}  Get Window Height
    run keyword if  '${height}' < '2100'   draw lock screen 2100
    run keyword if  '2100' <= '${height}' <= '2140'   draw lock screen 2160 or 2220
    run keyword if  '2150' <= '${height}' < '2240'   draw lock screen 2280 or 2340
    run keyword if  '2240' <= '${height}' <= '2300'    draw lock screen 2400
    run keyword if  '${height}' >= '2700'    draw lock screen 3040
    wait and click1 "//android.widget.Button[@text='Next']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Draw pattern again to confirm']    ${timeOutSeconds}
    ${height}  Get Window Height
    run keyword if  '${height}' < '2100'   draw lock screen 2100
    run keyword if  '2100' <= '${height}' <= '2140'   draw lock screen 2160 or 2220
    run keyword if  '2150' <= '${height}' < '2240'   draw lock screen 2280 or 2340
    run keyword if  '2240' <= '${height}' <= '2300'    draw lock screen 2400
    run keyword if  '${height}' >= '2700'    draw lock screen 3040
    wait and click1 "//android.widget.Button[@text='Confirm']"
    wait and click1 "//android.widget.Button[@text='Done']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='Pattern']    ${timeOutSeconds}

draw lock screen 2100
    draw lock pattern    274  1167  274  1675  805  1675

draw lock screen 2280 or 2340
    draw lock pattern    208  1179  208  1840  870  1840

draw lock screen 3040
    draw lock pattern    275  1560  275  2460  1148  2460

draw lock screen 2160 or 2220
    draw lock pattern    212  1170  212  1836  860  1836

draw lock screen 2935
    draw lock pattern    291  1594  291  2459  1084  2459

draw lock screen 2400
    draw lock pattern    210  1247  210  1890  840  1890

go through set up Face Unlock process
    FOR  ${index}  IN RANGE  0  5
      ${element}  run keyword and return status    is "Agree" button visible
      run keyword if  ${element} == False    click more button
      exit for loop if  ${element}== True
    END
    wait and click1 "//android.widget.Button[@text='Agree']"
    wait and click1 "//android.widget.Button[@text='Start' and @enabled='true']"
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Help make Face Unlock better" visible
      run keyword if  ${element} == True    click skip button
      exit for loop if  ${element}== False
    END
    Wait Until Page Contains Element    //android.widget.TextView[@text='Hold the phone still. Rotate your head. Go slow.']    ${timeOutSeconds}

remove screen lock
    scroll down to "Face & Fingerprint Unlock"
    FOR  ${index}  IN RANGE  0  1
      Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/..//android.widget.TextView[@resource-id='android:id/summary']    ${timeOutSeconds}
      ${element}  Get Element Attribute    //android.widget.TextView[@text='Screen lock']/..//android.widget.TextView[@resource-id='android:id/summary']    text
      run keyword if    '${element}'=='None'    exit for loop
      run keyword if    '${element}'=='Swipe'    exit for loop
      run keyword if    '${element}'=='PIN'      set screen lock from pin to none
      run keyword if    '${element}'=='Password'      set screen lock from password to none
      run keyword if    '${element}'=='Pattern'       set screen lock from pattern to none
    END


set screen lock from pin to none
    scroll down to "Screen lock"
    wait and click1 "//android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@resource-id='android:id/summary']"
    re-enter pin
    wait and click1 "//android.widget.TextView[@text='None']"
    wait and click1 "//android.widget.Button[@text='Delete']"
    scroll down to "Face & Fingerprint Unlock"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='None']    ${timeOutSeconds}

set screen lock from password to none
    scroll down to "Screen lock"
    wait and click1 "//android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@resource-id='android:id/summary']"
    re-enter password
    wait and click1 "//android.widget.TextView[@text='None']"
    wait and click1 "//android.widget.Button[@text='Delete']"
    scroll down to "Face & Fingerprint Unlock"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='None']    ${timeOutSeconds}

set screen lock from pattern to none
    scroll down to "Screen lock"
    wait and click1 "//android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@resource-id='android:id/summary']"
    re-enter pattern
    wait and click1 "//android.widget.TextView[@text='None']"
    wait and click1 "//android.widget.Button[@text='Delete']"
    scroll down to "Face & Fingerprint Unlock"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='None']    ${timeOutSeconds}

go to enroll face page
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Help make Face Unlock better" visible
      run keyword if  ${element} == True    click I agree and confirm
      exit for loop if  ${element}== False
    END
    Wait Until Page Contains Element    id=com.google.android.settings.future.biometrics.faceenroll:id/surface_view    ${timeOutSeconds}

click I agree and confirm
    wait and click1 "//android.widget.CheckBox[@text='I agree']"
    wait and click1 "//android.widget.Button[@text='Confirm' and @enabled='true']"

display Face Unlock detailed page after enrollment
    scroll down to button "Delete face model"
    Wait Until Page Contains Element    accessibility_id=Face Unlock        ${timeOutSeconds}
    Wait Until Page Contains Element    //android.widget.Button[@text='Delete face model']    ${timeOutSeconds}

should display face & fingerprint unlock detailed page
    Wait Until Page Contains Element    //android.widget.FrameLayout[@content-desc='Face & Fingerprint Unlock']    ${timeOutSeconds}

choose screen lock "${lockType}"
    wait and click1 "//android.widget.TextView[contains(@text,'${lockType}')]"

to use Face Unlock, set PIN as "${pin}"
    Wait Until Page Contains Element    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${pin}
    wait and click1 "//android.widget.Button[@text='Next' and @enabled='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your PIN']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${pin}
    wait and click1 "//android.widget.Button[@text='Confirm' and @enabled='true']"
    wait and click1 "//android.widget.Button[@text='Done']"

screen lock should be "${type}"
    click back button
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen lock']/../android.widget.TextView[@text='${type}']    ${timeOutSeconds}

to use Face Unlock, set Pattern
    Wait Until Page Contains Element    id=lockPattern    ${timeOutSeconds}
    ${height}  Get Window Height
    run keyword if  '${height}' < '2100'   draw lock screen 2100
    run keyword if  '2150' <= '${height}' < '2240'   draw lock screen 2280 or 2340
    run keyword if  '2100' <= '${height}' < '2140'   draw lock screen 2160 or 2220
    run keyword if  '2700' <= '${height}' <= '2900'    draw lock screen 3040
    run keyword if  '${height}' > '2900'    draw lock screen 2935
    run keyword if  '2240' <= '${height}' <= '2300'    draw lock screen 2400
    wait and click1 "//android.widget.Button[@text='Next']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Draw your pattern again']    ${timeOutSeconds}
    ${height}  Get Window Height
    run keyword if  '${height}' < '2100'   draw lock screen 2100
    run keyword if  '2150' <= '${height}' < '2240'   draw lock screen 2280 or 2340
    run keyword if  '2100' <= '${height}' < '2140'   draw lock screen 2160 or 2220
    run keyword if  '2700' <= '${height}' <= '2900'    draw lock screen 3040
    run keyword if  '${height}' > '2900'    draw lock screen 2935
    run keyword if  '2240' <= '${height}' <= '2300'    draw lock screen 2400
    wait and click1 "//android.widget.Button[@text='Confirm']"
    wait and click1 "//android.widget.Button[@text='Done']"

to use Face Unlock, set Password as "${password}"
    Wait Until Page Contains Element    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${password}
    wait and click1 "//android.widget.Button[@text='Next' and @enabled='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your password']    ${timeOutSeconds}
    Input Text    //android.widget.EditText[@resource-id='com.android.settings:id/password_entry']    ${password}
    wait and click1 "//android.widget.Button[@text='Confirm' and @enabled='true']"
    wait and click1 "//android.widget.Button[@text='Done']"

re-enter screen lock
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Re-enter your PIN" visible
      run keyword if  ${element} == True    re-enter pin
      exit for loop if  ${element}== True
      ${element}  run keyword and return status    is "Re-enter your password" visible
      run keyword if  ${element} == True    re-enter password
      exit for loop if  ${element}== True
      ${element}  run keyword and return status    is "Confirm your pattern" visible
      run keyword if  ${element} == True    re-enter pattern
    END

delete face data
    wait and click1 "//android.widget.Button[@text='Delete face model']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Delete face model?']    ${timeOutSeconds}
    wait and click1 "//android.widget.Button[@text='Delete']"

delete and re-enroll face for 5 times
    FOR  ${index}  IN RANGE  0  5
      click "Set up Face Unlock" button
      click "I agree" at set up Face Unlock page
      click "Start" at how to set up Face Unlock page
      go to enroll face page
      should display looks good page
      display Face Unlock detailed page after enrollment
      delete face data
    END

face data should be deleted
    Wait Until Page Contains Element    //android.widget.Button[@text='Set up Face Unlock']    ${timeOutSeconds}

should display face setup guidance
    Wait Until Page Contains Element    id=com.android.settings:id/illustration_normal    ${timeOutSeconds}

use accessibility Face Unlock should be enabled
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use accessibility Face Unlock']/../android.widget.Switch[@checked='true']    ${timeOutSeconds}

turn off use accessibility Face Unlock
    wait and click1 "//android.widget.TextView[@text='Use accessibility Face Unlock']/../android.widget.Switch[@checked='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use accessibility Face Unlock']/../android.widget.Switch[@checked='false']    ${timeOutSeconds}

turn off setup for limited vision or head motion
    wait and click1 "//android.widget.TextView[@text='Setup for limited vision or head motion']/../android.widget.Switch[@checked='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Setup for limited vision or head motion']/../android.widget.Switch[@checked='false']    ${timeOutSeconds}

should display non-accessibility animation
    Wait Until Page Contains Element    id=com.android.settings:id/illustration_lottie      ${timeOutSeconds}

setup for limited vision or head motion should be on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Setup for limited vision or head motion']/../..//android.widget.Switch[@checked='true']    ${timeOutSeconds}

should display how to set up Face Unlock page
    Wait Until Page Contains Element    //android.widget.TextView[@text='How to set up Face Unlock']    ${timeOutSeconds}

Setup Face Unlock by limited head motion
    wait and click1 "//android.widget.TextView[@text='Use accessibility Face Unlock']/../android.widget.Switch[@checked='false']"
    click "Start" at set up Face Unlock page

go to accessibility enroll face page
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Help make Face Unlock better" visible
      run keyword if  ${element} == True    Click I Agree And Confirm
      exit for loop if  ${element}== False
    END
    Wait Until Page Contains Element    id=com.google.android.settings.future.biometrics.faceenroll:id/animation_view    ${timeOutSeconds}

go back to settings
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${lockScreen}  run keyword and return status    is lockscreen displayed
      run keyword if  ${lockScreen} == True    Swipe up lock screen
      run keyword if  ${lockScreen} == True    Launch settings
      run keyword if  ${lockScreen} == True    scroll down to "Security"
    END
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is settings main page displayed
      run keyword if  ${element} == False    click back button
    END
    FOR  ${index}  IN RANGE  0  5
      Register Keyword To Run On Failure  Nothing
      ${element}  run keyword and return status    is "Security" visible
      run keyword if  ${lockScreen} == False       scroll down to "Security"
      exit for loop if  ${element}== True
    END

is settings main page displayed
    Wait Until Page Contains Element     id=com.android.settings:id/search_action_bar_title    ${timeOutSeconds}

suspend/resume screen to trigger Face Unlock
    Press Keycode   26
    sleep  0.5
    Press Keycode   26
    sleep  0.5

is Face Unlock service on "${instance}"
    Wait Until Page Contains Element    //android.widget.TextView[@text='${instance}']/../..//android.widget.Switch[@checked='true']   ${timeOutSeconds}

turn off face service "${instance}"
    wait and click1 "//android.widget.TextView[@text='${instance}']/../..//android.widget.Switch[@checked='true']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='${instance}']/../..//android.widget.Switch[@checked='false']   ${timeOutSeconds}

turn off App sign-in & payments
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "App sign-in & payments"
      run keyword if  ${element} == True    turn off face service "App sign-in & payments"
      exit for loop if  ${element}== False
    END

turn on App sign-in & payments
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "App sign-in & payments"
      run keyword if  ${element} == False    turn on face service "App sign-in & payments"
      exit for loop if  ${element}== True
    END

turn on unlocking your phone
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Unlock your phone"
      run keyword if  ${element} == False    turn on face service "Unlock your phone"
      exit for loop if  ${element}== True
    END

add a gmail account
    scroll down to "Accounts"
    click "Passwords & accounts" in Settings
    click "Add account" in Settings
    click "Google" in Settings
    sleep  2 seconds

should display re-enter your PIN page
    Wait Until Page Contains Element    //android.widget.TextView[@text='Re-enter your PIN']    ${timeOutSeconds}

turn on face service "${instance}"
    wait and click1 "//android.widget.TextView[@text='${instance}']/../..//android.widget.Switch[@checked='false']"
    Wait Until Page Contains Element    //android.widget.TextView[@text='${instance}']/../..//android.widget.Switch[@checked='true']   ${timeOutSeconds}

should dipslay face auth screen
    Wait Until Page Contains Element    //android.widget.ImageView[@content-desc='Tap to cancel authentication']    ${timeOutSeconds}

re-enroll face
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page

swip up to unlock screen
    Swipe up lock screen
    should display enter pin page
    re-enter pin

turn off Skip lock screen
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Skip lock screen"
      run keyword if  ${element} == True    turn off face service "Skip lock screen"
      exit for loop if  ${element}== False
    END

turn on Skip lock screen
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Skip lock screen"
      run keyword if  ${element} == False    turn on face service "Skip lock screen"
      exit for loop if  ${element}== True
    END

is AOD on
    scroll down to "Always show time and info"
    Wait Until Page Contains Element    //android.widget.TextView[@text='Always show time and info']/../..//android.widget.Switch[@checked='true']      ${timeOutSeconds}

is screen attention on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Screen attention']/../..//android.widget.Switch[@checked='true']      ${timeOutSeconds}

is auto rotate on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use auto-rotate']/../..//android.widget.Switch[@checked='true']      ${timeOutSeconds}

is face detection on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Face Detection']/../..//android.widget.Switch[@checked='true']      ${timeOutSeconds}

is unlocking your phone on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Unlock your phone']/../..//android.widget.Switch[@checked='true']      ${timeOutSeconds}

turn unlocking your phone off
    click element    //android.widget.TextView[@text='Unlock your phone']/../..//android.widget.Switch[@checked='true']
    Wait Until Page Contains Element    //android.widget.TextView[@text='Unlock your phone']/../..//android.widget.Switch[@checked='false']      ${timeOutSeconds}

turn on AOD
    scroll down to "Always show time and info"
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is AOD on
      run keyword if  ${element} == False    click AOD Switch to turn on
      exit for loop if  ${element}== True
    END

turn on screen attention
    scroll down to "Screen attention"
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is screen attention on
      run keyword if  ${element} == False    click screen attention to turn on
      exit for loop if  ${element}== True
    END

turn on auto rotate
    scroll down to "Use auto-rotate"
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is auto rotate on
      run keyword if  ${element} == False    click use auto rotate to turn on
      exit for loop if  ${element}== True
    END

turn on face detection
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Use auto-rotate" visible
      run keyword if  ${element} == True    turn on auto rotate
      exit for loop if  ${element}== False
    END

    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is face detection on
      run keyword if  ${element} == False    click enable face detection to turn on
      exit for loop if  ${element}== True
    END

click AOD Switch to turn on
    click element   //android.widget.TextView[@text='Always show time and info']/../..//android.widget.Switch[@checked='false']

click screen attention to turn on
    click element   //android.widget.TextView[@text='Screen attention']/../..//android.widget.Switch[@checked='false']

click screen attention to turn off
    click element   //android.widget.TextView[@text='Screen attention']/../..//android.widget.Switch[@checked='true']

click use auto rotate to turn on
    click element   //android.widget.TextView[@text='Use auto-rotate']/../..//android.widget.Switch[@checked='false']
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use auto-rotate']/../..//android.widget.Switch[@checked='true']  ${timeOutSeconds}

click enable face detection to turn on
    click element   //android.widget.TextView[@text='Face Detection']/../..//android.widget.Switch[@checked='false']
    Wait Until Page Contains Element    //android.widget.TextView[@text='Face Detection']/../..//android.widget.Switch[@checked='true']  ${timeOutSeconds}

click enable face detection to turn off
    click element   //android.widget.TextView[@text='Face Detection']/../..//android.widget.Switch[@checked='true']
    Wait Until Page Contains Element    //android.widget.TextView[@text='Face Detection']/../..//android.widget.Switch[@checked='false']  ${timeOutSeconds}

turn off AOD
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is AOD on
      run keyword if  ${element} == True    click AOD Switch to turn off
      exit for loop if  ${element}== False
    END

turn off screen attention
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is screen attention on
      run keyword if  ${element} == True    click screen attention to turn off
      exit for loop if  ${element}== False
    END

turn off face detection
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is face detection on
      run keyword if  ${element} == True    click enable face detection to turn off
      exit for loop if  ${element}== False
    END

turn off unlocking your phone
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Unlock your phone"
      run keyword if  ${element} == True    turn unlocking your phone off
      exit for loop if  ${element}== False
    END

click AOD Switch to turn off
    click element   //android.widget.TextView[@text='Always show time and info']/../..//android.widget.Switch[@enabled='true']

should display unlock screen
    Wait Until Page Contains Element       id=com.android.systemui:id/lock_icon    ${timeOutSeconds}

should display security page
    Wait Until Page Contains Element        accessibility_id=Security    ${timeOutSeconds}

turn off always require confirmation
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Always require confirmation"
      run keyword if  ${element} == True    turn off face service "Always require confirmation"
      exit for loop if  ${element}== False
    END

turn on always require confirmation
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is Face Unlock service on "Always require confirmation"
      run keyword if  ${element} == False    turn on face service "Always require confirmation"
      exit for loop if  ${element}== True
    END

should not display Always require confirmation option
    Wait Until Page Contains Element    //android.widget.Button[@text='Delete face model']    ${timeOutSeconds}
    page should not contain element    //android.widget.TextView[@text='Always require confirmation']

should display sign in account page
    Wait Until Page Contains Element    //android.view.View[@text='Sign in']    ${timeOutSeconds}

click use screen lock button
    wait and click1 "//android.widget.Button[@text='Use PIN']"

delete face data if enrolled
    scroll down to "More security settings"
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is "Face added" visible
      run keyword if  ${element} == True    click "Face & Fingerprint Unlock" in Settings
      run keyword if  ${element} == True    re-enter screen lock
      run keyword if  ${element} == True    click "Face Unlock" in Settings
      run keyword if  ${element} == True    delete face data
      run keyword if  ${element} == True    face data should be deleted
      run keyword if  ${element} == True    click back button
      exit for loop if  ${element}== False
    END


delete and re-enroll face via accessibility mode for 5 times
    FOR  ${index}  IN RANGE  0  5
      click "Set up Face Unlock" button
      click "I agree" at set up Face Unlock page
      click setup for limited vision or head motion ImageButton
      click "Start" at how to set up Face Unlock page
      go to accessibility enroll face page
      should display looks good page
      display Face Unlock detailed page after enrollment
      delete face data
    END

click setup for limited vision or head motion ImageButton
    Wait Until Page Contains Element    id=com.android.settings:id/accessibility_button    ${timeOutSeconds}
    Click Element   id=com.android.settings:id/accessibility_button

should display non-accessibility enroll page
    should display how to set up Face Unlock page
    Wait Until Page Contains Element    id=com.android.settings:id/illustration_default    ${timeOutSeconds}

should display clean screen message
    Wait Until Page Contains Element    //android.widget.TextView[contains(@text,'Clean the top of your screen, including the black bar')]    ${timeOutSeconds}

turn on show lockdown option
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is show lockdown option off
      run keyword if  ${element} == True    turn on show lockdown
      exit for loop if  ${element}== False
    END

turn on show lockdown
    wait and click1 "//android.widget.Switch[@checked='false']/../..//android.widget.TextView[@text='Show lockdown option']"

is show lockdown option off
    Page Should Contain Element    //android.widget.Switch[@checked='false']/../..//android.widget.TextView[@text='Show lockdown option']

should display power off menu
    Wait Until Page Contains Element    //android.widget.TextView[@text='Power off']    ${timeOutSeconds}
    Wait Until Page Contains Element    //android.widget.TextView[@text='Restart']    ${timeOutSeconds}

tap lockdown icon
    long press power key
    sleep  0.5
    should display power off menu
    wait and click1 "//android.widget.RelativeLayout[@content-desc='Menu']"
    wait and click1 "//android.widget.TextView[@text='Lockdown']"

should not peform Face Unlock
    Wait Until Page Contains Element    //android.widget.TextView[@resource-id='com.android.systemui:id/default_clock_view']    ${timeOutSeconds}
    Page Should Not Contain Element  //android.widget.TextView[@text='Swipe up to open']

should display Can't continue setup after 45 seconds
    Sleep  13
    Wait Until Page Contains Element    //android.widget.TextView[@text='Can’t continue setup']     ${timeOutSeconds}

click "${button}" on Can't continue setup pop up
    wait and click1 "//android.widget.Button[@text='${button}']"

should display Face Unlock setup finished after 75 seconds
    Sleep  43
    Wait Until Page Contains Element    //android.widget.TextView[@text='Face Unlock is set up']     ${timeOutSeconds}

click "${button}" on Face Unlock setup finished pop up
    wait and click1 "//android.widget.Button[@text='${button}']"

Face Unlock successfully
    Press Keycode   26
    sleep  0.5
    Press Keycode   26
    sleep  0.5
    Page Should Not Contain Element     id=com.android.systemui:id/clock_view

should not display Always require confirmation
    Page Should Not Contain Element     //android.widget.TextView[@text='Always require confirmation']

use Face Unlock for "${option}" should be on
    Wait Until Page Contains Element    //android.widget.TextView[@text='${option}']/../..//android.widget.Switch[@checked='true']     ${timeOutSeconds}

use Face Unlock for "${option}" should be off
    Wait Until Page Contains Element    //android.widget.TextView[@text='${option}']/../..//android.widget.Switch[@checked='false']     ${timeOutSeconds}

reboot device
    run process     adb  reboot     shell=True      timeout=60s
    sleep  40 seconds


should display enter pin page
    Wait Until Page Contains Element    id=com.android.systemui:id/pinEntry     ${timeOutSeconds}

should display enter password page
    Wait Until Page Contains Element    id=com.android.systemui:id/passwordEntry     ${timeOutSeconds}

should display enter pattern page
    Wait Until Page Contains Element    id=com.android.systemui:id/lockPatternView     ${timeOutSeconds}

scroll up to search settings
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is screen locked
      run keyword if  ${element} == True   swipe up and unlock
      exit for loop if  ${element}== False
    END
    FOR  ${index}  IN RANGE  0  5
      ${element}  run keyword and return status    is "Search settings" visible
      run keyword if  ${element} == False    scroll up
      exit for loop if  ${element}== True
    END

is screen locked
    Page Should Contain Element    id=com.android.systemui:id/lock_icon

swipe up and unlock
    Swipe up lock screen
    re-enter pin

should display "${featureName}" detailed page
    Wait Until Page Contains Element    //android.widget.ImageButton[@content-desc='Navigate up']/..//android.widget.TextView[@text='${featureName}']   ${timeOutSeconds}
    click back button

should display lock screen detailed page
    Wait Until Page Contains Element    //android.widget.FrameLayout[@content-desc='Lock screen']    ${timeOutSeconds}

should display screen timeout page
    Wait Until Page Contains Element    accessibility_id=Screen timeout    ${timeOutSeconds}

should display use Auto-rotate page
    Wait Until Page Contains Element    accessibility_id=Auto-rotate screen    ${timeOutSeconds}

subtitle should be use your face to unlock your phone
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use your face to unlock your phone']    ${timeOutSeconds}

description should contain Using your face to unlock your phone may be less secure
    Wait Until Page Contains Element    //android.widget.TextView[@text='Using your face to unlock your phone may be less secure than a strong pattern, PIN, or password']    ${timeOutSeconds}

is wifi hotspot on
    Wait Until Page Contains Element    //android.widget.TextView[@text='Use Wi‑Fi hotspot']/../android.widget.Switch[@checked='true']    ${timeOutSeconds}

turn on hotspot
    click element   //android.widget.TextView[@text='Use Wi‑Fi hotspot']/../android.widget.Switch[@checked='false']
    Wait Until Page Contains element    //android.widget.TextView[@text='Use Wi‑Fi hotspot']/../android.widget.Switch[@checked='true']    ${timeOutSeconds}

turn off hotspot
    wait and click1 "//android.widget.TextView[@text='Use Wi‑Fi hotspot']/../android.widget.Switch[@checked='true']"
    Wait Until Page Contains element    //android.widget.TextView[@text='Use Wi‑Fi hotspot']/../android.widget.Switch[@checked='false']    ${timeOutSeconds}

turn on wifi hotspot
    FOR  ${index}  IN RANGE  0  1
      ${element}  run keyword and return status    is wifi hotspot on
      run keyword if  ${element} == False    turn on hotspot
      exit for loop if  ${element}== True
    END

turn off "${functionName}"
    Wait Until Page Contains Element  //android.widget.TextView[@text='${functionName}']/../..//android.widget.Switch[@checked='true']        ${timeOutSeconds}
    click element    //android.widget.TextView[@text='${functionName}']/../..//android.widget.Switch[@checked='true']

turn on "${functionName}"
    Wait Until Page Contains Element  //android.widget.TextView[@text='${functionName}']/../..//android.widget.Switch[@checked='false']       ${timeOutSeconds}
    click element    //android.widget.TextView[@text='${functionName}']/../..//android.widget.Switch[@checked='false']

"${functionName}" should be on
    Wait Until Page Contains Element    //android.widget.TextView[@text='${functionName}']/..//android.widget.TextView[@text='On']        ${timeOutSeconds}

"${functionName}" should be off
    Wait Until Page Contains Element    //android.widget.TextView[@text='${functionName}']/..//android.widget.TextView[@text='Off']        ${timeOutSeconds}

should display guidance animation
    Wait Until Page Contains Element  id=com.android.settings:id/illustration_lottie        ${timeOutSeconds}

should display looks good page
    Wait Until Page Contains Element    //android.widget.TextView[@text='Looks good!']     ${timeOutSeconds}
    Wait Until Page Contains Element    id= com.android.settings:id/sud_layout_subtitle        ${timeOutSeconds}
    wait and click1 "//android.widget.Button[@text='Done']"

disable USB charging
    run process     ${batteryUnplug}    shell=True    timeout=5s

enable USB charging
    run process     ${batteryReset}    shell=True    timeout=5s

push music file into device
    run process     ${pushMusicFile}    shell=True    timeout=5s

play music
    FOR  ${index}  IN RANGE  0  3
      ${element}  run keyword and return status    is "Allow" button visible
      run keyword if  ${element} == True    click "Allow" button
      exit for loop if  ${element}== False
    END

    wait and click1 "//android.widget.TextView[@text='Audio']"
    FOR  ${index}  IN RANGE  0  5
      ${element}  run keyword and return status    is "The_world_revolution.mid" visible
      run keyword if  ${element} == False    click back button
      run keyword if  ${element} == False    wait and click1 "//android.widget.TextView[@text='Audio']"
      exit for loop if  ${element}== True
    END
    wait and click1 "//android.widget.TextView[@text='The_world_revolution.mid']"
    Wait Until Page Contains Element    id=com.google.android.apps.nbu.files:id/play_pause        ${timeOutSeconds}

should display music playing page
    Wait Until Page Contains Element    id=com.google.android.apps.nbu.files:id/play_pause        ${timeOutSeconds}

stop playing music
    click element    id=com.google.android.apps.nbu.files:id/play_pause
    Wait Until Page Contains Element    accessibility_id=Play        ${timeOutSeconds}