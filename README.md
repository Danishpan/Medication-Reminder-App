# Medication-Reminder-App
Ladies and Gentlemen,
Please welcome this very new and sophisticated application, which will become your unreplaceable partner in life. 

With this app, you may not worry about forgetting to take a pill, because it will always send you notification about it with all that care and love. 


<img src="https://user-images.githubusercontent.com/59646451/183848829-b6aaf6a7-8d0b-4547-9c6e-5e5740339bd7.png" width="20%" height="20%">


This is how main screen looks like. Nothing complex, just you, your list of pills and thats it. There you can clearly see the exact name of medicine you taken, time, at which notification will pop up everyday and you also have a feature of keeping statistics of how many pills were already taken.


<img src="https://user-images.githubusercontent.com/59646451/183848837-7fa81a39-60c6-4b55-8bf4-5a5cac27ca20.png" width="20%" height="20%">



By clicking on "Add med" button new screen opens, where you may create new medicine and add it to your list. This screen contains of textfield, which sends value to viewmodel straight and datepicker, limited to time only, which saves value in Date format, then we convert it to DateComponents and send to the same viewmodel. By pressing return on keyboard or clicking save button, firstly new model is getting saved and then new request to schedule local push notification is being sent.
To implement function of sending notification, simple singleton based notification manager template was used. The reason of that is to use local push notification in simple apps like ours, we may have only one instance of notification manager and use its methods.


<img src="https://user-images.githubusercontent.com/59646451/183848841-b4d29a7b-acda-4240-b3be-890b0ce7579a.png" width="20%" height="20%">
<img src="https://user-images.githubusercontent.com/59646451/183848859-d44cf616-2bc9-4fd6-b538-1306ecacf116.png" width="20%" height="20%">


Then new item was added to main screen list and we may minimize application so we'll be able to receive pop ups



<img src="https://user-images.githubusercontent.com/59646451/183852499-57d2679c-c6d6-4a5a-a1c7-c0dbf0818a4c.png" width="20%" height="20%">


As we can see from the previous screenshot, notification shows up at exact time we set it up.


<img src="https://user-images.githubusercontent.com/59646451/183848871-aa6815e5-dc9b-4dad-a20d-d2d477c0c633.png" width="20%" height="20%">


By the requirements of application, small portion of statistics were needed to be presented. According to the app logic, it was implemented in the following way: as we may not be sure if after receiveing notification, user surely takes a pill, feature of manually increment number of medicine taken was added.


Wrapping up: this application covers all the requirements provided in task description, including creating med, receiving notification to take it, observe a list of meds and some sort of statistics. Moreover, app was built with provided technical limitations, so MVVM architecture was used, and instead of storyboards/xibs SwiftUI was responsible for creating interface elements.

Things to be improved: for this moment, after shutting down application, the list disappear as it does not store at phone or any database. To fix that, CoreData may be used, so all information will be located on the device and will not be missed.
