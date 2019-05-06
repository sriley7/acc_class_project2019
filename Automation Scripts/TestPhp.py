import time
from selenium.webdriver.common.keys import Keys
from selenium import webdriver

f= open("/home/user/Scripts/outputIP/outphp.txt","r")

if f.mode == "r":
	contents = f.read()
	
url = "http://"+contents+"/sqlsecure/login.php"


browser = webdriver.Chrome('/home/user/chromedriver')
type(browser)

browser.get(url)

time.sleep(3)

create = browser.find_element_by_link_text('Sign up')

create.click()

user = browser.find_element_by_name('username')

user.send_keys('freddy')

time.sleep(1)

email = browser.find_element_by_name('email')

email.send_keys('freddy@clayton.edu')

time.sleep(1)

pw = browser.find_element_by_name('password_1')

pw.send_keys('Swimming!')

time.sleep(1)

pw2 = browser.find_element_by_name('password_2')

pw2.send_keys('Swimming!')

time.sleep(1)

sub = browser.find_element_by_name('reg_user')

sub.click()

message = browser.find_element_by_class_name("error")

errormessage = "User was not created, check connection to SQL database"

print(errormessage)

time.sleep(10)

browser.close()





