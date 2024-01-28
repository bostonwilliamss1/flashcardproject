import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/words.dart';
import 'package:flutter_application_1/components/home_page/topics_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final List<String> _topics = [];
  @override
  initState(){
    for(var t in words){
      if (!_topics.contains(t.topic)){
        _topics.add(t.topic);
      }
    }
    _topics.sort();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    final widthPadding = size.width * 0.04;

    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        title: const Text("Spanish FlashCards"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding( padding: EdgeInsets.only(left: widthPadding, right: widthPadding),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: size.height * 0.40,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipPath(clipper: MyClipper(),
                    child: Image.asset('assets/images/home_pageimage.jpeg', 
                    fit: BoxFit.cover),),
                    const Positioned(
                      top: 150.0,
                      left: 35.0,
                      child: Text(
                        'Get Ready to Study!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 35.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          SliverGrid(delegate: SliverChildBuilderDelegate(
            childCount: _topics.length,
            (context, index) => TopicsTile(topic: _topics[index]),
            
          ), gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
          ),
          ),
        ],
      ),
    ),
      );
  }
}
class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.width, size.height), const Radius.circular(20.0)));
    return path;
  }
@override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
