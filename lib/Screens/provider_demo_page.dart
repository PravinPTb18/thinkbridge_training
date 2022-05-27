import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:tb_practice/Providers/data_provider.dart';
import 'package:tb_practice/Providers/theme_provider.dart';

class ProviderDemoPage extends StatelessWidget {
  const ProviderDemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider Demo ${context.watch<NewData>().age}"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("User Age is ${context.watch<NewData>().age}"),
            ElevatedButton(
                onPressed: () => context.read<NewData>().increaseAge(),
                child: const Text("Increase age")),
            ElevatedButton(
                onPressed: () => context.read<NewData>().decreaseAge(),
                child: const Text("Decrease age")),
            ElevatedButton(
                onPressed: () => context
                    .read<ThemeProvider>()
                    .changeThemeColor(Colors.amber),
                child: const Text("Change Theme")),
          ],
        ),
      ),
    );
  }
}
