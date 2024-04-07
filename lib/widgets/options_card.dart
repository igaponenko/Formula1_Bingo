import 'package:flutter/material.dart';

class OptionsCard extends StatefulWidget {
  final Function(int) onTap;
  final List<Color> cellColors;
  const OptionsCard({Key? key, required this.onTap, required this.cellColors}) : super(key: key);

  @override
  _OptionsCardState createState() => _OptionsCardState();
}

class _OptionsCardState extends State<OptionsCard> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 4.0,
        mainAxisSpacing: 4.0,
      ),
      itemCount: 16,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => widget.onTap(index),
          child: Container(
            color: widget.cellColors[index],
            child: Center(
              child: Text(
                '$index',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}