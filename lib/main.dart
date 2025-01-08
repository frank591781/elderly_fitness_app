import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'models/exercise.dart';
import 'package:video_player/video_player.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FitnessApp',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home')), // Home 面留白
    SportsPage(), // 將運動數據轉移到 Sports 頁面
    Center(child: Text('Scan')), // Search 頁面留白
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FitnessApp'),
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xff6200ee),
        unselectedItemColor: const Color(0xff757575),
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
            selectedColor: Colors.purple,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite),
            title: Text('Sports'),
            selectedColor: Colors.pink,
          ),
          SalomonBottomBarItem(
            icon: Icon(Icons.search),
            title: Text('Scan'),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

class SportsPage extends StatelessWidget {
  Future<List<Exercise>> _loadExercises() async {
    try {
      final String response = await rootBundle.loadString('assets/exercises.json');
      print('JSON data loaded successfully'); // Debug print
      final List<dynamic> data = json.decode(response);
      print('JSON data parsed successfully'); // Debug print
      return data.map((json) => Exercise.fromJson(json)).toList();
    } catch (e) {
      print('Error loading or parsing JSON data: $e'); // Error handling
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Exercise>>(
      future: _loadExercises(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('加載數據時出錯'));
        } else {
          final exercises = snapshot.data!;
          return ListView(
            children: [
              ExpansionTile(
                title: Text(
                  '大腿訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '大腿訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '小腿訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '小腿訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '肩頸訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '肩頸訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '核心訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '核心訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '髖關節訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '髖關節訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '三頭肌訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '三頭肌訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
              ExpansionTile(
                title: Text(
                  '二頭肌訓練',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                children: exercises
                    .where((exercise) => exercise.category == '二頭肌訓練')
                    .map((exercise) {
                      return _buildExerciseButton(context, exercise);
                    }).toList(),
              ),
            ],
          );
        }
      },
    );
  }

  Widget _buildExerciseButton(BuildContext context, Exercise exercise) {
    return ListTile(
      title: Text(exercise.title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercisePage(exercise: exercise),
          ),
        );
      },
    );
  }
}

class ExercisePage extends StatefulWidget {
  final Exercise exercise;

  ExercisePage({required this.exercise});

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late VideoPlayerController _frontController;
  late VideoPlayerController _sideController;

  @override
  void initState() {
    super.initState();
    _frontController = VideoPlayerController.network(widget.exercise.frontVideoPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _sideController = VideoPlayerController.network(widget.exercise.sideVideoPath)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _frontController.dispose();
    _sideController.dispose();
    super.dispose();
  }

  Widget _buildVideoPlayer(VideoPlayerController controller, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.value.isPlaying
                  ? controller.pause()
                  : controller.play();
            });
          },
          child: AspectRatio(
            aspectRatio: controller.value.isInitialized
                ? controller.value.aspectRatio
                : 16 / 9,
            child: controller.value.isInitialized
                ? VideoPlayer(controller)
                : CircularProgressIndicator(),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildVideoPlayer(_frontController, '正面視角'),
            SizedBox(height: 16),
            _buildVideoPlayer(_sideController, '側面視角'),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 介紹部分
                  Text(
                    '介紹：',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.exercise.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // 動作要點部分
                  Text(
                    '動作要點：',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.exercise.points,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // 注意事項部分
                  Text(
                    '注意事項：',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.exercise.precautions,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
