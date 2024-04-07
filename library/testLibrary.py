# coding=utf-8
from appium.webdriver.common.touch_action import TouchAction
from robot.libraries.BuiltIn import BuiltIn






class testLibrary:

    def draw_Lock_Pattern(self, x1, y1, x2, y2, x3, y3):
        driver = BuiltIn().get_library_instance('AppiumLibrary')._current_application()
        action = TouchAction(driver)
        action.press(x=x1, y=y1).move_to(x=x2, y=y2).move_to(
            x=x3, y=y3).release().perform()