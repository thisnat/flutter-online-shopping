import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:online_shopping/providers/cart_item_provider.dart';
import 'package:online_shopping/providers/saved_item_provider.dart';
import 'package:online_shopping/screens/cart_screen.dart';
import 'package:online_shopping/screens/checkout_screen.dart';
import 'package:online_shopping/screens/home_screen.dart';
import 'package:online_shopping/screens/product_screen.dart';
import 'package:online_shopping/screens/saved_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SavedItemProvider()),
        ChangeNotifierProvider(create: (_) => CartItemProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MyHomePage(),
          '/product': (context) => const ProductScreen(),
          '/checkout': (context) => const CheckoutScreen()
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  String _title = "Recommendations";

  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Home', icon: FaIcon(FontAwesomeIcons.house)),
    const Tab(text: 'Saved', icon: FaIcon(FontAwesomeIcons.solidHeart)),
    const Tab(text: 'Cart', icon: FaIcon(FontAwesomeIcons.cartShopping)),
  ];

  final List<Widget> myPages = <Widget>[
    const HomeScreen(),
    const SavedScreen(),
    const CartScreen(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);

    _tabController.addListener(() {
      setState(() {
        if (_tabController.index == 0) {
          _title = "Recommendations";
        } else {
          _title = myTabs[_tabController.index].text!;
        }
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        centerTitle: false,
        title: Text(_title),
      ),
      body: TabBarView(
          controller: _tabController,
          children: myPages.map((page) {
            return page;
          }).toList()),
      bottomNavigationBar: SafeArea(
        child: Container(
          color: Colors.white,
          child: TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            indicatorColor: Colors.black,
            tabs: myTabs.map((Tab tab) {
              return tab;
            }).toList(),
          ),
        ),
      ),
    );
  }
}
