import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class MenuController extends ChangeNotifier {
  late FirebaseFirestore db;
  MenuController() {
    setap();
  }

  /// сделаешь потом приватную , а то я проверял нажатием на кнопку , но она долдна вызыватся только 1 раз (7 строка )
  setap() async {
    db = FirebaseFirestore.instance;
// первый способ
    db.collection("item").doc("MgYSOyVLxvvtA8qe1hJi").get().then(
      (DocumentSnapshot doc) {
        final data = doc.data() as Map<String, dynamic>;
        data.forEach((key, value) => print('$key  - $value'));
      },
    );

// второй способ если не ебешь шо за key
    db.collection("item").get().then(
          (res) => res.docs.forEach(
            (element) => print(element.data()),
          ),
        );
  }

  var currentIndexPage = 0;

  List category = <String>['burgers', 'Dring', 'и тд', 'и тд', 'и тд', 'тд'];

  setScreen(int index) {
    currentIndexPage = index;
    notifyListeners();
  }
}
