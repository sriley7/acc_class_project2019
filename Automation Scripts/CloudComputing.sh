#!/bin/bash
#creates the php test environment.
/home/user/Scripts/thisworks.sh test-php

#run the selenium script to test the create new account feature.
python3 /home/user/Scripts/TestPhp.py

#deletes the php test environment.
gcloud compute instances delete test-php

#creates a fresh react test environment
/home/user/Scripts/Todo.sh test-react

#tests adding a task through the react interface.
python3 /home/user/Scripts/ReactSeleniumScripts/AddTaskReact.py

#displays the test results
cat /home/user/Scripts/ReactSeleniumScripts/Script_Results/Add_Task_Script_React.txt

#deletes the react test environment.
gcloud compute instances delete test-react

#creates a fresh react test environment
/home/user/Scripts/Todo.sh test-react

#tests accessing the Django backend
python3 /home/user/Scripts/ReactSeleniumScripts/DjangoAccessScript.py

#displays the test results
cat /home/user/Scripts/ReactSeleniumScripts/Script_Results/Access_Script.txt

#deletes the react test environment.
gcloud compute instances delete test-react

#creates a fresh react test environment
/home/user/Scripts/Todo.sh test-react

#tests adding a task from the Django backend
python3 /home/user/Scripts/ReactSeleniumScripts/DjangoAddTask.py

#displays the test results.
cat /home/user/Scripts/ReactSeleniumScripts/Script_Results/Add_Task_Script.txt

#deletes the react test environment.
gcloud compute instances delete test-react

echo "Demonstration Complete!"






