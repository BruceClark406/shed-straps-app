import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shed_straps_app/home/bloc/app_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppBloc(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool expanded = true;
  bool expanding = false;
  double width = 200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('home')),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        width: width,
        color: Colors.grey,
        // onEnd: () => setState(() {
        // expanding = true;
        // }),
        child: const ListTile(
          // title: AnimatedDefaultTextStyle(
          //   duration: const Duration(milliseconds: 300),
          //   style: TextStyle(
          //     fontSize: _fontSize,
          //     color: _color,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   child: const Text('home'),
          // ),
          title: Text(
            'settings',
            overflow: TextOverflow.fade,
            softWrap: false,
          ),
          leading: Icon(Icons.settings),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<AppBloc>().add(const AddToCounter()),
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () =>
                context.read<AppBloc>().add(const DecrementFromCounter()),
            child: const Icon(Icons.remove),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                expanding = true;
                expanded = !expanded;
                width = expanded ? 200 : 70;
                expanding = true;
                expanding = false;
              });
            },
            child: const Icon(Icons.animation),
          ),
        ],
      ),
    );
  }
}

class CounterText extends StatelessWidget {
  const CounterText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        return Text('${state.value}', style: theme.textTheme.headline1);
      },
    );
  }
}
