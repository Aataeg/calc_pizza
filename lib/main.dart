import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

void main() {
  runApp(const CalcPizza());
}

double? price = 300.00;

class CalcPizza extends StatefulWidget {
  const CalcPizza({Key? key}) : super(key: key);

  @override
  _CalcPizzaState createState() => _CalcPizzaState();
}

class _CalcPizzaState extends State<CalcPizza> {
  double _sliderValue = 30.00;
  bool _cheese = false;
  int? groupValue;
  static const List<String> testo = <String>['Обычное тесто','Тонкое тесто'];
  static const List<String> sauces = <String>['Острый','Кисло-сладкий','Сырный'];

  @override
  Widget build(BuildContext context) {

    const borderStyle = OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(36)),
      borderSide: BorderSide(color: Color(0xFFECEFF1), width: 2),
    );




    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
               alignment: Alignment.topRight,
               child: SizedBox(width: 232, height: 123, child:  const Image(image: AssetImage('assets/files/pizza1.png'),),),
              ),
              const SizedBox(height: 25,),
              const SizedBox(height: 36, width: 300, child: Text('Калькулятор пиццы', style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'Inter', fontStyle: FontStyle.normal,
              ),),),
              const SizedBox(height: 9,),
              const SizedBox(height: 20, width: 179, child: Text('Выберите параметры:', style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'Inter',
              ),),),
              SizedBox(height: 33,),
              ToggleSwitch(
                minWidth: 150.0,
                minHeight: 34.0,
                cornerRadius: 36.0,
                activeBgColors: const [const [Color(0xFF0079D0)], const [Color(0xFF0079D0)]],
                activeFgColor: Colors.white,
                inactiveBgColor: Color(0xFFECEFF1),
                inactiveFgColor: Color.fromRGBO(0, 0, 0, 0.4),
                initialLabelIndex: 0,
                totalSwitches: 2,
                fontSize: 16,
                labels: testo,
                radiusStyle: true,
                onToggle: (int index) {

                },
              ),
              SizedBox(height: 19,),
              const SizedBox(height: 21, width: 300, child: Text('Размер:', style: TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF000000), letterSpacing: -0.3,
                  ),),

                  ),
              SizedBox(height: 5,),
              SizedBox(
                width: 300,
                child: Stack(
                  children: [
                    const SizedBox(
                      width: 300,
                      height: 30,
                      child: TextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xFFECEFF1),
                          enabledBorder: borderStyle,
                          focusedBorder: borderStyle,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 54,
                      child: SfSlider(
                        value: _sliderValue,
                        onChanged: (dynamic value) { setState(() {
                          _sliderValue = value;
                        });},
                        min: 30.00,
                        max: 60.00,
                        interval: 15.00,
                        stepSize: 15.00,
                        showDividers: true,
                        enableTooltip: true,
                      ),
                    ),
                  ],
                ),
              ),
//              SizedBox(height: 5,),
              const SizedBox(height: 20, width: 300, child: Text('Соус:',style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black, fontFamily: 'Inter',
              ),),),
              SizedBox(
                width: 300,
                height: 150,
                child: ListView.builder(
                  padding: const EdgeInsets.all(0.00),
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(
                      children:[
                        const SizedBox(
                          width: 300,
                          child: TextField(
                            decoration: InputDecoration(
                              fillColor: Color(0xFFE8E8E8),
                              enabled: false,
                            ),
                          ),
                        ),
                        RadioListTile<int>(
                        contentPadding: const EdgeInsets.all(0.00),
                        value: index,
                        controlAffinity: ListTileControlAffinity.trailing,
                        groupValue: groupValue,
                        activeColor: const Color(0xFF5DB075),
                        dense: true,
                        title: Text(sauces[index], style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black, fontFamily: 'Inter',
                        ),),
                        onChanged: (int? value) {
                          setState(() {
                            groupValue = value;
                          });
                        },
                      ),

                    ]);
                  },
                  itemCount: sauces.length,
                ),

              ),
              SizedBox(height: 10,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 SizedBox(
                   width: 310,
                   height: 56,
                   child: Card(
                     margin: EdgeInsets.zero,
                     color: Color(0xFFF0F0F0),
                     child: Row(
                       children: [
                         SizedBox(width: 300, height: 60, child: SwitchListTile(
                           contentPadding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                           title: const Text('Дополнительный сыр:',style: TextStyle(
                             fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black,
                             backgroundColor: Color(0xFFF0F0F0),fontFamily: 'Inter',
                           ),),
                           value: _cheese,
                           secondary: Image(image: AssetImage('assets/files/pizza-min.png'),),
                           onChanged: (bool value) {
                             setState(() {
                               _cheese = value;
                             });
                           },
                         ),),
                       ],
                     ),
                      ),
                   )

               ],
             ),
              SizedBox(height: 10,),
              const SizedBox(height: 21, width: 300, child: Text('Стоимость:', style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Color(0xFF000000),
              ),),),
              SizedBox(height: 10,),
              Stack(
                children: const [
                  SizedBox(
                  width: 300,
                  height: 34,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFFECEFF1),
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                      ),
                      enabled: true,
                    ),
                  ),

                SizedBox(
                  width: 300,
                  height: 34,
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      enabledBorder: borderStyle,
                      focusedBorder: borderStyle,
                    ),
                    enabled: false,
                  ),
                ),
                ]
              ),

              SizedBox(height: 25,),
              SizedBox(height: 42, width: 154,
                  child: ElevatedButton( onPressed: () {},
                    child: const Text('Заказать', style: TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500,),),
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xFF0079D0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22.0)
                      ),
                    ),
                  )
              ),
    ],),
    ),
    ),
    );

  }
}



