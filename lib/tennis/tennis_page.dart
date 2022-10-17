import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../comuunism/comuunism_model.dart';
import '../theme/theme.dart';
import '../widget/text.dart';

class TennisPage extends StatefulWidget {
  const TennisPage({super.key});
  @override
  State<TennisPage> createState() => _TennisPageState();
}

class _TennisPageState extends State<TennisPage> {
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
                            'TENNIS',
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
    'top of the longest matches',
    '3 facts'
  ];

  final List _listOpisanie = <Widget>[
    Column(
      children: const [
        Mytext(
            text:
                ' Roger Federer. TBSH Titles: 20 (1st result in the Open Era), Weeks #1: 310 (1st result in the Open Era), Wins at the Final Tournaments: 6 (1st result in the Open Era), Total number of titles: 99 (2nd result in the Open Era). The owner of the largest number of records and achievements in mens tennis. The flagship of this sport of the "noughties". The Grass King (8 Wimbledons) and the King of all tennis is the best tennis player in history according to the overwhelming number of key people from the world of this sport'),
        ImgRadius(img: 'asset/Roger Federer.png'),
        Mytext(
            text:
                ' Pete Sampras. TBSH Titles: 14 (divides the 2nd result in the Open Era), Weeks #1: 286 (2nd result in the Open Era), Wins at the Final Tournaments: 5 (divides the 2nd result in the Open Era), Total number of titles: 64. The flagship of tennis of the 90s, considered, among other things, the "King of grass" before the heyday of Roger Federers career. Winner of 7 Wimbledon titles (2nd result in the Open Era) - the most prestigious tennis tournament'),
        ImgRadius(img: 'asset/Pete Sampras.jpg'),
      ],
    ),
    Column(
      children: const [
        Mytext(
            text:
                ' John Isner defeated Nicolas Mayu in 2010 (the match lasted 11 hours and 5 minutes). This match, perhaps, will remain unsurpassed forever. The match during the first round of the Wimbledon tournament (Wimbledon) in 2010 was even later awarded a memorial plaque with information about the three-day battle. It was the perfect combination. Isner, with his heavy sweeping serve and Malyuts fast style, made them diametrically opposed. The weakness of each of them turned out to be the advantage of the other. After the match had been going on for two days, it was watched not only by tennis fans. Everyone gave up what they were doing to see if the match would ever end. After three days of Grand Slam level tennis, Isner collapsed to the ground. All the energy of his body was spent. He won the longest tennis match of all time, with a score of 70-68 in the fifth set. This match will be written about in textbooks and it will never be forgotten.'),
        ImgRadius(img: 'asset/John Isner.jpg'),
        Mytext(
            text:
                'Fabrice Santoro defeated Arnaud Clement in 2004 (the match lasted 6 hours and 33 minutes). Top 10: The longest tennis matches in history. In one of the few matches of this list that did not take place within the Davis Cup, two representatives of France met. The prize was the 2004 French Cup, but only one of them would have gone past the first round. After Santoro won the first two sets, the prospects of the tournament looked very bleak for Clement, but he was able to avoid defeat by winning the third set in a tie-break. After he unexpectedly easily won the fourth set with a score of 6-3, the fate of the match had to be decided by just one set. In fact, the match lasted so long that the last set ended only the next day. Santoro was able to fight back and won in the fifth set with a score of 16-14.'),
        ImgRadius(img: 'asset/Fabrice Santoro.jpg')
      ],
    ),
    Column(
      children: const [
        Mytext(
            text:
                '1. It is believed that the tennis term "love" in the meaning of "no points" appeared in 1792 and means "to play out of love", that is, "selflessly". However, some researchers claim that "love" as a zero score comes from the French word "L Oeuf" ("egg") due to the external similarity of the egg and zero.'),
        Mytext(
            text:
                '2. According to the rules of Grand Slam tournaments (except the US Open), if the match reaches the fifth game, it continues until one of the tennis players wins with a margin of at least two games without a tie-break. The record for the duration of such a game was set at Wimbledon 2010 by John Isner and Nicolas May, who finished it with a score of 70:68. In total, the match lasted more than 11 hours.'),
        Mytext(
            text:
                '3. The youngest Olympic champion among tennis players was American Jennifer Capriati, who was just 16 years old when she won the 1992 Barcelona Games in singles.')
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
