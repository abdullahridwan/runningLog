# runningLog Personal Project
* Once quarintine started, I started getting into running
* Started off with the Strava App, however, I wanted an quick and easy way to log all of my runs 
* Also wanted a comments/notes section to jot down my thoughts during that run. 
* For example, there were many times where I realized that my form was off and wanted to jot down my mistake
* Went from Strava to the notes app for this reason, but wanted a more robust option
* Hence - __runninglog (tentative name, trying to think of cool names at the moment)__ 
* Vision is to create something clean and simple - one tab to see past runs and all of its meta info, and another to log the current run




## A Full Run Through as of now
<img src="full.gif" width="300" height="600"/>

## Firebase Run Through as of now
* Here, I wanted to show that I added firebase integration. Users will create documents per run, which are then populated with the given meta data (i.e totalMilesRan, etc)
* User UID is based on email during sign up, and corresponding data is dynamically fetched
* The goal is to import the whole "Past Workouts" View under the "Logs" tab, into the firebase tab
<img src="firebase.gif" width="1200" height="380"/>
<br/>
<br/>

## To Do List
| Item  |Priority (**1**>2>3)   | Description/Comments
|---|---|---|
| Add Firebase Auth and Read/Write |   1 | Would not want user data to be lost. Personally have running data across multiple sources (i.e Strava, Nike Running Club, Notes App), but would rather have one centralized location for all that data|
| Push Beta on TestFlight. If you want to be a beta user, please reach out to me at aar233@cornell.edu  | 2  | Want to do beta testing to catch bugs and get general feedback|
| Badges  |  3 | A cool reward system. Perhaps if you ran a new PR Time or PR Distance, you can get badges/trophies. Goal is to have badges/trophies show on specific runs on the past run Log. Was also thinking of a streaks system like snapchat|



## Stuff that I've been learning (its alot)
- Firebase documentation for ios is pretty confusing sometimes, but the playground really helps. Google sign in, and facebook sign in for firebase are for UIKit per the documentation - not swiftui. 
- Hence, i plan on using apple sign in - but that requires usage of apples framework
- The difference in usages of Observed Object, Environment Object, and State Object. This was pretty confusing at first, and in fact, I had a bug in my beta that was due to a misunderstanding of these concepts with Firebase. But the apple developer documentation for these are very helpful and I was able to solve my issue
- Data flow and passing data through view heirarchies. Really interesting work and it feels like a puzzle. I like the data flow aspect alot. 
- Authentication. I've been learning about Code Security at my **Capital One internship** through their CSSE or Secure coding certification, and this personal project adds onto the fact that the background work for authentication is hard, and I have a new-found appreication for it
