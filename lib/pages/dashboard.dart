import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smmic/components/drawer.dart';
import 'package:smmic/components/grid/gridbox.dart';
import 'package:smmic/provide/provide.dart';

import 'package:smmic/subcomponents/weatherComponents/weatherWidgets.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DASHBOARD',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.grey[700],
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: const ComponentDrawer(),
      body: Consumer<UiProvider>(
        builder: (BuildContext context, UiProvider uiProvider, Widget? child) {
          return ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(0),
                child: Container(
                  height: 150,
                  width: 350,
                  decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: AssetImage('assets/background2.jpg'),
                          fit: BoxFit.cover),
                      color: uiProvider.isDark ? Colors.black12 : Colors.white,
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 6))
                      ]),
                  child: const Center(
                    child: WeatherComponentsWidget(),
                  ),
                ),
              ),
              const MyGridBox()
            ],
          );
        },
      ),
    );
  }
}
