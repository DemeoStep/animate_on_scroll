import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rotating/domain/repository/pizza_repository_impl.dart';
import 'package:rotating/widget/logo.dart';
import 'package:rotating/widget/menu_tile.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();
  final _pizzaRepository = PizzaRepositoryImpl();

  bool _isExpanded = false;
  double angle = 0.0;
  final offset = 27;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent.withOpacity(0.3).withRed(
          (255 - 255 / _pizzaRepository.pizzas.length * (angle ~/ offset))
              .toInt()),
      resizeToAvoidBottomInset: true,
      body: Center(
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            setState(() {
              angle = notification.metrics.pixels / 10;
              _isExpanded = notification.metrics.pixels > 175;
            });
            print(notification.metrics.pixels);
            return true;
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverAppBar(
                      backgroundColor: Colors.transparent,
                      surfaceTintColor: Colors.transparent,
                      expandedHeight: 180,
                      collapsedHeight: 120,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        // statusBarBrightness:
                        //     _isExpanded ? Brightness.light : Brightness.dark,
                        // statusBarIconBrightness:
                        //     _isExpanded ? Brightness.light : Brightness.dark,
                        statusBarColor: _isExpanded
                            ? Colors.transparent
                            : Colors.deepPurple.withOpacity(0.5),
                      ),
                      flexibleSpace: Stack(children: [
                        Positioned.fill(
                          child: Image.asset(
                            'assets/pizza_big.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Logo(
                          angle: angle,
                          isExpanded: _isExpanded,
                        ),
                      ]),
                    ),
                    SliverPadding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(List.generate(
                            _pizzaRepository.pizzas.length,
                            (index) => MenuTile(
                                  pizza: _pizzaRepository.pizzas[index],
                                  centered: angle ~/ offset <
                                          _pizzaRepository.pizzas.length
                                      ? index == angle ~/ offset
                                      : index ==
                                          _pizzaRepository.pizzas.length - 1,
                                ))),
                      ),
                    ),
                    const SliverPadding(
                      padding: EdgeInsets.only(
                          top: 20, bottom: 150, left: 20, right: 20),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'З сирним',
                              style: TextStyle(
                                fontSize: 70,
                                height: 1.2,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Text(
                              'бортиком',
                              style: TextStyle(
                                fontSize: 53,
                                height: 1.2,
                                color: Colors.yellowAccent,
                              ),
                            ),
                            Text(
                              'смачніше!',
                              style: TextStyle(
                                fontSize: 40,
                                height: 1.5,
                                color: Colors.yellowAccent,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: -170,
                top: MediaQuery.sizeOf(context).height - 230,
                child: Transform.rotate(
                  angle: angle / 30,
                  child: IgnorePointer(
                    child: Image.asset(
                      _pizzaRepository
                          .pizzas[
                              angle ~/ offset < _pizzaRepository.pizzas.length
                                  ? angle ~/ offset
                                  : _pizzaRepository.pizzas.length - 1]
                          .asset,
                      width: 400,
                      height: 400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
