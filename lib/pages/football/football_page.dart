import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/theme.dart';
import 'package:provider/provider.dart';
import '../../comuunism/comuunism_model.dart';

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
                  height: 200,
                  decoration: BoxDecoration(
                      gradient: MyTheme.colorGradient2(),
                      borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(40))),
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

/// по хорошему большую часть перенести в модель , переменные и функции и сделать
/// этот класс StateLess
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
    'известные игроки',
    'топ 3 лучших команд',
    '3 факта'
  ];

  // здесь хуяриш точто будет внутри , виджет который будет оторажаться внутри
  final List _listOpisanie = <Widget>[
    Column(
      children: [
        const Text(
            ' Начнём этот топ с величайшего вратаря в истории. Единственного игрока своего амплуа, который получил Золотой мяч. Лев Яшин. Лучший вратарь 20-го века по версиям FIFA, Международной федерации футбольной истории и статистики, журналов «World Soccer», «France Football» и «Placar». Игра вратаря была успешной благодаря умению читать игру. Он мог одновременно контролировать мяч и выбирать партнёра для передачи. Лев Иванович 11 раз признавался лучшим вратарём СССР, был пятикратным чемпионом СССР в составе «Динамо». В сборной Яшин стал Олимпийским чемпионом в 1956 году и обладателям кубка Европы 60-го года. Из 812 сыгранных матчей 207 Яшин отстаял "на ноль". В среднем пропускал около половины гола за игру.'),
        Image.asset(
          'asset/footballScreenImg2.jfif',
          fit: BoxFit.contain,
        ),
        Text(
            ' Дэвид Бекхэм. Может быть это и не лучший футболист, но то, что он перевернул футбол отрицать никак нельзя. Бекхэм выиграл шесть чемпионских титулов и Лигу Чемпионов с «МЮ», выиграл чемпионат Испании в составе «Реала» в 2007 и чемпионат Франции с «ПСЖ» в 2013. Запомнился как отличный исполнитель стандартных ударов. Но не поэтому мы поставили его в десятку. Дэвид Бекхэм настоящая медиа-икона, да все парни во дворе хотели причёску как у него. Футболист снимался в самых популярных рекламах. Он стал настоящей супер-звездой, кумиром миллионов. На его вклад в развитие футбола никак нельзя закрывать глаза и оставлять его без внимания.'),
        Text(
            'Альфредо Ди Стефано. По-настоящему уникальный игрок. Являлся третьим футболистом 20 века по версии ФИФА. По опросу Международной федерации футбольной истории и статистики занимает четвёртое место среди лучших футболистов мира 20 века, шестое место среди лучших игроков '),
        Image.asset(
          'asset/footballScreenimg3.jfif',
          height: 200,
        )
      ],
    ),
    Image.asset('asset/football.jpg'),
    Column(
      children: [
        const Text('изображение с текстом'),
        Image.asset('asset/hockey.jpg'),
      ],
    )
  ];
  ////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              InkWell(
                // меняет true на feals
                onTap: (() => setState(() => _isShow = !_isShow)),
                child: SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_listVopros[widget.index]),
                        Icon(_isShow
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ),
              ),
              ///// элементы которые будут показываться после нажатие
              if (_isShow) _listOpisanie[widget.index],
            ],
          ),
        ),
      ],
    );
  }
}
