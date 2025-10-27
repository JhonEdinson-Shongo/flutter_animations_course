import 'package:designs_1/src/themes/app_theme.dart';
import 'package:designs_1/src/widgets/radial_progress.dart';
import 'package:flutter/material.dart';

class CustomProgressPage extends StatefulWidget {
  const CustomProgressPage({super.key});

  @override
  State<CustomProgressPage> createState() => _CustomProgressPageState();
}

class _CustomProgressPageState extends State<CustomProgressPage>
    with SingleTickerProviderStateMixin {
  double progress = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Bar'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Circular Progress por defecto',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20.0),
              const Center(
                child: CircularProgressIndicator(),
              ),
              const SizedBox(height: 20.0),
              Text('Circular Progress custom',
                  style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: RadialProgress(
                      progress: progress,
                      stroke: 7.0,
                      secondStroke: 3.0,
                      animationDuration: 300,
                      colorProgress: AppTheme.primary,
                      colorBackground: Colors.grey,
                      curve: Curves.easeInOutQuart,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: RadialProgress(
                      progress: progress,
                      stroke: 7.0,
                      secondStroke: 3.0,
                      animationDuration: 2000,
                      colorProgress: AppTheme.secondary,
                      colorBackground: Colors.grey,
                      curve: Curves.easeInOutQuart,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: RadialProgress(
                      progress: progress,
                      stroke: 7.0,
                      secondStroke: 3.0,
                      animationDuration: 700,
                      colorProgress: Colors.teal,
                      colorBackground: Colors.grey,
                      curve: Curves.easeInOutQuart,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: RadialProgress(
                      progress: progress,
                      stroke: 7.0,
                      secondStroke: 3.0,
                      animationDuration: 1300,
                      colorProgress: Colors.purple,
                      colorBackground: Colors.grey,
                      curve: Curves.easeInOutQuart,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 'btn1',
            child: const Icon(Icons.arrow_circle_up_sharp),
            onPressed: () => setState(() {
              if (progress >= 0.99) return;
              progress += 0.1;
            }),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: 'btn2',
            child: const Icon(Icons.restart_alt),
            onPressed: () => setState(() {
              progress = 0.0;
            }),
          ),
          const SizedBox(height: 10.0),
          FloatingActionButton(
            heroTag: 'btn3',
            child: const Icon(Icons.arrow_circle_down_sharp),
            onPressed: () => setState(() {
              if (progress <= 0.0) return;
              progress -= 0.1;
            }),
          ),
        ],
      ),
    );
  }
}
