import 'package:bmi_calculator_flutter/gender.dart';
import 'package:bmi_calculator_flutter/icon_details.dart';
import 'package:bmi_calculator_flutter/my_color_code.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomConteinerHeight = 85.0;

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleCardColor = everyCardColor;
  int femaleCardColor = everyCardColor;
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                // Male Card
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? const Color(activeCardColor)
                        : const Color(everyCardColor),
                    cardChild: const IconDetails(
                        icon: FontAwesomeIcons.mars, label: 'MALE'),
                  ),
                ),

                // Female card
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    colour: selectedGender == Gender.female
                        ? const Color(activeCardColor)
                        : const Color(everyCardColor),
                    cardChild: const IconDetails(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              child: ReusableCard(
            colour: Color(everyCardColor),
            cardChild: Column(
              children: [Text('HEIGHT')],
            ),
          )),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: Color(everyCardColor),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: Color(everyCardColor),
                )),
              ],
            ),
          ),
          Container(
            color: const Color(bottomContainerColor),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: bottomConteinerHeight,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
