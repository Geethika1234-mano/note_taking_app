import 'package:flutter/material.dart';
import 'package:note_taking_app/styles/app_style.dart';

class FooterButton extends StatefulWidget {
  const FooterButton({super.key});

  @override
  State<FooterButton> createState() => _FooterButtonState();
}

class _FooterButtonState extends State<FooterButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppStyle.sideColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.check_box_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.brush_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              onPressed: () {},
              icon: Icon(
                Icons.mic_outlined,
                color: Colors.white,
              ),
            ),
            IconButton(
              padding: EdgeInsets.all(0),
              color: AppStyle.sideColor,
              onPressed: () {},
              icon: Icon(
                Icons.photo_outlined,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
