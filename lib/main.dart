import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

void main() {
  runApp(MyFitnessApp());
}

class MyFitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('老年人健身App'),
      ),
      body: ListView(
        children: [
          _buildExerciseButton(
            context,
            '輕微深蹲', // 中文名稱顯示在App上
            'assets/videos/squat_front.mp4', // 英文路徑
            'assets/videos/squat_side.mp4', // 英文路徑
            // 介紹部分
            '輕微深蹲是非常經典的下半身訓練動作，可以鍛鍊大腿、臀部以及核心穩定性，適合任何健身水平的人。', 

            // 動作要點部分
            '1. 站立時雙腳與肩同寬，腳尖略微朝外。\n'
            '2. 慢慢下蹲，膝蓋保持在腳尖正上方，臀部往後坐，像是坐在椅子上。\n'
            '3. 下蹲到膝蓋約90度後緩慢站起回到起始位置，重複動作。',

            // 注意事項部分
            '1. 避免膝蓋過度前移超過腳尖。\n'
            '2. 保持背部挺直，避免彎腰。\n'
            '3. 深蹲過程中全腳掌用力，避免只用前腳掌支撐。'

          ),
          _buildExerciseButton(
            context,
            '坐姿抬腿', // 中文名稱顯示在App上
            'assets/videos/seated_leg_press_front.mp4', // 英文路徑
            'assets/videos/seated_leg_press_side.mp4', // 英文路徑
            // 介紹部分
            '這是鍛鍊大腿前側的基本動作，適合想增強股四頭肌力量的人，尤其適合下肢恢復訓練。',

            // 動作要點部分
            '1. 坐在椅子上或平地，雙手放在身體兩側以保持平衡。\n'
            '2. 抬起一隻腿，使膝蓋伸直並與地面平行，保持核心收緊。\n'
            '3. 保持抬腿姿勢1-2秒，然後慢慢放下，換另一條腿進行動作。',

            // 注意事項部分
            '1. 確保上半身保持挺直，避免後仰。\n'
            '2. 抬腿時應該緩慢且控制，避免過快完成。\n'
            '3. 保持膝蓋不鎖死，動作要自然流暢。'

          ),
          _buildExerciseButton(
            context,
            '坐姿側彎腿', // 中文名稱顯示在App上
            'assets/videos/seated_leg_curl_front.mp4', // 英文路徑
            'assets/videos/seated_leg_curl_side.mp4', // 英文路徑
            // 介紹部分
            '這個動作針對臀部外側肌群，可以有效增強臀部力量和穩定性。',

            // 動作要點部分
            '1. 坐在地上，身體側向支撐一隻手，另一手放在腰部或支撐在地面上。\n'
            '2. 兩腿併攏，然後抬起上方的那條腿，保持腳尖朝前。\n'
            '3. 緩慢抬起至與髖部同高，然後慢慢放下，重複動作。',

            // 注意事項部分
            '1. 確保上半身穩定，不要左右晃動。\n'
            '2. 抬腿時腳尖保持朝前，避免腳尖向上或向下。\n'
            '3. 保持動作控制，避免過快抬起或放下。'

          ),
          _buildExerciseButton(
            context,
            '大腿上抬', // 中文名稱顯示在App上
            'assets/videos/leg_raise_front.mp4', // 英文路徑
            'assets/videos/leg_raise_side.mp4', // 英文路徑
            // 介紹部分
            '這個動作專注於強化大腿前側肌肉和核心，簡單且適合初學者或恢復性訓練。', 

            // 動作要點部分
            '1. 站立時核心收緊，雙腳與肩同寬，雙手自然放置兩側。\n'
            '2. 抬起一隻腳，使膝蓋往上到與臀部同高，保持核心穩定。\n'
            '3. 保持抬腿姿勢約1-2秒後放下，然後換另一隻腿重複。',

            // 注意事項部分
            '1. 上半身保持挺直，避免向後仰。\n'
            '2. 抬腿時保持核心收緊，以避免骨盆傾斜。\n'
            '3. 動作應該流暢，避免過於快速或僵硬。'

          ),
          _buildExerciseButton(
            context,
            '側腿上抬', // 中文名稱顯示在App上
            'assets/videos/side_leg_raise_front.mp4', // 英文路徑
            'assets/videos/side_leg_raise_side.mp4', // 英文路徑
            // 介紹部分
            '這個動作有助於強化大腿、臀部以及核心的穩定性，同時提升側向的活動範圍和力量。',

            // 動作要點部分
            '1. 站立時核心收緊，雙腳與肩同寬，雙手可以叉腰或舉起保持平衡。\n'
            '2. 拎起一側腿到膝蓋與臀部同高，同時保持上半身穩定。\n'
            '3. 拎腿後，將腿側向伸展，腳尖保持朝前，然後回到起始位置，換腿進行。',

            // 注意事項部分
            '1. 上半身保持直立，避免左右晃動。\n'
            '2. 拎腿時保持核心穩定，避免過度前傾後仰。\n'
            '3. 控制動作的速度，避免過快完成。'

          ),
          _buildExerciseButton(
            context,
            '弓箭步', // 中文名稱顯示在App上
            'assets/videos/lunges_front.mp4', // 英文路徑
            'assets/videos/lunges_side.mp4', // 英文路徑
            // 介紹部分
            '弓箭步是一個單腿動作，主要鍛鍊大腿前側和後側的肌肉，同時提升臀部的力量和穩定性。', 

            // 動作要點部分
            '1. 站立時雙腳與肩同寬，核心收緊，手自然放置兩側。\n'
            '2. 向前跨出一大步，後腳膝蓋慢慢下降至接近地面，前腿膝蓋保持在腳尖上方。\n'
            '3. 推動前腳站回起始位置，並交替另一隻腳進行動作。',

            // 注意事項部分
            '1. 保持上半身挺直，避免前傾。\n'
            '2. 後腿膝蓋不要碰地，保持一點距離。\n'
            '3. 前腳膝蓋不要超過腳尖，以保護膝關節。'

          ),
        ],
      ),
    );
  }

  Widget _buildExerciseButton(
    BuildContext context,
    String title,
    String frontVideoPath,
    String sideVideoPath,
    String description,
    String points,
    String precautions,
  ) {
    return ListTile(
      title: Text(title), // 在App中顯示中文名稱
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ExercisePage(
              title: title,
              frontVideoPath: frontVideoPath,
              sideVideoPath: sideVideoPath,
              description: description,
              points: points,
              precautions: precautions,
            ),
          ),
        );
      },
    );
  }
}

class ExercisePage extends StatefulWidget {
  final String title;
  final String frontVideoPath;
  final String sideVideoPath;
  final String description;
  final String points; // 動作要點
  final String precautions; // 注意事項

  ExercisePage({
    required this.title,
    required this.frontVideoPath,
    required this.sideVideoPath,
    required this.description,
    required this.points,
    required this.precautions,
  });

  @override
  _ExercisePageState createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  late VideoPlayerController _frontController;
  late VideoPlayerController _sideController;

  @override
  void initState() {
    super.initState();
    _frontController = VideoPlayerController.asset(widget.frontVideoPath)
      ..initialize().then((_) {
        setState(() {});
      });
    _sideController = VideoPlayerController.asset(widget.sideVideoPath)
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
              controller.value.isPlaying ? controller.pause() : controller.play();
            });
          },
          child: AspectRatio(
            aspectRatio: controller.value.isInitialized ? controller.value.aspectRatio : 16 / 9,
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
        title: Text(widget.title),
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
                    widget.description,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // 動作要點部分
                  Text(
                    '動作要點：',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.points,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  // 注意事項部分
                  Text(
                    '注意事項：',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.precautions,
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
