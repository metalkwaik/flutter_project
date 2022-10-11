import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/pages/football/football_page.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:provider/provider.dart';
import '../entiti/sport.dart';
import '../hockey/hockey_page.dart';
import '../tennis/tennis_page.dart';

class PageFactory {
  Widget mainPage() => ChangeNotifierProvider(
        create: (_) => SportModel(),
        child: const HomeScreen(),
      );
  Widget footballPage() => const FootballPage();
  Widget hockeyPage() => const HockeyPage();
  Widget tennisPage() => const TennisPage();
  Widget swimPage() => const TennisPage();
}
