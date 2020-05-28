import 'package:flutter/material.dart';
import './customButton.dart';

class Playing extends StatelessWidget {

  final int hunch;
  final void Function() restart;
  final void Function() numberSmaller;
  final void Function() numberBigger;
  final void Function(int) changeWidget;

  Playing({
    @required this.restart,
    @required this.hunch,
    @required this.numberSmaller,
    @required this.numberBigger,
    @required this.changeWidget
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'O número pensado é?',
                    style: TextStyle(fontSize: 24, height: 2, color: Colors.white)
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    hunch.toString(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      height: 2
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 50, bottom: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                      colorText: Colors.yellow,
                      text: 'MENOR',
                      size: 22,
                      press: () => numberSmaller()
                    ),
                    CustomButton(
                      colorText: Colors.cyan,
                      text: 'ACERTOU',
                      size: 22,
                      press: () => changeWidget(2)
                    ),
                    CustomButton(
                      colorText: Colors.red,
                      text: 'MAIOR',
                      size: 22,
                      press: () => numberBigger()
                    )
                  ]
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlatButton(
                    child: Icon(
                      Icons.refresh,
                      size: 30,
                    ),
                    textColor: Colors.white,
                    onPressed: () => restart()
                  )
                ]
              )
            ]
          ),
        ),
        Container(
          padding: EdgeInsets.all(15),
          decoration: BoxDecoration(
            border: Border.all(width: 1.0, color: const Color(0xFFFFFFFF)),
            borderRadius: BorderRadius.circular(3)
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'MENOR: Número pensado é MENOR que o palpitado.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 2
                ),
              ),
              Text(
                'MAIOR: Número pensado é MAIOR que o palpitado.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 2
                ),
              ),
              Text(
                'ACERTOU: Número pensado é igual ao palpitado.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 2
                ),
              ),
              Text(
                'REINICIAR: Reinicia o jogo.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  height: 2
                ),
              ),
            ]
          ),
        ),
      ],
    );
  }
}