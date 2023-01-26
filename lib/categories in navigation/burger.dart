import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../comuunism/comuunism_model.dart';
import '../theme/theme.dart';
import '../widget/text.dart';

class Burger extends StatefulWidget {
  const Burger({super.key});
  @override
  State<Burger> createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  CommunismModel? _model;
  @override
  void didChangeDependencies() {
    if (_model == null) {
      final CategoriesKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = CommunismModel(CategoriesKey: CategoriesKey);
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
                            'Burger',
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
    'small burger size',
    'average burger size',
    'large burger size'
  ];

  final List _listOpisanie = <Widget>[
    Row(
      children: const [
        Mytext(
            text:
                ' Mark Spitz. The champion has had a love for swimming since childhood. At the age of 3, he was already swimming well, at 5 he began to compete, and at 10 he won his first victories and became the owner of 17 national and 1 world records. When the swimmer was 15, he won 4 gold medals at the Olympic Games in Maccabi and not (Israel). Mark Spitz is a pioneer who managed to win 7 gold medals at the Olympic Games in 1972 in Munich. Each of the awards was supplemented with a world record. After these games, the swimmer ended his sports career. In total, Mark Spitz set 33 world records.'),
        ImgRadius(img: 'asset/Mark Spitz.jpg'),
        Mytext(
            text:
                ' Michael Phelps can be safely called one of the greatest and most honored swimmers in history. Phelps sports career is a series of endless victories and achievements! The champion started setting records at the age of 16. In total, he has 28 Olympic medals and 29 individual world records in his arsenal. In 2001, Michael Phelps set his first world record in butterfly swimming at a distance of 200 meters. The next glory came to the athlete 3 years later at the Olympics in Athens: 8 awards, 6 of them – gold medals! At the championship in Melbourne in 2007, Michael Phelps confidently took 7 more gold medals. A year later, at the Beijing Olympics, the swimmer again surprises the world with his victories. Michael won 8 gold medals, beating Mark Spitzs record, which lasted for 36 years (7 gold medals at one Olympic Games). The athletes career ended in 2016. He is now married to model Nicole Johnson, they have two children.'),
        ImgRadius(img: 'asset/Michael Phelps.jpg'),
      ],
    ),
    Row(
      children: const [
        Mytext(
            text:
                ' Eamonn Sullivan. He is an Australian swimmer, sprinter, three-time Olympic medalist and twice world record holder. In 2008, at the age of 23, at a competition in Sydney (Australia) for selection for the Olympic Games, Imon set a world record in the 50-meter freestyle long water. He swam in 21.28 seconds. After that, Sullivan became the fastest swimmer in history at that time. His record lasted a year and one month. At the age of 29, he announced the termination of his professional sports career. He retired from swimming due to overloads and deteriorating health. Now he participates in amateur competitions in open water, skiing and raising his son.'),
        ImgRadius(img: 'asset/Eamonn Sullivan.jpg'),
        Mytext(
            text:
                'Frederick Busquet. French swimmer, medalist of the Olympic Games in Beijing, World and European Championships. He broke Eamon Sullivans record at the French Championships in 2009. At that time, a 27-year-old French swimmer swam a similar distance in 20.94 seconds. Now Frederick is raising children and riding a bike'),
        ImgRadius(img: 'asset/Frederick Busquet.jpg')
      ],
    ),
    Row(
      children: const [
        Mytext(
            text:
                '1. According to the survey, the most popular sport among Russians is swimming. 16% of women and 12% of men regularly visit the pool.'),
        Mytext(
            text:
                '2. Already 3 weeks after the birth of the baby, you can teach swimming. After the third month of life, the innate ability to stay on the water is lost.'),
        Mytext(
            text:
                '3. Human body weight decreases 10 times in water. Even someone who has never played sports can train in the pool.')
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
