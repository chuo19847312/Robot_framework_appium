*** Settings ***
Library                 AppiumLibrary
Library                 Process
Library                 ../library/testLibrary.py
resource                ../keywords/commonKeywords.robot
resource                ../keywords/settingsKeyword.robot
resource                ../variables/variables.robot



suite setup     Launch settings
suite teardown  close settings
test setup      click "Security" in Settings
test teardown   go back to settings




*** Test case ***
1.26.2 Faceauth default settings
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    use face unlock for "Unlock your phone" should be on
    use face unlock for "Verify it’s you in apps" should be on
    click "Face Unlock" in Settings
    use face unlock for "Skip lock screen" should be off
    use face unlock for "Require eyes to be open" should be on
    should not display Always require confirmation

1.2.1 Face Unlock setup with skipping Face Unlock setup in setup wizard
    [Tags]  P0
    set up screen lock pin code
    click "Face & Fingerprint Unlock" in Settings
    re-enter pin code
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.2.4 Face Unlock setup with the combination of "Face Unlock + Password"
    [Tags]  P0
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "Password"
    to use Face Unlock, set Password as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.2.3 Face Unlock setup with the combination of "Face Unlock + Pattern"
    [Tags]  P0
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "Pattern"
    to use Face Unlock, set Pattern
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.2.6 Cancel Face Unlock setup
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Cancel" at how to set up Face Unlock page
    click back button
    should skip face authentication set up

1.2.7 Repeatly Face setup flow and unlock device
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    delete face data
    delete and re-enroll face for 5 times

1.2.2 Face Unlock setup with the combination of "Face Unlock + PIN"
    [Tags]  P0
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.3.1 Unlocking the phone with enrolled face from AODlocked state to Home screen
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    turn off Skip lock screen
    suspend/resume screen to trigger Face Unlock
    should display unlock screen
    Swipe up lock screen
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    turn on Skip lock screen
    suspend/resume screen to trigger Face Unlock
    should display security page

1.4.1 Face unlock setup - Setup flow education
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    should display guidance animation
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page

1.5.1 Face Unlock setup after "Delete face data" (Re-enrollment)
    [Tags]  P2  reg  Daily  P10
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    face data should be deleted
    suspend/resume screen to trigger Face Unlock
    swip up to unlock screen
    re-enroll face

1.5.2 Face Unlock setup after reset screen lock (Re-enrollment)
    [Tags]  P2
    remove screen lock
    suspend/resume screen to trigger Face Unlock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.6.1 Face Unlock setup with AOD enable/disable
    [Tags]  P3
    click back button
    click "Display" in Settings
    click "Lock screen" in Settings
    turn on AOD
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    go back to settings
    click "Display" in Settings
    click "Lock screen" in Settings
    turn off AOD
    go back to settings
    click "Security" in Settings
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.6.3 Unlocking the phone with AOD enable/disable
    [Tags]  P1
    click back button
    click "Display" in Settings
    click "Lock screen" in Settings
    turn on AOD
    suspend/resume screen to trigger Face Unlock
    should display lock screen detailed page
    turn off AOD
    suspend/resume screen to trigger Face Unlock
    should display lock screen detailed page

1.6.2 Face unlock setup with "Screen attention" enable
    [Tags]  P1
    click back button
    click "Display" in Settings
    click "Screen timeout" in Settings
    turn on screen attention
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    go back to settings
    click "Display" in Settings
    click "Screen timeout" in Settings
    turn off screen attention
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.6.4 Unlocking the phone with "Screen attention" enable
    [Tags]  P1
    click back button
    click "Display" in Settings
    click "Screen timeout" in Settings
    turn on screen attention
    suspend/resume screen to trigger Face Unlock
    should display screen timeout page
    turn off screen attention
    suspend/resume screen to trigger Face Unlock
    should display screen timeout page

1.6.5 Face unlock setup with Face Detection is ON
    [Tags]  P3
    click back button
    click "Display" in Settings
    click "Auto-rotate screen" in Settings
    turn on face detection
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    go back to settings
    click "Display" in Settings
    click "Auto-rotate screen" in Settings
    turn off face detection
    go back to settings
    click "Security" in Settings
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment

1.6.6 Unlocking the phone with Face detection is ON
    [Tags]  P3
    click back button
    click "Display" in Settings
    click "Auto-rotate screen" in Settings
    turn on face detection
    suspend/resume screen to trigger Face Unlock
    should display use Auto-rotate page
    turn off face detection
    suspend/resume screen to trigger Face Unlock
    should display use Auto-rotate page

1.7.1 Face Unlock setup with device enable hotspot & 1.7.3 Unlocking the phone with device enable hotspot
    [Tags]  P3
    click back button
    scroll up to "Network & internet"
    click "Network & internet" in Settings
    click "Hotspot & tethering" in Settings
    click "Wi‑Fi hotspot" in Settings
    turn on wifi hotspot
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page
    go back to settings
    scroll up to "Network & internet"
    click "Network & internet" in Settings
    click "Hotspot & tethering" in Settings
    click "Wi‑Fi hotspot" in Settings
    turn off hotspot

1.8.1 Face Unlock setup with/without connecting to Wi-Fi & 1.8.3 Unlocking the phone with/without connecting to Wi-Fi
    [Tags]  P3
    turn off wifi and data
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page
    turn on wifi
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page

1.8.2 Face Unlock setup with/without connecting to Mobile data & 1.8.4 Unlocking the phone with/without connecting to Mobile data
    [Tags]  P3
    turn off wifi and data
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page
    turn on data connection
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page

1.11.3 Face unlock setup under battery saver mode & 1.11.6 Unlocking the phone under battery saver mode
    [Tags]  P1
    click back button
    scroll up to "Battery"
    click "Battery" in Settings
    click "Battery Saver" in Settings
    disable USB charging
    turn on "Use Battery Saver"
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page
    enable USB charging

1.25.2 Enable/Disable "Unlocking your phone"
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    turn off unlocking your phone
    suspend/resume screen to trigger Face Unlock
    Swipe up lock screen
    should display enter pin page
    re-enter pin
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    turn on unlocking your phone
    suspend/resume screen to trigger Face Unlock
    should display security page

1.25.4 Enable/Disable "Skip lock screen"
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    turn off Skip lock screen
    suspend/resume screen to trigger face unlock
    should display unlock screen
    Swipe up lock screen
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    turn on Skip lock screen
    suspend/resume screen to trigger face unlock
    should display security page

1.25.5 Enable/Disable "Always require confirmation"
    [Tags]  P0
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    should not display Always require confirmation option

1.14.1 Face unlock setup with enable limited head motion
    [Tags]  P0
    delete face data if enrolled
    click "Face Unlock" in Settings
    click "I agree" at set up face unlock page
    click "Setup for limited vision or head motion" at how to set up face unlock page
    click "Start" at how to set up Face Unlock page
    go to accessibility enroll face page
    should display looks good page
    suspend/resume screen to trigger Face Unlock
    should display security page

1.14.3 Accessiblity option during face enrollment flow & 1.14.6 Unlocking the phone with enrollment by limited head motion
    [Tags]  P0
    delete face data if enrolled
    click "Face Unlock" in Settings
    click "I agree" at set up face unlock page
    click "Setup for limited vision or head motion" at how to set up face unlock page
    setup for limited vision or head motion should be on
    click "Start" at how to set up Face Unlock page
    go to accessibility enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    suspend/resume screen to trigger Face Unlock
    should display security page

1.14.4 Disable "Use accessibility face unlock" during accessibility flow
    [Tags]  P0
    delete face data if enrolled
    click "Face Unlock" in Settings
    click "I agree" at set up face unlock page
    click "Setup for limited vision or head motion" at how to set up face unlock page
    setup for limited vision or head motion should be on
    turn off setup for limited vision or head motion
    should display non-accessibility animation

1.26.13 Biometrics level string check
    [Tags]  P3
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    subtitle should be use your face to unlock your phone
    scroll down to "Using your face to unlock your phone may be less secure than a strong pattern, PIN, or password"
    description should contain Using your face to unlock your phone may be less secure

1.26.3 Face setup timeout error with 0 bucket acquisition
    [Tags]  P1
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display Can't continue setup after 45 seconds
    click "Try again" on Can't continue setup pop up
    should display Can't continue setup after 45 seconds
    click "Try fast setup" on Can't continue setup pop up
    go to accessibility enroll face page

1.26.4 Face setup timeout error with 1+ bucket acquisition
    [Tags]  P1
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display Face Unlock setup finished after 75 seconds
    click "Try again" on Face Unlock setup finished pop up
    go to enroll face page
    should display Face Unlock setup finished after 75 seconds
    click "OK" on Face Unlock setup finished pop up
    should display looks good page
    suspend/resume screen to trigger face unlock
    should display security page

1.26.17 Reset "Lift to wake" and "Tap to wake" after Face unlock enrolled
    [Tags]  P2
    click back button
    scroll up to "Display"
    click "Display" in Settings
    click "Lock screen" in Settings
    click "Tap to check phone" in Settings
    turn off "Tap to check phone"
    click back button
    click "Lift to check phone" in Settings
    turn off "Lift to check phone"
    go back to settings
    click "Security" in Settings
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    go back to settings
    scroll up to "Display"
    click "Display" in Settings
    click "Lock screen" in Settings
    scroll down to "Wake screen for notifications"
    "Tap to check phone" should be on
    "Lift to check phone" should be on

    go back to settings
    click "Security" in Settings
    remove screen lock
    click "Face & Fingerprint Unlock" in Settings
    choose screen lock "PIN"
    to use Face Unlock, set PIN as "1234"
    click "Face Unlock" in Settings
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    go back to settings
    scroll up to "Display"
    click "Display" in Settings
    click "Lock screen" in Settings
    scroll down to "Wake screen for notifications"
    "Tap to check phone" should be on
    "Lift to check phone" should be on

    click "Tap to check phone" in Settings
    turn off "Tap to check phone"
    click back button
    click "Lift to check phone" in Settings
    turn off "Lift to check phone"
    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    go back to settings
    scroll up to "Display"
    click "Display" in Settings
    click "Lock screen" in Settings
    scroll down to "Wake screen for notifications"
    "Tap to check phone" should be on
    "Lift to check phone" should be on

    go back to settings
    click "Security" in Settings
    click "Face & Fingerprint Unlock" in Settings
    re-enter screen lock
    click "Face Unlock" in Settings
    delete face data
    click "Set up Face Unlock" button
    click "I agree" at set up Face Unlock page
    click "Start" at how to set up Face Unlock page
    go to enroll face page
    should display looks good page
    display Face Unlock detailed page after enrollment
    go back to settings
    scroll up to "Display"
    click "Display" in Settings
    click "Lock screen" in Settings
    scroll down to "Wake screen for notifications"
    "Tap to check phone" should be on
    "Lift to check phone" should be on

1.17.1 Validating notification of "Ongoing"activity like music playing on the device
    [Tags]  P3
    push music file into device
    Launch files
    play music
    suspend/resume screen to trigger face unlock
    should display music playing page
    stop playing music
    switch application "SettingsApp"
