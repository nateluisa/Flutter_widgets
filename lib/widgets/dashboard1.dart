import 'package:flutter/material.dart';
import 'package:flutter_api/screens/emissao.dart';
import 'package:flutter_api/screens/recebimento.dart';
import 'package:flutter_api/screens/transferencia.dart';
import 'package:flutter_api/widgets/picture_card.dart';

class FirstDashboard extends StatelessWidget {
  const FirstDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(15),
      crossAxisSpacing: 8,
      mainAxisSpacing: 3,
      crossAxisCount: 1,
      //primary: false,
      childAspectRatio: 4 / 2,
      children: <Widget>[
        Card(
          elevation: 8,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => Emissao(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage("assets/images/emissao.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
        MyPictureCard(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contextNew) => const Emissao(),
              ),
            );
          },
          image: const AssetImage('assets/images/recebimento.png'),
        ),
        Card(
          elevation: 7,
          shadowColor: Colors.black,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          color: Colors.transparent,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (contextNew) => Transferencia(),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage("assets/images/transferencia.png"),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
