import 'package:flutter/material.dart';
import 'package:rotating/domain/entity/pizza.dart';
import 'package:rotating/widget/variant.dart';

class MenuTile extends StatelessWidget {
  final Pizza pizza;
  final bool centered;
  final bool isLast;

  const MenuTile({
    required this.pizza,
    this.isLast = false,
    this.centered = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5, bottom: isLast ? 360 : 15),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(45),
          bottomRight: Radius.circular(90),
        ),
        color: Colors.yellowAccent.withOpacity(centered ? 0.4 : 0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                pizza.asset,
                height: 70,
              ),
              const SizedBox(width: 10),
              Text(
                pizza.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            pizza.description,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: List.generate(
                3,
                (index) => VariantWidget(
                      asset: 'assets/checked.png',
                      variant: '${25 + index * 5} см - ${pizza.prices[index]}',
                      prefix: pizza.name,
                    )),
          ),
        ],
      ),
    );
  }
}
