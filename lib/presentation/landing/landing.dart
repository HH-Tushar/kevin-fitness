import 'package:flutter/material.dart';
import 'package:kenvinorellana/application/auth/auth_controller.dart';

import 'package:kenvinorellana/presentation/home/home_screen.dart';
import 'package:kenvinorellana/providers/daily_plan_provider.dart';
import 'package:kenvinorellana/translation/localization.dart';
import 'package:provider/provider.dart';

import '../chat/chat_view.dart';
import '../home/home_controller.dart';
import '../meal_track/daily_track/meal_track.dart';
import '../plan_generator/ai_gen_landing/plan_generator.dart';
import '../workout_track/daily_track/workout_track.dart';
part 'controller.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => _LandingController(context: context),
      child: _Layout(),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({super.key});

  @override
  Widget build(BuildContext context) {
    final _LandingController controller = context.watch();
    return Scaffold(
      body: controller.children[controller.index],

      bottomNavigationBar: CustomBottomNavBar(
        onTap: (e) {
          controller.changeIndex(e);
        },
        selectedIndex: controller.index,
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
