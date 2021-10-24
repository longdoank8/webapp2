import pyrebase
import os

config = {
  "apiKey": "AIzaSyAq0JhOxJHz6sit5umUEfx0l6KeY6vmMOo",
  "authDomain": "arena-web-app.firebaseapp.com",
  "databaseURL": "https://arena-web-app-default-rtdb.europe-west1.firebasedatabase.app",
  "projectId": "arena-web-app",
  "storageBucket": "arena-web-app.appspot.com",
  "messagingSenderId": "785229893630",
  "appId": "1:785229893630:web:f6785281761b3822857aaf",
  "measurementId": "G-JFVKSGLBG9"
};



firebase = pyrebase.initialize_app(config)
storage = firebase.storage()

path_on_cloud = "userID123/plot3.png"
path_local = "../plots/SRL_test.yml/map0_obs30_vel03.png"
path_local = "SRL_test.yml"
path_on_cloud = "dataFolder/SRL_test.yml"
#storage.child(path_on_cloud).put(path_local)
#storage.child(path_on_cloud).download("test.yml")


