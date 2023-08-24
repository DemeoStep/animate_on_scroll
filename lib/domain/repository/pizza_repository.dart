import 'package:rotating/domain/entity/pizza.dart';

abstract class PizzaRepository {
  List<Pizza> get pizzas;
}
