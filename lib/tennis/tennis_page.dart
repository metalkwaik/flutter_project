import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../comuunism/comuunism_model.dart';
import '../theme/theme.dart';

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
        child: const TennisWidget(),
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}

class TennisWidget extends StatelessWidget {
  const TennisWidget({super.key, required});
  @override
  Widget build(BuildContext context) {
    final sport = context.read<CommunismModel>().sport(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: MyTheme.colorGradient(),
        child: Column(
          children: [
            Text(
              sport.discri,
              style: const TextStyle(color: Colors.amber),
            ),
          ],
        ),
      ),
    );
  }
}
