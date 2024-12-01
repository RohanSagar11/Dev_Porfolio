
import 'dart:ui';
import 'package:dev_folio/screens/workcard.dart';
import 'package:dev_folio/widgets/projectshowcase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../widgets/customwidgets.dart';
import '../Screenshots.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final skills = skill;

    Future<void> _launchURL(String url) async {
      try {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        } else {
          throw 'Could not launch $url';
        }
      } catch (e) {
        print('Error launching URL: $e');
      }
    }
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'rohansagar005@gmail.com',
    );
    final GlobalKey about = GlobalKey();
    final GlobalKey skillspage = GlobalKey();
    final GlobalKey projects = GlobalKey();
    void _scrollToTarget(GlobalKey target) {
      Scrollable.ensureVisible(
        target.currentContext!,
        duration: Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    }
    final size = MediaQuery.of(context).size.width;
    print(size);

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0 ,left: 8.0, bottom: 8.0),
          child: Image.asset("assets/hacker.png"),
        ),
        title: const Text("Dev Folio", style: TextStyle(color: Colors.black),),
        actions:  [
          size>500?Row(children: [
            CustomBarButton(text: 'About Me', onPressed: (){_scrollToTarget(about);},),
            const SizedBox(width: 20,),
            CustomBarButton(text: 'Projects', onPressed: (){_scrollToTarget(projects);},),
            const SizedBox(width: 20,),
            CustomBarButton(text: 'Skills', onPressed: (){_scrollToTarget(skillspage);},),
            const SizedBox(width: 10,),
            Image.asset('assets/flutterimg.png', height: 50, width: 50,),
            const SizedBox(width: 10,),
          ],):
          Row(
            children: [
              Image.asset('assets/flutterimg.png', height: 50, width: 50,),
              const SizedBox(width: 10,),
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'About') {
                    _scrollToTarget(about);
                  } else if (value == 'Projects') {
                    _scrollToTarget(projects);
                  } else if (value == 'Skills') {
                    _scrollToTarget(skillspage);
                  }
                },
                itemBuilder: (context) => [
                  PopupMenuItem(value: 'About', child: Text('About')),
                  PopupMenuItem(value: 'Projects', child: Text('Projects')),
                  PopupMenuItem(value: 'Skills', child: Text('Skills')),
                ],
              ),
            ],
          ),

        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 150 ,),
            size>500?Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Hello, I'm",style: TextStyle(fontSize:  size > 500 ? 20 : 15),),
                   Text("Rohan Sagar", style: TextStyle(fontSize: size > 500 ? 60 : 30, fontWeight: FontWeight.bold),),
                   Text("Flutter Developer", style: TextStyle(fontSize: size > 500 ? 30 : 15, fontStyle: FontStyle.italic),),
                    const SizedBox(height: 20,),
                    CustomBarButton(
                      text: "Email me", onPressed: ()async{
                      await _launchURL(emailLaunchUri.toString());
                    },),
                ],),
                Image.asset("assets/profileimage.png", height: size > 500 ? 150 : 100, width: size > 500 ? 150 : 100,),

              ],
            ): Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/profileimage.png", height: 300, width: 300),
                    const SizedBox(height: 20,),
                    Text("Hello, I'm",style: TextStyle(fontSize: 20),),
                    Text("Rohan Sagar", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                    Text("Flutter Developer", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
                    const SizedBox(height: 20,),
                    CustomBarButton(
                      text: "Email me", onPressed: ()async{
                      await _launchURL(emailLaunchUri.toString());
                    },),
                  ],),

              ],
            ),
            const SizedBox(height: 100,),
            const Divider(
              height: 2,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 40,),
            size>500 ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/guyworking.jpg", height: 300, width: 300,),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Me", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), key: about,),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: size/3,
                    child: Text(
                      softWrap: true,
                      "I'm Rohan Sagar, an experienced Android App Developer skilled in both Android"
                          "and Flutter development.\n"
                          "I previously worked at cloudnuro.ai, optimizing and integrating APIs for SaaS applications.\n"
                          "I am proficient in Kotlin, Dart, and responsive UI design.\n"
                          "My technical strengths also include expertise in Flutter and Dart.\n",
                          style: TextStyle(fontSize: 15),
                          textAlign: TextAlign.left,
                        ),
                  ),

                  const SizedBox(height: 20,),
                  CustomBarButton(text: "Linkedin", onPressed: () async{
                    await _launchURL('https://www.linkedin.com/in/rohan-sagar-rs/');
                    }, ),
                ],
              )
            ],) : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset("assets/guyworking.jpg", height: 300, width: 300,),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("About Me", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), key: about,),
                      const SizedBox(height: 20),
                      Text(
                        softWrap: true,
                        "I'm Rohan Sagar, an experienced Android App Developer skilled in both Android"
                            "and Flutter development.\n"
                            "I previously worked at cloudnuro.ai, optimizing and integrating APIs for SaaS applications.\n"
                            "I am proficient in Kotlin, Dart, and responsive UI design.\n"
                            "My technical strengths also include expertise in Flutter and Dart.\n",
                        style: TextStyle(fontSize: 15),
                        textAlign: TextAlign.left,
                      ),

                      const SizedBox(height: 20,),
                      CustomBarButton(text: "Linkedin", onPressed: () async{
                        await _launchURL('https://www.linkedin.com/in/rohan-sagar-rs/');
                      }, ),
                    ],
                  ),
                )
              ],),
            const Divider(
              height: 2,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 30,),
            const Center(child: Text("Work Experience", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),),
            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Left Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Work Experience',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Have been developing\nsince my past 1 years',
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),

                  SizedBox(width: 50), // Space between sections

                  // Right Section
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        WorkExperienceCard(
                          number: '1',
                          color: Colors.yellow,
                          title: 'Associate Engineer at Cloudnuro.ai',
                          description:
                          'Worked on report building, documentation, attended team meeting and client meeting, building with flutter',
                          date: "31, July 2024",
                        ),

                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Center(key: projects, child: const Text("Projects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
            const SizedBox(height: 50,),
            Center(
              child: Container(
                color: Colors.transparent,
                width: 1000,
                child: ProjectShowcase()
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: Column(
                children: [
                  Text('Skills', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,), key: skillspage,),
                  SizedBox(height: 10,),
                  SizedBox(
                    width: 400,
                    child: GridView.builder(
                      itemCount: skills.length,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      mainAxisSpacing: 5,
                    ), itemBuilder: (BuildContext context, index){
                      return InkWell(
                        onTap: ()
                        async { await _launchURL(skill[index].httplink);},
                        child: Card(
                          margin: EdgeInsets.all(10),
                          elevation: 10,
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.asset(
                              fit: BoxFit.cover,
                              skill[index].icon),
                          ),
                        ),
                      );
                    }),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    color: Colors.black,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('assets/linkedin.png',fit: BoxFit.fill,))),
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('assets/twitter.png',fit: BoxFit.fill,))),
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('assets/mail.png', fit: BoxFit.fill,))),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
