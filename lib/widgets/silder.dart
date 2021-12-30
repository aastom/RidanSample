import 'package:flutter/material.dart';
import 'package:ridan_sample/utils/utils.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({ Key? key }) : super(key: key);

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  int indexTop = 0;
  double sliderValue = 0.0;
  double valueBottom = 20;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      child:buildSliderTopLabel()
      
    );
  }



  Widget buildSliderSideLabel() {
    final double min = 20;
    final double max = 80;
    final divisions = 4;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          buildSideLabel(min),
          Expanded(
            child: Slider(
              value: valueBottom,
              min: min,
              max: max,
              divisions: divisions,
              label: valueBottom.round().toString(),
              onChanged: (value) => setState(() => this.valueBottom = value),
            ),
          ),
          buildSideLabel(max),
        ],
      ),
    );
  }

  Widget buildSliderTopLabel() {
    final labels = ['S', 'M', 'L', 'XL', 'XXL'];
    final double min = 0;
    final double max = labels.length - 1.0;
    final divisions = labels.length - 1;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: Utils.modelBuilder(
              labels,
              (index, label) {
                final selectedColor = Colors.blue;
                final unselectedColor = Colors.blue.withOpacity(0.3);
                final isSelected = index <= indexTop;
                final color = isSelected ? selectedColor : unselectedColor;

                return buildLabel(
                    label: label.toString(), color: color, width: 30);
              },
            ),
          ),
        ),
        Slider(
          value: indexTop.toDouble(),
          min: min,
          max: max,
          divisions: divisions,
          // label: labels[indexTop],
          onChanged: (value) => setState(() => this.indexTop = value.toInt()),
        ),
      ],
    );
  }

  Widget buildLabel({
    required String label,
    required double width,
    required Color color,
  }) =>
      Container(
        width: width,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ).copyWith(color: color),
        ),
      );

  Widget buildSideLabel(double value) => Container(
        width: 25,
        child: Text(
          value.round().toString(),
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      );
}