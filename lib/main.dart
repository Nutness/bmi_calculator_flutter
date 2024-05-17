import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const bottomConteinerHeight = 85.0;
// This everyCardColor is also used as inactiveColor
const everyCardColor = (0xFF1D1E33);
const activeCardColor = (0xFF111328);
const bottomContainerColor = (0xFFEB1555);
void main() => runApp(const BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: const ColorScheme(
          primary: Color.fromARGB(255, 121, 62, 142),
          onPrimary: Colors.white,
          secondary: Color.fromARGB(255, 6, 6, 7),
          onSecondary: Colors.white,
          error: Color(0xFF0A0E21),
          onError: Colors.white,
          surfaceContainerHighest: Colors.white,
          surface: Color.fromARGB(255, 121, 62, 142),
          onSurface: Color.fromARGB(255, 0, 0, 0),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        textTheme: const TextTheme(bodyLarge: TextStyle(color: Colors.white)),
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int maleCardColor = everyCardColor;
  int femaleCardColor = everyCardColor;

  void updateColor(int gender) {
    debugPrint("$gender card is clicked");

    if (gender == 0) {
      // if gender is male
      setState(() {
        if (maleCardColor == activeCardColor) {
          // if gender card is not active, activate
          maleCardColor = everyCardColor;
        } else if (maleCardColor == everyCardColor) {
          // if gender card is active, deactivate
          maleCardColor = activeCardColor;
        }
      });
    } else if (gender == 1) {
      // if gender is female
      setState(() {
        if (femaleCardColor == activeCardColor) {
          // if gender card is not active, activate
          femaleCardColor = everyCardColor;
        } else if (femaleCardColor == everyCardColor) {
          // if gender card is active, deactivate
          femaleCardColor = activeCardColor;
        }
      });
    }
  }

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
                  child: GestureDetector(
                    onTap: () {
                      updateColor(0);
                    },
                    child: ReusableCard(
                      colour: Color(maleCardColor),
                      cardChild: const IconDetails(
                          icon: FontAwesomeIcons.mars, label: 'MALE'),
                    ),
                  ),
                ),

                // Female card
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      updateColor(1);
                    },
                    child: ReusableCard(
                      colour: Color(femaleCardColor),
                      cardChild: const IconDetails(
                          icon: FontAwesomeIcons.venus, label: 'FEMALE'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Expanded(
              child: ReusableCard(
            colour: Color(everyCardColor),
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

class IconDetails extends StatelessWidget {
  const IconDetails({
    super.key,
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.colour,
    this.cardChild,
  });

  final Color colour;
  final Widget? cardChild;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: colour,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: cardChild,
    );
  }
}
