from selenium import webdriver
from selenium.webdriver.common.keys import Keys
import time

#This selenium script is part of a series to an application with a generic Django
# backend. This navigate to our admin login page and directs to the todo file.
#This is one script that is part of a series of scripts, and only tests on a
#firefox browser. This will also write to the file labelled: Access_Script.txt
#Author: Ashley Mains, CSCI4800: Research, Professor: Angkul K
File_object = open(r"/home/user/Scripts/ReactSeleniumScripts/Script_Results/Access_Script.txt", "a+")
print("Beginning Selenium test: Access Script, please wait...")
File_object.write("Beginning Selenium test: Access Script, please wait...\n")

####arbitrary code to test selenium###
#driver1 = webdriver.Firefox()
#driver1.get("http://35.227.36.86:8000/")
#time.sleep(3)
#driver1.close()
####End arbitrary code#####

siteInformation = ["http://35.227.36.86:8000/admin","ToDoAdmin","Swimming!"]
File_object.write("Test run on the follow site information:\n")
for info in siteInformation:
    File_object.write(info)
    File_object.write("\n")
#File_object.writelines(siteInformation)
File_object.write("\n")

#Create Driver
driver2 = webdriver.Chrome('/home/user/chromedriver')
driver2.get(siteInformation[0])
#usernameArea =
driver2.find_element_by_id("id_username").send_keys(siteInformation[1])
#passwordArea =
driver2.find_element_by_id("id_password").send_keys(siteInformation[2])
#passwordArea.send_keys(siteInformation[2])

#authenticate
driver2.find_element_by_id('login-form').submit()
time.sleep(2)

#if authenticated:
if driver2.find_element_by_css_selector("#user-tools > a:nth-child(4)"):
    File_object.write("Authentication Successful\n")
    #navigate to developer created view todo
    File_object.write("Navigating to developer created module: ToDo") #change mod name as necessary
    driver2.find_element_by_css_selector('.model-todo > th:nth-child(1) > a:nth-child(1)').click()
    #grab element to confirm in correct location
    if driver2.find_element_by_css_selector(".addlink"):
        File_object.write("\nNavigation successful")
    #if NOT navigated to correct page
    #need catch


#if NOT authenticated:
# File_object.write("Authentication NOT Successful\n Error code: ")
#use try catch error with NoSuchElementException. Implementation here:
#https://stackoverflow.com/questions/9567069/python-selenium-webdriver-checking-element-exists

#time.sleep(2)
driver2.close()
driver2.quit()
###MORE arbitrary code###
#driver3 = webdriver.Firefox()
#driver3.get("http://35.227.36.86:8000/admin/todo/todo")
#time.sleep(3)
#driver3.close()
###end MORE arb###

print("Test is Done.")
time.sleep(1)
File_object.close()
print("File Closed")
