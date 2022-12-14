import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String gorevAdi;
  final bool gorevTamamlandi;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  ToDoTile({
  super.key,
  required this.gorevAdi,
  required this.gorevTamamlandi,
  required this.onChanged,
  required this.deleteFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 20.0),
      child: Slidable(/*
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
                onPressed: deleteFunction,
                icon: Icons.edit,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            )

          ],
        ),*/
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deleteFunction,
              icon: (Icons.delete),
              backgroundColor: Colors.black,
              borderRadius: BorderRadius.circular(12),
            )
          ],
        ),

      child: Container(
        padding: EdgeInsets.all(18),
        child: Row(
        children: [
          //Check Box
          Checkbox(
            value: gorevTamamlandi,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),

          //Görev
          Flexible(
            child: Text(gorevAdi,
              style: TextStyle(decoration: gorevTamamlandi
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,),
              maxLines: 5,
              softWrap: false,
              overflow: TextOverflow.ellipsis,

            ),
          ),
        ],
        ),
        decoration: BoxDecoration(
        color: Colors.yellow,
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(12)),
      ),
    ),

    );
  }
}
