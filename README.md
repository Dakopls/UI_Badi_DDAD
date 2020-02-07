# UI_BadiGeeks
Repository for the final project during the GeeksHubs' bootcamp. <br>
Making of an approximation of the BADI iOS application from scratch. <br>
<h4><Rest of team pilotes</h4>
Daniel Roig: https://github.com/danielroig <br>
David Benítez: https://github.com/corintoz <br>
Adrià Buch: https://github.com/adria1988 <br>
<h4>Pods used</h4>
Kingfisher https://cocoapods.org/pods/Kingfisher <br>
Tinyconstraints https://cocoapods.org/pods/TinyConstraints <br>
<h4>Lite doc</h4>
I don't use storyboard initialization, so there's no 'SceneDelegate.swift' file. <br>
I use VIPER Architecture. My filesystem hierarchy is quite self explainative. <br>
Views, display related. I use xibs except for detail view, where I found it useful to use code. <br>
Interactors, one for each screen of the application. They handle the data retrieval and the storage in the app. <br>
Presenters, one for each screen of the application. They communicate Interactors and Views. <br>
Entities, data models, they also handle the formatting of the data. <br>
Router, singleton, handles the navigation in the app and the dependency injection. <br>
