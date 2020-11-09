import 'package:celer_pesquisa_app/constantes.dart';
import 'package:flutter/material.dart';

class CardReutilizavel extends StatelessWidget {
  CardReutilizavel(
      {@required this.colour, this.onPress, this.msg, this.widget});

  final Color colour;
  final String msg;
  final Widget widget;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: EdgeInsets.all(30.0),
        child: Text(
          msg, // posso passar um $ para achar o número dinamicamente
          style: kLargeButtonTextStyle,
        ),
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

//=====

// class CardReutilizavel {
//   CardReutilizavel(
//       {@required this.colour, this.onPress, this.msg, this.widget});
//
//   final Color colour;
//   final Future<String> msg;
//   final Widget widget;
//   final Function onPress;
//
//   // @override
//   // Widget build(BuildContext context)  {
//   //   return GestureDetector (
//   //     onTap: onPress,
//   //     child: Container(
//   //       padding: EdgeInsets.all(30.0),
//   //       child: Text(
//   //         msg, // posso passar um $ para achar o número dinamicamente
//   //         style: kLargeButtonTextStyle,
//   //       ),
//   //       margin: EdgeInsets.all(15.0),
//   //       decoration: BoxDecoration(
//   //         color: colour,
//   //         borderRadius: BorderRadius.circular(10.0),
//   //       ),
//   //     ),
//   //   );
//   // }
//
//   @override
//   Future<Widget> card() async {
//     var newContainer =
//        Container(
//         padding: EdgeInsets.all(30.0),
//         child: Text(
//          await msg, // posso passar um $ para achar o número dinamicamente
//           style: kLargeButtonTextStyle,
//         ),
//         margin: EdgeInsets.all(15.0),
//         decoration: BoxDecoration(
//           color: colour,
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//       );
//   return newContainer;
//   }
//
// }
