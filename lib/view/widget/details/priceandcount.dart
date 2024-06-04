import 'package:flutter/material.dart';

class PriceAndCount extends StatelessWidget {
  final void Function()? onAdd;
  final void Function()? onRemov;
  final String count;
  final String price;
  const PriceAndCount(
      {super.key,
      required this.onAdd,
      required this.onRemov,
      required this.count,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(onPressed: onAdd, icon: Icon(Icons.add)),
            Container(
              alignment: Alignment.center,
              width: 50,
              padding: const EdgeInsets.only(bottom: 10),
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              child: Container(
                padding: EdgeInsets.only(top: 8),
                child: Text("2",
                    style: const TextStyle(fontSize: 20, height: 1.1)),
              ),
            ),
            IconButton(onPressed: onRemov, icon: Icon(Icons.remove))
          ],
        ),
        const Spacer(),
        Text(
          "$price\$",
          style: const TextStyle(
            fontSize: 25,
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
