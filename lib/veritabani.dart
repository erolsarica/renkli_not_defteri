import 'package:hive_flutter/hive_flutter.dart';

class NotDefteriVeritabani {
  List toDoList = [];

  // referece our box
  final _myBox = Hive.box('mybox');

  // uyguluma ilk defa açıldığında bu metot çalışacak
  void createInitialData() {
    toDoList = [
      ["İlk Not (Silmek için yana kaydırın!)", false],

    ];

  }

  // veriyi veritabanından yükle

  void veriYukle(){
    toDoList = _myBox.get("YAPILACAKLAR LİSTESİ");
  }

  // veritabanını güncelle

  void veritabaniGuncelle(){
    _myBox.put("YAPILACAKLAR LİSTESİ", toDoList);
  }


}