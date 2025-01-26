import 'modals/projectModel.dart';


final List<Models> model = [
  Models(name: "Jarvis AI Bot",  Description: "Utilizes Flutter/Dart for interface with OpenAI API for text/image generation. Features speech-to-text & text-to-speech for dynamic interactions.", icon: 'appsData/jarvisappicon.jpg', screenshotsimages: ['assets/screenshots.jpeg','assets/screenshots.jpeg','assets/screenshots.jpeg'], mp4: 'assets/weathervideo.mp4'),
  Models(name: "Weather App", Description: "Developed a Flutter Weather App integrating Google API for geolocation and Open Weather API for real-time data. Enabled seamless location switching.", icon: 'appsData/weatherappicon.jpg', screenshotsimages: ['assets/weatherimg1.jpeg', 'assets/weatherimg2.jpeg','assets/weatherimg3.jpeg'], mp4: 'assets/weathervideo.mp4'),
  Models(name: "Shopping App", Description: "Showcased mobile app skills with a flexible UI and secure payment integration via Razor Pay. Utilized a Json database for efficient data handling.", icon: 'appsData/shoppingicon.jpg', screenshotsimages: ['assets/shopping1.jpeg','assets/shopping2.jpeg','assets/shopping3.jpeg'], mp4: 'assets/shoppingvideo.mp4'),
  Models(name: "Google Clone", Description: "Developed a Google Search clone using Flutter, integrating Google Search API. Offers a familiar search experience within a Flutter interface.", icon: 'appsData/googlecloneicon.jpg', screenshotsimages: ['assets/screenshots.jpeg', 'assets/screenshots.jpeg','assets/screenshots.jpeg'], mp4: 'assets/netflix.mp4'),
  Models(name: "Pokedex", Description: "A Pokedex App", icon: 'appsData/pokemonicon.jpg', screenshotsimages: ['appsData/pokemon5.jpg', 'appsData/pokemon4.jpg','appsData/pokemon3.jpg', 'appsData/pokemon2.jpg', 'appsData/pokemon1.jpg'], mp4: 'assets/pokedex.mp4'),
  Models(mp4:'assets/flappyvideo.mp4' , name: 'Flappy Bird', Description: 'A Flappy Bird Game', icon: 'appsData/flappybirdicon.png', screenshotsimages: ['assets/flappy1.jpeg','assets/flappy2.jpeg','assets/flappy3.jpeg','assets/flappy4.jpeg'])
];

final List<skillsModels> skill = [
  skillsModels(icon: 'assets/flutterimg.png', httplink: "https://flutter.dev/?gad_source=1&gclid=Cj0KCQjw0_WyBhDMARIsAL1Vz8ueK2gd4rC85yUnIHgrpXfbaHqiqlYz5CNX8EWDSe-hPrFVOLOziD0aAvIpEALw_wcB&gclsrc=aw.ds"),
  skillsModels(icon: 'assets/dart.png', httplink: "https://dart.dev/guides"),
  skillsModels(icon: 'assets/mysql.png', httplink: "https://dev.mysql.com/doc/"),
  skillsModels(icon: 'assets/firebase.png', httplink: "https://firebase.google.com/docs"),
  skillsModels(icon: 'assets/android.png', httplink: "https://developer.android.com/develop"),
];
