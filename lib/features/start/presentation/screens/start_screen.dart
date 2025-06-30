import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/generated/assets.gen.dart';
import 'package:budget_tracker/router/router.dart';
import 'package:budget_tracker/uikit/uikit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _verticalOffset;

  @override
  void initState() {
    super.initState();
    // контроллер для вращения монеток и доната
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat();

    // анимация для вертикального смещения монеток и доната
    _verticalOffset = Tween<double>(begin: -20, end: 20).animate(
      CurvedAnimation(parent: _controller, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Stack(
      children: [
        Container(color: Colors.white),
        _CustomBackground(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SafeArea(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 120),
                        child: Assets.startMain.image(fit: BoxFit.contain),
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Positioned(
                            left: 50,
                            top: 130 +
                                _verticalOffset.value *
                                    sin(_controller.value * pi + pi),
                            child: RotationTransition(
                              turns: _controller,
                              child: Assets.startCoin.image(width: 80),
                            ),
                          );
                        },
                      ),
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Positioned(
                            right: 50,
                            top: 180 +
                                _verticalOffset.value *
                                    sin(_controller.value * pi),
                            child: RotationTransition(
                              turns: _controller,
                              child: Assets.startDonut.image(width: 80),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  Text(
                    'Spend smarter\nSave more',
                    textAlign: TextAlign.center,
                    style: textTheme.titleLarge?.copyWith(
                      fontSize: 36,
                      color: AppColors.tiffanyText,
                    ),
                  ),
                  const SizedBox(height: 26),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          context.router.push(const SignUpRoute());
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          backgroundColor: const Color(0xFF4CA293),
                          shadowColor: Colors.black26,
                          elevation: 50,
                        ),
                        child: Text(
                          'Get Started',
                          style: textTheme.bodyLarge?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 17),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Already have an account? ',
                          style: textTheme.bodySmall?.copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextSpan(
                          text: 'Log in',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppColors.tiffanyText,
                            fontWeight: FontWeight.w600,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              context.router.push(const SignInRoute());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _CustomBackground extends StatelessWidget {
  const _CustomBackground({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(300, 300),
      painter: _BackgroundPainter(),
      child: child,
    );
  }
}

class _BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.tiffanyBackground;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(0, size.height * 0.64) // диагональный нижний край
      ..lineTo(size.width, size.height * 0.68)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);

// Новый Paint для окружностей
    final circlePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    // Примеры окружностей внутри трапеции
    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.35),
      size.width * 0.75,
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.35),
      size.width * 0.60,
      circlePaint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.5, size.height * 0.35),
      size.width * 0.45,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
