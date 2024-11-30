import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_web/video_player_web.dart';
import '../Screenshots.dart';
import '../modals/projectModel.dart';

class ProjectShowcase extends StatefulWidget {
  ProjectShowcase({super.key,});

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  final List<Models> models = model;
  late List<VideoPlayerController> _controllers;
  @override
  void initState() {
    super.initState();
    _controllers = models.map((model) => VideoPlayerController.asset(model.mp4)).toList();
    // Initialize all controllers
    for (var controller in _controllers) {
      controller.initialize().then((_) {
        setState(() {}); // Update the state to refresh the UI
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return
      ListView.builder(
          itemCount: models.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, index){
            return
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey), left: BorderSide(color: Colors.grey), right: BorderSide(color: Colors.grey), ),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(model[index].icon, height: 100, width: 100), // Ensure the path is correct
                    Text(model[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                    Text(model[index].Description),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: IconButton(
                                onPressed: () {},
                                icon: SizedBox( height: 50, width: 50, child: Image.asset('play.png', fit: BoxFit.cover, height: 50, width: 50,)),
                                iconSize: 2)),
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: IconButton(
                                onPressed: () {},
                                icon: SizedBox(height: 50, width: 50, child: Image.asset('github.png', fit: BoxFit.contain,)),
                                iconSize: 2))
                      ],
                    ),
                    SizedBox(height: 20),
                    const Divider(
                      height: 2,
                      indent: 120,
                      endIndent: 120,
                    ),
                    SizedBox(height: 20),
                    Center(child: Text('Screen Shots', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
                    SizedBox(height: 20),
                    size>500?FittedBox(
                      child: Row(
                        children: [
                          FittedBox(
                            child: Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                              clipBehavior: Clip.hardEdge,
                              height: 300,
                              width: 300,
                              child: Center(
                                child: _controllers[index].value.isInitialized
                                    ? AspectRatio(
                                  aspectRatio: _controllers[index].value.aspectRatio,
                                  child: VideoPlayer(_controllers[index]),
                                )
                                    : const CircularProgressIndicator(),
                              ),
                            ),
                          ),
                          FittedBox(
                            child: Container(
                              clipBehavior: Clip.hardEdge,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                              height: 300,
                              width: 500,
                              child: ListView.builder(
                                shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: model[index].screenshotsimages.length,
                                  itemBuilder: (BuildContext context, sindex){
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Container(
                                          clipBehavior: Clip.hardEdge,
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                          child: Image.asset(model[index].screenshotsimages[sindex], height: 300,)),
                                    );
                                  }),
                            ),
                          )
                        ],
                      ),
                    ) : Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
                          clipBehavior: Clip.hardEdge,
                          height: 300,
                          width: 300,
                          child: Center(
                            child: _controllers[index].value.isInitialized
                                ? AspectRatio(
                              aspectRatio: _controllers[index].value.aspectRatio,
                              child: VideoPlayer(_controllers[index]),
                            )
                                : const CircularProgressIndicator(),
                          ),
                        ),
                        Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          height: 300,
                          width: 500,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: model[index].screenshotsimages.length,
                              itemBuilder: (BuildContext context, sindex){
                                return Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Container(
                                      clipBehavior: Clip.hardEdge,
                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                                      child: Image.asset(model[index].screenshotsimages[sindex], height: 300,)),
                                );
                              }),
                        )
                      ],
                    ),
                    FloatingActionButton(
                      backgroundColor: Colors.orangeAccent,
                      onPressed: () {
                        setState(() {
                          _controllers[index].value.isPlaying ? _controllers[index].pause() : _controllers[index].play();
                        });
                      },
                      child: Icon(
                        color: Colors.white,
                        _controllers[index].value.isPlaying ? Icons.pause : Icons.play_arrow,
                      ),
                    ),
                  ],
                ),
                            ),
              );
      });

  }
}
