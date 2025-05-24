import 'package:flutter/material.dart';

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({Key? key}) : super(key: key);

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

enum Gender { male, female, none }

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  Gender selectedGender = Gender.none;
  int height = 180;
  int weight = 63;
  int age = 19;

  void calculateBMI() {
    double bmi = weight / ((height / 100) * (height / 100));
    String result = bmi.toStringAsFixed(1);
    String interpretation;
    String category;

    if (bmi < 18.5) {
      category = 'UNDERWEIGHT';
      interpretation = 'You have a lower than normal body weight. Try to eat more.';
    } else if (bmi >= 18.5 && bmi < 25) {
      category = 'NORMAL';
      interpretation = 'You have a normal body weight. Good job!';
    } else if (bmi >= 25 && bmi < 30) {
      category = 'OVERWEIGHT';
      interpretation = 'You have a higher than normal body weight. Try to exercise more.';
    } else {
      category = 'OBESE';
      interpretation = 'You have a much higher than normal body weight. Try to exercise more and maintain a healthy diet.';
    }

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF1D1E33),
        title: const Text(
          'YOUR BMI RESULT',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              category,
              style: const TextStyle(
                color: Color(0xFF24D876),
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              result,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              interpretation,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'OK',
              style: TextStyle(
                color: Color(0xFFEB1555),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); //
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GenderCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? const Color(0xFF1D1E33)
                        : const Color(0xFF111328),
                    cardChild: const GenderCardContent(
                      icon: Icons.male,
                      label: 'MALE',
                    ),
                  ),
                ),
                Expanded(
                  child: GenderCard(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? const Color(0xFF1D1E33)
                        : const Color(0xFF111328),
                    cardChild: const GenderCardContent(
                      icon: Icons.female,
                      label: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                      const Text(
                        'cm',
                        style: TextStyle(
                          fontSize: 18.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      thumbColor: const Color(0xFFEB1555),
                      overlayColor: const Color(0x29EB1555),
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
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
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: InfoCard(
                    label: 'AGE',
                    value: age,
                    onAdd: () => setState(() => age++),
                    onRemove: () => setState(() {
                      if (age > 1) age--;
                    }),
                  ),
                ),
                Expanded(
                  child: InfoCard(
                    label: 'WEIGHT (kg)',
                    value: weight,
                    onAdd: () => setState(() => weight++),
                    onRemove: () => setState(() {
                      if (weight > 1) weight--;
                    }),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: calculateBMI,
            child: Container(
              color: const Color(0xFFEB1555),
              margin: const EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: 80.0,
              child: const Center(
                child: Text(
                  'CALCULATE',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenderCard extends StatelessWidget {
  final Color color;
  final Widget cardChild;
  final VoidCallback onTap;

  const GenderCard({
    Key? key,
    required this.color,
    required this.cardChild,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: cardChild,
      ),
    );
  }
}

class GenderCardContent extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderCardContent({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
          color: Colors.white,
        ),
        const SizedBox(height: 15.0),
        Text(
          label,
          style: const TextStyle(fontSize: 18.0, color: Color(0xFF8D8E98)),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const InfoCard({
    Key? key,
    required this.label,
    required this.value,
    required this.onAdd,
    required this.onRemove,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
        color: const Color(0xFF1D1E33),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 18.0,
              color: Color(0xFF8D8E98),
            ),
          ),
          Text(
            value.toString(),
            style: const TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(icon: Icons.remove, onPressed: onRemove),
              const SizedBox(width: 10.0),
              RoundIconButton(icon: Icons.add, onPressed: onAdd),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0.0,
      constraints: const BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
