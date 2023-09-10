import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:note_taking_app/styles/app_style.dart'; // For color picker

void main() {
  runApp(MaterialApp(
    home: PaintPage(),
  ));
}

class PaintPage extends StatefulWidget {
  const PaintPage({Key? key}) : super(key: key);

  @override
  State<PaintPage> createState() => _PaintPageState();
}

class _PaintPageState extends State<PaintPage> {
  List<List<Offset>> strokes = <List<Offset>>[];
  List<Offset> currentStroke = <Offset>[];
  Color selectedColor = Colors.black; // Default brush color
  double strokeWidth = 5.0; // Default brush width

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          elevation: 0.0,
          backgroundColor: AppStyle.sideColor,
        ),
        body: Listener(
          onPointerDown: (details) {
            _startPaint(details.localPosition);
          },
          onPointerMove: (details) {
            _continuePaint(details.localPosition);
          },
          onPointerUp: (details) {
            _stopPaint();
          },
          child: CustomPaint(
            painter: MyPainter(strokes, selectedColor, strokeWidth),
            size: Size.infinite,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: AppStyle.sideColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.color_lens_outlined,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Open a color picker dialog to select a brush color.
                  _pickColor();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.brush,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Open a brush size picker dialog.
                  _pickBrushSize();
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
                onPressed: () {
                  // Clear the canvas.
                  setState(() {
                    strokes.clear();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Function to start painting.
  void _startPaint(Offset position) {
    setState(() {
      currentStroke = [position];
      strokes.add(currentStroke);
    });
  }

  // Function to continue painting.
  void _continuePaint(Offset position) {
    setState(() {
      if (currentStroke.isNotEmpty) {
        currentStroke.add(position);
      }
    });
  }

  // Function to stop painting.
  void _stopPaint() {
    setState(() {
      currentStroke = [];
    });
  }

  // Function to pick a brush color using a color picker dialog.
  _pickColor() async {
    Color pickedColor = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select a Color'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: selectedColor,
              onColorChanged: (color) {
                Navigator.of(context).pop(color);
              },
            ),
          ),
        );
      },
    );

    if (pickedColor != null) {
      setState(() {
        selectedColor = pickedColor;
      });
    }
  }

  // Function to pick a brush size using a slider.
  _pickBrushSize() async {
    double newBrushSize = await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Select Brush Size'),
          content: SingleChildScrollView(
            child: Slider(
              value: strokeWidth ?? 5.0, // Default brush size if null
              min: 1.0,
              max: 20.0,
              onChanged: (value) {
                // Update the current brush size as the user slides the slider.
                Navigator.of(context).pop(value);
              },
            ),
          ),
        );
      },
    );

    if (newBrushSize != null) {
      setState(() {
        strokeWidth = newBrushSize;
      });
    }
  }
}

class MyPainter extends CustomPainter {
  final List<List<Offset>> strokes;
  final Color color;
  final double strokeWidth;

  MyPainter(this.strokes, this.color, this.strokeWidth);

  @override
  void paint(Canvas canvas, Size size) {
    for (var stroke in strokes) {
      if (stroke.isNotEmpty) {
        Paint paint = Paint()
          ..color = color
          ..strokeCap = StrokeCap.round
          ..strokeWidth = strokeWidth;

        for (int i = 0; i < stroke.length - 1; i++) {
          if (stroke[i] != null && stroke[i + 1] != null) {
            // Draw a line between points to represent the stroke.
            canvas.drawLine(stroke[i], stroke[i + 1], paint);
          }
        }
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
