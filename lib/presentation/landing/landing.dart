import 'package:flutter/material.dart';

import 'package:kenvinorellana/presentation/home/home_screen.dart';

class LandingView extends StatefulWidget {
  const LandingView({super.key});

  @override
  State<LandingView> createState() => _LandingViewState();
}

class _LandingViewState extends State<LandingView> {
  int index = 0;
  changeIndex(int val) {
    setState(() {
      index = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),

      bottomNavigationBar: CustomBottomNavBar(
        onTap: (e) {
          changeIndex(e);
        },
        selectedIndex: index,
      ),
    );
  }
}

class CustomBottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  const CustomBottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final items = [
      Icons.home,
      Icons.chat_bubble,
      Icons.fitness_center,
      Icons.auto_awesome,
      Icons.restaurant,
    ];
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color(0xFF3A4646),
        boxShadow: [
          BoxShadow(
            color: const Color(0x14000000),
            blurRadius: 4,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(items.length, (i) {
          final isSelected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: isSelected ? 80 : 48,
              height: 48,
              padding: EdgeInsets.symmetric(vertical: 2),
              decoration: isSelected
                  ? BoxDecoration(
                      color: const Color(0xFF263133),
                      border: Border.all(
                        color: const Color(0xFF767781),
                        width: 0.25,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    )
                  : null,
              child: Icon(items[i], color: Colors.white, size: 28),
            ),
          );
        }),
      ),
    );
  }
}
