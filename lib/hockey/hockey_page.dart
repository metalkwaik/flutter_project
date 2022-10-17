import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../comuunism/comuunism_model.dart';
import '../theme/theme.dart';
import '../widget/text.dart';

class HockeyPage extends StatefulWidget {
  const HockeyPage({super.key});
  @override
  State<HockeyPage> createState() => _HockeyPageState();
}

class _HockeyPageState extends State<HockeyPage> {
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
                            'HOCKEY',
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
                ' Sidney Crosby.  In Crosbys career, rare successes are strangely combined with offensive failures. On the one hand, he has already written his name into history only with "golden" Olympic goals, on the other – it is only necessary to start showing his best game, to reach the peak, as an injury immediately overtakes him. It was according to this scenario that everything went after the brilliant World Cup, and he received a new concussion literally out of the blue. Before that, it seemed that Sid, rebooted and transformed during the last season, had booked this regular for himself and would show everyone who was the boss in the house. Now it will have to be postponed.'),
        ImgRadius(img: 'asset/hockey1pers.jpg'),
        Mytext(
            text:
                ' Patrick Kane. Last years bummer of Chicago in the playoffs coincided with the first year of the giant contracts of Taves and Kane, and there is no doubt that it will be a matter of honor for them to win another trophy and show that the club was not mistaken. Yes, Kane can be closed, he can be turned off from the game, but incredible forces must be thrown at this, and units managed to pull it off. The last record–breaking season was rather an exception for Patrick - he was never a headliner of the regular season, but he went out in the playoffs and beat the ice with his hoof, bringing the team victories. Kane does not work out defensively, he can cut himself off and even bring a ridiculous goal. He may be invisible for most of the match, but one half-moment is enough for him to create a masterpiece. There is no point in talking about Kanes playing qualities – explosive speed, perfect reading of the game, magic hands, magic head. If he were at least a little less talented, he would have gone to conquer Buffalo in the summer of 2015. But the management of "Chicago" forgave him the hype and even his tarnished reputation. After all, when in the summer of 2010, a 21-year-old boy in overtime of the sixth match of the finals brought the city the first Stanley Cup in 49 years and rushed to his goalkeeper, throwing off his leggings on the move, he realized what the taste of a big victory was. And when Kainer wants to win, he cant be stopped.'),
        ImgRadius(img: 'asset/PatrickKeyn.jpg'),
      ],
    ),
    Column(
      children: const [
        Mytext(
            text:
                ' SKA. The leader of our rating is also the leader of the KHL regular season standings in lost points. Ilya Kovalchuk, Vladimir Tarasenko and Sergey Bobrovsky joined the already very good army team during the lockout, plus Viktor Tikhonov has once again returned to Russia, and the main, according to many, the favorite of the 2012/13 season looks like the main favorite should look, easily dealing with most rivals at the expense of only one class of players.'),
        ImgRadius(img: 'asset/SKA.jpg'),
        Mytext(
            text:
                '"Yuvaskyla" is not among the most affluent teams in its league (the budget of "YUP" is about 7 million euros) and is typically a coaching team, and its coach – Yurki Aho – is considered one of the most promising in the country. Eric Perrin and Ramzi Abid, who are familiar to us, run the attack in Juvascule, which only emphasizes the meaning of the word "coaching", as well as Rich Peverley from Boston, who decided to wait out the lockout in Finland. It is worth mentioning the presence of Tuomas Tarkki, Pyotr Gubachek and Yurka Vyalivaar, known to Russian fans. In general, this Finnish club is in many ways similar to "Brynes", about which a little later.'),
        ImgRadius(img: 'asset/Yuvaskyla.jpg'),
        Mytext(
            text:
                '"Brunes". The current champion and part–time one of the most low-income (budget - about 7 million euros) Elitserien teams is second in the standings, despite the departure of the teams top scorer Jakob Silfverberg and promising Johan Larsson, Sebastian Vennstrom and Mathias Ekholm, who went overseas, as well as Niklas Andersen, who moved to Severstal. But the squad did not seem to notice the losses, which should first of all be associated with the figure of Tommy Yunsson – one of the most promising coaches in Sweden, the best coach of Elitserien last season, who was his debut in the role of the head. You can, of course, recall some strengthening in the offseason (hello to our old friend Johan Haryu and Cody Franson from Toronto), note Johan Holmqvist, the "heir" of Zetterberg, Kalle Jernkrok, and the rising superstar Elias Linholm, who has already scored 10 (4+6) points in 14 matches at the age of 17, but the main creator of the success of "Brunes" is Yunsson. This team plays in such a way that, according to impressions, the conditional "Detroit" would have problems with them.'),
        ImgRadius(img: 'asset/Brunes.jpg')
      ],
    ),
    Column(
      children: const [
        Mytext(
            text:
                '1. The strongest hockey team - the USSR national team has won 22 world championships and 7 Olympiads. And I have never stayed at the World Cup without a medal for all the time. 1962 does not count – that championship was held in the American Colorado Springs, and the Soviet national team simply did not play at it for political reasons'),
        ImgRadius(img: 'asset/hockeySSR.jpg'),
        Mytext(
            text:
                '2. Stanley Cup. In 1995, the tradition of giving a trophy for the day to each of the winners was born. Most of the hockey players were treated with respect, but some came up with a twist. The most popular entertainment for hockey players was the breakfast from the cup. Martin Brodeur in the summer of 2003, having collapsed in the evening at the TV, was eating salty popcorn from a bowl. Someone brought it to the bar, but there were those who baptized their children from the Stanley Cup.  Recently, the cup even took part in a parade of sexual minorities. In general, since 1995, players have been doing what they want.'),
        Mytext(
            text:
                '3. The thickness of the ice.  Due to the fact that thick ice interferes with high-speed sliding, it is poured on a hockey rink by 7.6-10 cm.  It takes 30-60 tons of water to fill the ice of a hockey rink.  In a year, such a machine "winds up" to 2000 miles.')
      ],
    )
  ];

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
