import 'dart:convert';

import 'package:Junior/details_page/components/novel_data.dart';
import 'package:Junior/homepage/body.dart';
import 'package:Junior/model/novel.dart';
import 'package:flutter/material.dart';

class Buttons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        EditButton(
          innerText: 'Update Details',
          buttonColor: Color.fromRGBO(50, 155, 196, 1.0),
          textColor: Colors.white,
          onPressed: () {
            if (NovelData.isChanged) {
              NovelData.novel.lastEdited = DateTime.now();
              saveNovelList(novelList);
            }
          },
        ),
        SizedBox(height: 10),
        EditButton(
          innerText: 'Delete Novel',
          buttonColor: Color.fromRGBO(182, 47, 47, 1.0),
          textColor: Colors.white,
          onPressed: () {
            print('delet');
          },
        ),
        SizedBox(height: 10),
        EditButton(
          innerText: 'Go Back',
          buttonColor: Color.fromRGBO(142, 142, 142, 1.0),
          textColor: Colors.white,
          onPressed: () {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
          },
        ),
      ],
    );
  }
}

class EditButton extends StatelessWidget {
  String innerText;
  Color buttonColor;
  Color textColor;
  VoidCallback onPressed;

  EditButton({
    @required this.innerText,
    @required this.buttonColor,
    @required this.textColor,
    @required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: buttonColor,
      borderRadius: BorderRadius.circular(6.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(6),
          width: double.infinity,
          child: Text(innerText,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center),
        ),
      ),
    );
  }
}
