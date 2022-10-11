import 'package:flutter/cupertino.dart';
import '../../page_factory/page_factory.dart';

class MyNavigation {
  final factor = PageFactory();
  final List namePage = ['/football', '/hockey', '/tennis', '/swim'];
  final initRoute = '/';
  Map<String, WidgetBuilder> get routePage => {
        initRoute: (_) => factor.mainPage(),
        namePage[0]: (_) => factor.footballPage(),
        namePage[1]: (_) => factor.hockeyPage(),
        namePage[2]: (_) => factor.tennisPage(),
        namePage[3]: (_) => factor.swimPage(),
      };
}
