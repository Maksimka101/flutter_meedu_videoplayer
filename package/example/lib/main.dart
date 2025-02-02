import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_meedu_videoplayer/meedu_player.dart';
import 'package:flutter_meedu_videoplayer_example/pages/auto_fullscreen_on_rotation.dart';
import 'package:flutter_meedu_videoplayer_example/pages/basic_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/change_quality_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/custom_icons_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/disabled_buttons_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/fullscreen_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/gridview_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/listview_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/m3u8_page_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/network_with_subtitle_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/one_page_to_other_page_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/pick_file_page_example.dart';
import 'package:flutter_meedu_videoplayer_example/pages/playback_speed_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/player_with_header_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/portrait_example_page.dart';
import 'package:flutter_meedu_videoplayer_example/pages/yotube_page_example.dart';

void main() {
  initMeeduPlayer();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        "basic": (_) => const BasicExamplePage(),
        "fullscreen": (_) => const FullscreenExamplePage(),
        "with-header": (_) => const PlayerWithHeaderPage(),
        "subtitles": (_) => const NetworkWithSubtitlesPage(),
        "playback-speed": (_) => const PlayBackSpeedExamplePage(),
        "quality-change": (_) => const ChangeQualityExamplePage(),
        "one-page-to-other": (_) => const OnePageExample(),
        "pick-file": (_) => const PickFileExamplePage(),
        "custom-icons": (_) => const CustomIconsExamplePage(),
        "disabled-buttons": (_) => const DisabledButtonsExample(),
        "listview": (_) => const ListViewExample(),
        "gridview": (_) => const GridViewExample(),
        "portrait": (_) => const PortraitExamplePage(),
        "youtube": (_) => const YoutubeExamplePage(),
        "m3u8": (_) => const M3u8ExamplePage(),
        "auto_fullscreen": (_) => const AutoFullScreenExamplePage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Wrap(
          children: [
            buildButton(context,
                text: 'Basic Network example', routeName: 'basic'),
            buildButton(context,
                text: 'Fullscreen example', routeName: 'fullscreen'),
            buildButton(context,
                text: 'With header example', routeName: 'with-header'),
            buildButton(context,
                text: 'With subtitles example', routeName: 'subtitles'),
            buildButton(context,
                text: 'Playback speed example', routeName: 'playback-speed'),
            buildButton(context,
                text: 'Quality Change example', routeName: 'quality-change'),
            buildButton(context,
                text: 'One Page to other', routeName: 'one-page-to-other'),
            buildButton(context, text: 'Pick file', routeName: 'pick-file'),
            buildButton(context,
                text: 'Custom Icons', routeName: 'custom-icons'),
            buildButton(context,
                text: 'Disabled Buttons', routeName: 'disabled-buttons'),
            buildButton(context, text: 'ListView', routeName: 'listview'),
            buildButton(context, text: 'GridView', routeName: 'gridview'),
            buildButton(context, text: 'Portrait', routeName: 'portrait'),
            buildButton(context,
                text: 'Auto FullScreen on rotation',
                routeName: 'auto_fullscreen'),
            kIsWeb
                ? buildDisabledButton(context,
                    text: "Youtube Example doesn't work on web")
                : buildButton(context, text: 'Youtube', routeName: 'youtube'),
            kIsWeb
                ? buildDisabledButton(context,
                    text: "M3u8 Example doesn't work on web")
                : buildButton(context, text: 'M3u8', routeName: 'm3u8'),
          ],
        ),
      ),
    );
  }

  Widget buildButton(BuildContext context,
      {required String text, required String routeName}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, routeName);
        },
        child: Text(text),
      ),
    );
  }

  Widget buildDisabledButton(BuildContext context, {required String text}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: ElevatedButton(
        onPressed: null,
        child: Text(
          text,
          style: const TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
