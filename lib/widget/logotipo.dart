// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Logotipo extends StatelessWidget {
  final String image;
  final double width;

  const Logotipo({Key? key, required this.image, required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag:
            image, // tag deve ser a mesma na fonte e na origem pra fazer a transição
        child: Image.network(
          image,
          fit: BoxFit.contain, //ficar contida dentro do box
        ),
      ),
    );
  }
}
