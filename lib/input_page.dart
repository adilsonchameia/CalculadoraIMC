import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ibm_calculator/Icon_content.dart';
import 'package:ibm_calculator/Resuable_card.dart';
import 'constants.dart';
import 'file:///media/adilsonchameia/380ebb70-e1ce-49a4-a173-cb807e826f29/adilsonchameia/Projetos/cursoAngela/ibm_calculator/componentes/buttom.dart';
import 'file:///media/adilsonchameia/380ebb70-e1ce-49a4-a173-cb807e826f29/adilsonchameia/Projetos/cursoAngela/ibm_calculator/componentes/icons_round.dart';

//Enum
enum Gender { male, female }

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Gender selecterGender;
  int height = 100;
  int weight = 60;
  int age = 19;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            "GÊNERO",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ResuableCode(
                    onPressed: () {
                      setState(() {
                        selecterGender = Gender.male;
                      });
                    },
                    color: selecterGender == Gender.male
                        ? corAtivada
                        : inactiveCardColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.male,
                      text: "MASCULINO",
                    ),
                  ),
                ),
                Expanded(
                  child: ResuableCode(
                    onPressed: () {
                      setState(() {
                        selecterGender = Gender.female;
                      });
                    },
                    color: selecterGender == Gender.male
                        ? inactiveCardColor
                        : corAtivada,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.female,
                      text: "FEMININO",
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child: ResuableCode(
            color: corAtivada,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "ALTURA",
                  style: labelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: [
                    Text(height.toString(), style: sliderText),
                    Text(
                      "cm",
                      style: labelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xFFEB1555),
                    activeTickMarkColor: Colors.white,
                    overlayColor: Color(0x29EB1555),
                    inactiveTrackColor: Color(0xFFBDBE98),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 100.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.toInt();
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
                    child: ResuableCode(
                  color: corAtivada,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: sliderText,
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
                          SizedBox(width: 10.0),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
                Expanded(
                  child: ResuableCode(
                    color: corAtivada,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: sliderText,
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
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            onTap: () => Navigator.pushNamed(context, '/result'),
            buttonTitle: 'CALCULAR',
          ),
        ],
      ),
    );
  }
}

//shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
