# Routine-Planner-Daily-Tasks

A Routine-Planner-Daily-Tasks project created in flutter .This app is a To-Do List application designed for task management with a sleek and user-friendly interface Key include:
Task Management:
Users can create, edit, and manage tasks. Each task can have a title, description, and a due date selected via a calendar.
Tasks are listed with their due dates and can be marked as complete or pending.
Visual indicators make it easy to track completed tasks,
Authentication:The app includes a Sign Up and Log In feature, ensuring that users' tasks and data are securely saved and synchronized across devices. 
clone the appropriate branche mentioned below:

* For Mobile: https://github.com/mohammedashraf16/Islami_App

## Getting Started

The Routine-Planner-Daily-Tasks contains the minimal implementation required to create a new library or project. The repository code is preloaded with some basic components like basic app architecture, app theme, constants and required dependencies to create a new project. This will also help in reducing setup & development time by allowing you to use same code pattern and avoid re-writing from scratch.

![Brown Fashion Sale With Phone Mockup Instagram Post (3)](https://github.com/user-attachments/assets/433b3379-10a3-436a-9716-e4ba28171210)

## How to Use 

**Step 1:**

Download or clone this repo by using the link below:

```
  https://github.com/mohammedashraf16/Islami_App
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```



## Routine-Planner-Daily-Tasks Features:

* Splash
* Home
* Routing
* Provider (State Management)
* FireBase Auth
* FireBase Firestore

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- config/
     |- language
     |- theme
|- core/
     |- Constants
     |- functions
     |- base
|- features/
     |- auth
     |- main.dart
     |- home/
          |- domain
          |- presentation
          |- tabs
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- constants - This directory contains the constants for `Endpoints `and `BaseUrl`.
2- features  - Contains all the ui of your project, contains sub directory for each screen,and contain the logic of app in seperate folders
3- theme     - contain the theme for all application 
8- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```

### Constants

This directory contains all Endpoints and BaseUrls. in example below:

```
constants/
|- constants.dart
```
### Packages 
```
Packages /
|- firebase_core
|- flutter_native_splash
|- calendar_timeline
|- google_fonts
|- provider
|- flutter_slidable
|- cloud_firestore
|- firebase_core
|- animated_text_kit
|- shared_preferences
|- intl
|- flutter_localizations
|- firebase_auth
```
### Samples Of Ui:
![Brown Fashion Sale With Phone Mockup Instagram Post (2)](https://github.com/user-attachments/assets/b465798b-7291-46fe-b743-d154ed3fb6da)

![Brown Fashion Sale With Phone Mockup Instagram Post (4)](https://github.com/user-attachments/assets/af93af32-bdc3-424b-b977-be62a6439811)

       
## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the Movies then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.
