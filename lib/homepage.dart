import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoapp_yellow/dialog_box.dart';
import 'package:todoapp_yellow/todo_tile.dart';
import 'package:todoapp_yellow/veritabani.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  NotDefteriVeritabani db = NotDefteriVeritabani();

  @override
  void initState() {
    // uygulama ilk defa açılıyorsa
    if (_myBox.get("YAPILACAKLAR LİSTESİ") == null) {
      db.createInitialData();
    } else {
      // daha önce açılmışsa varolan veriyi göster
      db.veriYukle();
    }
    super.initState();
  }
  // text controller
  final _controller = TextEditingController();

  // checkbox tıklandı
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.veritabaniGuncelle();

  }

  // yeni görev kaydet
  void yeniGorevKaydet(){
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.veritabaniGuncelle();
  }

  // yeni görev ekle
  void yeniGorevEkle(){
    showDialog(context: context, builder: (context)
      {
      return DialogBox(
        controller: _controller,
        kayitEt: yeniGorevKaydet,
        iptalEt: () => Navigator.of(context).pop(),
      );
      },
    );

  }

  // görevi sil
  void goreviSil(int index){
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.veritabaniGuncelle();

  }
  double topBarHeight = 50;

  @override
  Widget build(BuildContext context) {
    double StatusBarHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.yellow, // <-- SEE HERE
        statusBarIconBrightness: Brightness.dark,),
          //title: Text('NOT DEFTERİ', textAlign: TextAlign.center,),
          //centerTitle: true,
          /*flexibleSpace: Center(
            child: Container(
              child: Align(
                alignment: Alignment.center,
                child: Text("NOT DEFTERİ", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),),
              ),
            ),
          ),
          */
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.calendar_today_outlined, color: Colors.black, size: 30,),
                Text("NOT DEFTERİ", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
                ),
                SizedBox(height: 120,),
              ],
            ),
          ),
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(50), bottomLeft: Radius.circular(50))
        ),
      ),
/*
      floatingActionButton: Container(
        height: 70,
        width: 70,
        child: Material(
          type: MaterialType
              .transparency,
          child: Ink(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              color: Colors.yellow,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: yeniGorevEkle,
              child: Icon(Icons.add, size: 28,),
            ),
          ),
        ),
      ),

 */

      floatingActionButton: SizedBox(
        height: 60,
        width: 120,
        child: FloatingActionButton.extended(
          label: const Text('Ekle', style: TextStyle(fontSize: 16),),
          icon: const Icon(Icons.add, size: 26,),
          onPressed: yeniGorevEkle,
          splashColor: Colors.black,
        ),
      ),

      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
              gorevAdi: db.toDoList[index][0],
              gorevTamamlandi: db.toDoList[index][1],
              onChanged: (value) => checkBoxChanged(value, index),
              deleteFunction: (context) => goreviSil(index),
          );
        },

      ),
    );
  }
}
