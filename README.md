# recreate
Recreate App from Apple Developer Academy final project.
This is an app that is intended to help people change their habits around social media.

ToDo:
Prior to test flight:
ContentView needs to be updated with the proper UserActivity name and prompt at the appropriate time. \n
A picker needs to be added to TimeAndSnark to allow the user to set the amount of time they spend on social media per day.
The progress gauges need to be updated to reflect the user's daily social media time and the amount of time they do suggested activities.
A function needs to be written to reset the social media and recreate time every day. 
All debugging print statements and buttons need to be commented out. 
Add ability to save all the user preferences. (currently only the appHasBeen run variable is saved.)
Add a temporary button to cancel all the scheduled notifications.

-stretch--- "Give me something else" updates the notification and the views with a new activity.

Post testflight:
Refine the UI based on high fi and user feedback.
Fix bugs and unexpected behaviors.

Known Issues:
Some combinations of boat floaters produce no results.
There needs to be more built-in activities.
There is a non-ideal solution to a duplicate timeLine entry bug. It needs to be safer.
There is no user preferences page or place where the user can modify their preferences for activities after they've done the onboarding.


To Test:
All possible combinations of User Defininers/"Boat floaters." - do they all provide an array of activites for the user.
Do the activities change each time a notification is sent, or is one activity assigned to a time?
IS the onboarding effective at letting the user know the purpose of the app?

Future Plans:
Allow users to create custom activities- i.e. practice guitar- at a time they know they get sucked into social media.
Automate the notifications to trigger when a user has been on social media for a set amount of time.
Autoatically update the users social media time from ScreenTime data or whatever other way I can find to access it.
Provide a day to day progress visualization.
Allow users to select built-in activities that fall outside of their "boat floaters."
Refactor code and eliminate unused structs, classes, and functions.


