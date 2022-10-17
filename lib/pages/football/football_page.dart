import 'package:flutter/material.dart';
import 'package:flutter_application_1/widget/text.dart';
import 'package:provider/provider.dart';
import '../../comuunism/comuunism_model.dart';
import '../../theme/theme.dart';

class FootballPage extends StatefulWidget {
  const FootballPage({super.key});
  @override
  State<FootballPage> createState() => _FootballPageState();
}

class _FootballPageState extends State<FootballPage> {
  CommunismModel? _model;
  @override
  void didChangeDependencies() {
    if (_model == null) {
      final sportKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = CommunismModel(sportKey: sportKey);
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    CommunismModel? model = _model;
    if (model != null) {
      return ChangeNotifierProvider(
          create: (_) => model,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    gradient: MyTheme.colorGradient2(),
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(25),
                    ),
                    border: Border.all(),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: const Icon(Icons.arrow_back_ios),
                          ),
                          const SizedBox(width: 20),
                          const Text(
                            'FOOTBALL',
                            style: TextStyle(fontSize: 23),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) => Item(index: index)),
                ),
              ],
            ),
          ));
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class Item extends StatefulWidget {
  const Item({super.key, required this.index});
  final int index;
  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  bool _isShow = false;
  // категории , на которые будут нажимать
  final List _listVopros = <String>[
    'famous players',
    'top 3 best teams',
    '3 facts'
  ];

  final List _listOpisanie = <Widget>[
    Column(
      children: const [
        Mytext(
            text:
                ' Lets start this top with the greatest goalkeeper in history. The only player of his role who received the Golden Ball. Lev Yashin. The best goalkeeper of the 20th century according to the versions of FIFA, the International Federation of Football History and Statistics, magazines "World Soccer", "France Football" and "Placar". The goalkeepers game was successful due to the ability to read the game. He could simultaneously control the ball and choose a partner to pass. Lev Ivanovich was recognized 11 times as the best goalkeeper of the USSR, was a five-time champion of the USSR as part of Dynamo. In the national team, Yashin became an Olympic champion in 1956 and the winners of the European Cup of the 60th year. Of the 812 matches played, 207 Yashin defended "to zero". On average, he conceded about half a goal per game.'),
        ImgRadius(img: 'asset/footballScreenImg2.jfif'),
        Mytext(
            text:
                ' David Beckham. Maybe he is not the best football player, but there is no denying that he turned football around. Beckham won six league titles and the Champions League with MU, won the Spanish Championship with Real Madrid in 2007 and the French Championship with PSG in 2013. I remember him as an excellent performer of standard strokes. But thats not why we put him in the top ten. David Beckham is a real media icon, and all the guys in the yard wanted a hairstyle like his. The footballer starred in the most popular advertisements. He became a real superstar, the idol of millions. His contribution to the development of football cannot be ignored and ignored in any way.'),
        Mytext(
            text:
                'Alfredo Di Stefano. A truly unique player. He was the third football player of the 20th century according to FIFA. According to a survey by the International Federation of Football History and Statistics, he ranks fourth among the best footballers in the world of the 20th century, sixth among the best players'),
        ImgRadius(img: 'asset/footballScreenimg3.jfif'),
      ],
    ),
    Column(children: const [
      Mytext(
          text:
              'All football fans love ratings, because it is an integral part of the sport, which allows them to keep the question of which team is the strongest relevant. At the same time, a variety of arguments are used: the number of trophies, the level of skill and even the subjective entertainment of the game. When compiling this rating of the strongest football teams in the world in 2022, we had to take into account the achievements of the club, its history, as well as income and earnings, which we did.'),
      ImgRadius(img: 'asset/footballPSJ.jpg'),
      Mytext(
          text:
              'Paris Saint-Germain is a French professional football club from Paris. It was founded in 1970. The most titled club in the country. Paris Saint-Germain became French champion ten times, won the French Cup fourteen times and the French League Cup ten times. The club achieved success on the European stage, winning the UEFA Cup Winners Cup in 1996, beating Rapid Vienna in the final.'),
      ImgRadius(img: 'asset/footballManchester.jpg'),
      Mytext(
          text:
              'Manchester City is an English professional football club from Manchester, playing in the Premier League, the top division in the English football league system. It was founded in 1880 under the name "St. Marks .  In 1887 it was renamed "Arduik". Since 1894 it has been called Manchester City. During its history, the club has changed three stadiums: from the moment of its foundation until 1923, it played at Hyde Road, from 1923 to 2003 — at Main Road. Currently, he performs at the City of Manchester stadium, built in 2002, with a capacity of about 55 thousand spectators.'),
      ImgRadius(img: 'asset/footballRealMadrid.jpg'),
      Mytext(
          text:
              'Real Madrid is a Spanish professional football club from the city of Madrid. Recognized by FIFA as the best football club of the XX century. Real Madrid is one of three clubs that have never left the top Spanish division, the other two are Barcelona and Athletic Bilbao. It is one of the most titled clubs in Spanish football. He has 67 national trophies to his credit: a record 35 national champion titles, as well as 19 Kings Cups, 12 Spanish Super Cups and 1 League Cup. He holds the record for the number of wins and goals in the Champions League (14 times, the only team that won this tournament — then the European Champions Cup — 5 times in a row). According to the Deloitte organization, in the 2016/17 season, Real Madrid was the second highest earning club with an annual income of 674.6 million euros. It is one of the most valuable sports clubs in the world. In 2019, it was recognized as the most expensive football club, with a total value of 4.2 billion.'),
    ]),
    Column(
      children: const [
        Mytext(text: '1. Football was invented in China around 476 BC'),
        Mytext(text: '2. Football is the most popular sport on earth'),
        Mytext(text: '3. Only Canadians and Americans call soccer Soccer'),
        ImgRadius(img: 'asset/fotball3facts.jpg'),
      ],
    )
  ];
  ////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            gradient: MyTheme.colorGradient3(),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            border: Border.all()),
        child: InkWell(
          onTap: (() => setState(() => _isShow = !_isShow)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      _listVopros[widget.index],
                      style: const TextStyle(
                        color: Colors.blueGrey,
                        fontWeight: FontWeight.w800,
                        fontSize: 18,
                        letterSpacing: 1,
                      ),
                    ),
                    Icon(_isShow ? Icons.arrow_drop_up : Icons.arrow_drop_down),
                  ],
                ),
              ),
              if (_isShow)
                Container(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      _listOpisanie[widget.index],
                    ],
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ImgRadius extends StatelessWidget {
  const ImgRadius({super.key, required this.img});
  final String img;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(img),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 5),
              blurRadius: 7.0,
              spreadRadius: 1.0,
            ),
          ]),
    );
  }
}
