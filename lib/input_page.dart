import 'package:bmi_calculator_flutter/gender.dart';
import 'package:bmi_calculator_flutter/icon_details.dart';
import 'package:bmi_calculator_flutter/my_color_code.dart';
import 'package:bmi_calculator_flutter/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleCardColor = keveryCardColor;
  int femaleCardColor = keveryCardColor;
  Gender? selectedGender;
  int height = 180;
  int weight = 35;
  int age = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black12,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
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
                        ? const Color(kactiveCardColor)
                        : const Color(keveryCardColor),
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
                        ? const Color(kactiveCardColor)
                        : const Color(keveryCardColor),
                    cardChild: const IconDetails(
                        icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              child: ReusableCard(
            colour: const Color(keveryCardColor),
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(
                      height.toString(),
                      style: const TextStyle(
                          fontSize: 50.0, fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'cm',
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: const Color(0xFF8D8E98),
                    thumbColor: const Color(0xFFEB1555),
                    overlayColor: const Color(0x29EB1555),
                    thumbShape:
                        const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                        const RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  colour: const Color(keveryCardColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        weight.toString(),
                        style: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                  colour: const Color(keveryCardColor),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Color(0xFF8D8E98),
                        ),
                      ),
                      Text(
                        age.toString(),
                        style: const TextStyle(
                            fontSize: 50.0, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          const SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          Container(
            color: const Color(kbottomContainerColor),
            margin: const EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height: kbottomConteinerHeight,
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 6.0,
      constraints: const BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}

// The argument type 'Function' can't be assigned to the parameter type 'void Function()?'. 