import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  late YoutubePlayerController _controller;
  List<String> videoIds = ['AMIeTWwvQ2E','wC7N4xz7B8w', 'a5vQCjs9BFc', 'pj914UxWa98'];
  int currentVideoIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeController(videoIds[currentVideoIndex]);
  }

  void _initializeController(String videoId) {
    _controller = YoutubePlayerController(
      initialVideoId: videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    )..addListener(() {
        if (_controller.value.playerState == PlayerState.ended) {
          if (currentVideoIndex < videoIds.length - 1) {
            currentVideoIndex++;
            _updateController(videoIds[currentVideoIndex]);
          }
        }
      });
  }

  void _updateController(String videoId) {
    _controller.load(videoId);
    _controller.play();
  }

  void _handleVerticalDrag(DragUpdateDetails details) {
    if (details.primaryDelta! < -10) {
      // Kéo lên
      if (currentVideoIndex < videoIds.length - 1) {
        setState(() {
          currentVideoIndex++;
          _updateController(videoIds[currentVideoIndex]);
        });
      }
    } else if (details.primaryDelta! > 30) {
      // Kéo xuống
      if (currentVideoIndex > 0) {
        setState(() {
          currentVideoIndex--;
          _updateController(videoIds[currentVideoIndex]);
        });
      }
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Khám Phá',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Căn giữa tiêu đề
      ),
      body: GestureDetector(
        onVerticalDragUpdate: _handleVerticalDrag,
        child: Stack(
          children: [
            // Video player
            YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              aspectRatio: 16 / 34, 
            ),
            // Nội dung trên video
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Huflit',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Màu của vị trí
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () {},
                          color: Colors.white, // Màu của icon
                        ),
                        IconButton(
                          icon: Icon(Icons.share),
                          onPressed: () {},
                          color: Colors.white, // Màu của icon
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 100,
              left: 16,
              child: Text(
                'Hướng dẫn sử dụng App',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white, // Màu của tiêu đề
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 16,
              right: 16,
              child: Text(
                'Mô tả: App thuê khách sạn',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ExplorePage(),
  ));
}
