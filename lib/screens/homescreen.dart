
import 'dart:ui';
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

    return  Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black,
        surfaceTintColor: Colors.white,
        elevation: 5,
        leading: Padding(
          padding: const EdgeInsets.only(top: 8.0 ,left: 8.0, bottom: 8.0),
          child: Image.asset("hacker.png"),
        ),
        title: const Text("Dev Folio", style: TextStyle(color: Colors.black),),
        actions:  [
          CustomBarButton(text: 'About Me', onPressed: (){_scrollToTarget(about);},),
          const SizedBox(width: 20,),
          CustomBarButton(text: 'Projects', onPressed: (){_scrollToTarget(projects);},),
          const SizedBox(width: 20,),
          CustomBarButton(text: 'Skills', onPressed: (){_scrollToTarget(skillspage);},),
          const SizedBox(width: 10,),
          Image.asset('flutterimg.png', height: 50, width: 50,),
          const SizedBox(width: 10,),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 150 ,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                 Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  const Text("Hello, I'm",style: TextStyle(fontSize: 20),),
                  const Text("Rohan Sagar", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                  const Text("Flutter Developer", style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),),
                    const SizedBox(height: 20,),
                    CustomBarButton(
                      text: "Email me", onPressed: ()async{
                      await _launchURL(emailLaunchUri.toString());
                    },),
                ],),
                Image.asset("profileimage.png", height: 200, width: 200,),

              ],
            ),
            const SizedBox(height: 100,),
            const Divider(
              height: 2,
              indent: 100,
              endIndent: 100,
            ),
            const SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Image.asset("guyworking.jpg", height: 300, width: 300,),
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("About Me", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold), key: about,),
                  const SizedBox(height: 20,),
                  const Text("I'm Rohan Sagar, an experienced Android App Developer skilled in both Android\nand Flutter development.\n"
                      "I previously worked at Cloudnuro.ai,optimizing and integrating APIs for SaaS applications. \n"
                      "I am proficient in Kotlin, Dart, and responsive UI design.\n"
                      "My technical strengths also include expertise in Flutter and Dart."),
                  const SizedBox(height: 20,),
                  CustomBarButton(text: "Linkedin", onPressed: () async{
                    await _launchURL('https://www.linkedin.com/in/rohan-sagar-rs/');
                    }, ),
                ],
              )
            ],),
            const Divider(
              height: 2,
              indent: 100,
              endIndent: 100,
            ),
            SizedBox(height: 30,),
            Center(key: projects, child: Text("Projects", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
            SizedBox(height: 50,),
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
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('linkedin.png',fit: BoxFit.fill,))),
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('twitter.png',fit: BoxFit.fill,))),
                        IconButton(onPressed: (){}, icon: SizedBox(height: 30, width: 30, child: Image.asset('mail.png', fit: BoxFit.fill,))),
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
