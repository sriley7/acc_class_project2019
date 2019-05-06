from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.common.exceptions import NoSuchElementException
import time

#This selenium script is part of a series to an application with a generic Django
# backend. This navigate to our admin login page, direct to the todo file, and add a task
#This is one script that is part of a series of scripts, and only tests on a
#firefox browser. This will also write to the file labelled: Access_Script.txt
#Author: Ashley Mains, CSCI4800: Research, Professor: Angkul K
File_object = open(r"/home/user/Scripts/ReactSeleniumScripts/Script_Results/Add_Task_Script_React.txt", "a+")
print("Beginning Selenium test: Access Script, please wait...")
File_object.write("\n\nBeginning Selenium test: Access Script, please wait...\n")

####arbitrary code to test selenium###
#driver1 = webdriver.Firefox()
#driver1.get("http://35.227.36.86:8000/")
#time.sleep(3)
#driver1.close()
####End arbitrary code#####

siteInformation = ["http://35.227.36.86:3000","Create D Script","Need to create selenium script for Django backend to test add and removing tasks"]
File_object.write("Test run on the following information:\n")
for info in siteInformation:
    File_object.write(info)
    File_object.write("\n")
#File_object.writelines(siteInformation)
File_object.write("\n")

#Create Driver
driver2 = webdriver.Chrome('/home/user/chromedriver')
#driver2 = webdriver.Firefox()
driver2.get(siteInformation[0])
#usernameArea =
driver2.find_element_by_css_selector("html body div#root main.content div.row div.col-md-6.col-sm-10.mx-auto.p-0 div.card.p-3 div button.btn.btn-primary").click()
time.sleep(2)
driver2.find_element_by_css_selector("div.form-group:nth-child(1) > input:nth-child(2)").send_keys(siteInformation[1])
#passwordArea =
time.sleep(2)
driver2.find_element_by_css_selector("div.form-group:nth-child(2) > input:nth-child(2)").send_keys(siteInformation[2])
#passwordArea.send_keys(siteInformation[2])
time.sleep(2)
driver2.find_element_by_css_selector(".btn-success").click()

time.sleep(2)
#Refresh page
driver2.refresh()
try:
    if (driver2.find_element_by_link_text(siteInformation[1])):
        File_object.write("\n Successful in adding task on React Application")

except NoSuchElementException as e:
    print("Exception occurred see txt file for more information")
    fileErrorObject = open(r"Script_Results\Add_Task_Script_React.txt", "a+")
    fileErrorObject.write(str(e))

time.sleep(2)
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
