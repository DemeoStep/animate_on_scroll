import 'package:rotating/domain/entity/pizza.dart';
import 'package:rotating/domain/repository/pizza_repository.dart';

class PizzaRepositoryImpl implements PizzaRepository {
  final List<Pizza> _pizzas = [
    Pizza(
      name: '4 Сезони',
      description:
          'Піца \'Папероні\', піца \'Ранч\', піца \'4 Сира\' та піца \'Шинка з грибами\'',
      prices: [116, 162, 219],
      asset: 'assets/pizza/4pizza.webp',
    ),
    Pizza(
        name: 'Супер М’ясо',
        description:
            'Бекон, шинка, папероні, куряча ковбаса та медова гірчиця,  моцарела, соус пелаті-базилік',
        prices: [115, 168, 211],
        asset: 'assets/pizza/super.webp'),
    Pizza(
      name: '4 Сири',
      description:
          'Збільшена моцарела, пармезан, чеддер, блакитний сир та вершковий соус',
      prices: [113, 158, 192],
      asset: 'assets/pizza/4cheeze.webp',
    ),
    Pizza(
        name: 'Гавайська',
        description:
            'Ароматна грудка курчати, моцарела та ананаси, соус пелаті-базилік',
        prices: [125, 169, 215],
        asset: 'assets/pizza/havaii.webp'),
    Pizza(
      name: 'Дон Бекон',
      description:
          'Мисливські ковбаски, подвійний бекон, моцарела, чилі, цибуля червона, соус пелаті-базилік',
      prices: [102, 144, 185],
      asset: 'assets/pizza/don_becon.webp',
    ),
    Pizza(
      name: 'МАЛюк ранЧ',
      description:
          'Збільшена моцарелла, запечене стегно курчати, томати та соус ранч',
      prices: [99, 129, 159],
      asset: 'assets/pizza/maluk_ranch.webp',
    ),
    Pizza(
      name: 'Карбонара',
      description:
          'Шинка, бекон, моцарела, печериці, цибуля червона і соус альфредо, вершковий соус',
      prices: [112, 170, 217],
      asset: 'assets/pizza/carbonara.webp',
    ),
    Pizza(
      name: 'Брусниця і Ананас',
      description:
          'Подвійна порція ананасів, брусниця свіжа, згущене молоко, цукрова пудра з ваніллю',
      prices: [98, 158, 210],
      asset: 'assets/pizza/brusnycya_ananas.webp',
    ),
    Pizza(
      name: 'Біг МіТ',
      description:
          'Копчене курча, копчений балик та бекон, збільшенна моцарела, вершковий соус та соус барбекю',
      prices: [132, 177, 218],
      asset: 'assets/pizza/big_meat.webp',
    ),
    Pizza(
      name: 'Курка та печериці',
      description:
          'Ароматне курча, печериці, моцарелла, цибуля червона та вершковий соус',
      prices: [102, 160, 209],
      asset: 'assets/pizza/kurka_pecherytsy.webp',
    ),
    Pizza(
      name: 'Курка Флорентіно',
      description:
          'Ароматне курча, соус песто, печериці, маслини, моцарела та вершковий соус',
      prices: [119, 185, 220],
      asset: 'assets/pizza/kurka_florentino.webp',
    ),
  ];

  @override
  List<Pizza> get pizzas => _pizzas.map((e) => Pizza.copyOf(e)).toList();
}
