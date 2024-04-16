// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
// //状态管理

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/', // 设置初始路由
//       routes: {
//         '/': (context) => FirstScreen(), // 设置路由映射表
//         '/second': (context) => SecondScreen(),
//       },
//     );
//   }
// }

// class FirstScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('First Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // 导航到第二个页面
//             Navigator.pushNamed(context, '/second');
//           },
//           child: Text('Go to Second Screen'),
//         ),
//       ),
//     );
//   }
// }

// class SecondScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Second Screen')),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // 返回到上一个页面
//             Navigator.pop(context);
//           },
//           child: Text('Go Back'),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'Returning Data',
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Return data demo'),
      ),
      body: const Center(child: SelectionButton()),
    );
  }
}

class SelectionButton extends StatefulWidget {
  const SelectionButton({super.key});

  @override
  State<SelectionButton> createState() => _SelectionButtonState();
}

class _SelectionButtonState extends State<SelectionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          _navigateAndDisplaySelection(context);
        },
        child: const Text('Select one of the button later'));
  }

  Future<void> _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SelectionScreen()));

    // if (!context.mounted) return;

    ScaffoldMessenger.of(context)
      ..removeCurrentMaterialBanner()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }
}

class SelectionScreen extends StatelessWidget {
  const SelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick an option'),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Yep!');
                  },
                  child: const Text('Yep!'))),
          Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, 'Nope!');
                  },
                  child: const Text('Nope!'))),
        ]),
      ),
    );
  }
}
