*** Variables ***
${timeOutSeconds}               5
${platformName}                 Android
${platformVersion}              13
${deviceName}                   Floral
${automationName}               UiAutomator2
${systemPort}                   8200
${appiumServer}                 http://localhost:4723/wd/hub
${settingsAppPackageName}       com.android.settings
${settingsAppActivityName}      Settings
${setupWizardAppPackageName}    com.google.android.setupwizard
${setupWizardAppActivityName}   SetupWizardActivity
${cameraAppPackageName}         com.google.android.GoogleCamera
${cameraAppActivityName}        com.android.camera.CameraLauncher
${demoAppPackageName}           com.example.android.biometric
${demoAppActivityName}          BiometricPromptDemo
${calendarAppPackageName}       com.google.android.calendar
${calendarAppActivityName}      com.android.calendar.AllInOneActivity
${LauncherAppPackageName}       com.google.android.apps.nexuslauncher
${LauncherAppActivityName}      NexusLauncherActivity
${cameraAppPackageName}         com.google.android.GoogleCamera
${cameraAppActivityName}        com.android.camera.CameraLauncher
${clockAppPackageName}          com.google.android.deskclock
${clockAppActivityName}         com.android.deskclock.DeskClock
${chromeAppPackageName}         com.android.chrome
${chromeAppActivityName}        com.google.android.apps.chrome.Main
${filesAppPackageName}          com.google.android.apps.nbu.files
${filesAppActivityName}         home.HomeActivity
${pin}                          1234
${password}                     1234
${unlockType}                   pattern
${unlockKey}                    14789
${batteryUnplug}                adb shell dumpsys battery unplug
${batteryReset}                 adb shell dumpsys battery reset
${pushMusicFile}                adb push ../test_file/The_world_revolution.mid /sdcard/Music
${logcat}                       adb logcat -d | grep android.hardware.biometrics.face-service