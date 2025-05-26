// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';

// @RoutePage()
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});

//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }

// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _emailController = TextEditingController();
//   final _passwordController = TextEditingController();

//   bool _isValidEmail(String email) {
//     return RegExp(
//       r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
//     ).hasMatch(email);
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Регистрация'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _nameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Имя',
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Пожалуйста, введите имя';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _emailController,
//                 decoration: const InputDecoration(
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//                 keyboardType: TextInputType.emailAddress,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Пожалуйста, введите email';
//                   }
//                   if (!_isValidEmail(value)) {
//                     return 'Пожалуйста, введите корректный email';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 16),
//               TextFormField(
//                 controller: _passwordController,
//                 decoration: const InputDecoration(
//                   labelText: 'Пароль',
//                   border: OutlineInputBorder(),
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Пожалуйста, введите пароль';
//                   }
//                   if (value.length < 6) {
//                     return 'Пароль должен содержать минимум 6 символов';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 24),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     // TODO: Implement sign up logic
//                   }
//                 },
//                 child: const Text('Зарегистрироваться'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// Предположим, у вас уже есть HomeScreen или другой экран, куда перенаправлять после регистрации
// import 'your_home_screen.dart'; // Импортируйте ваш главный экран
@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // Ключ для формы, который позволит нам валидировать поля
  final _formKey = GlobalKey<FormState>();

  // Контроллеры для полей ввода Email и Password
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  // Состояние загрузки для кнопки
  bool _isLoading = false;

  // Очищаем контроллеры при уничтожении виджета
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  // Функция для выполнения регистрации
  Future<void> _register() async {
    // Валидация формы
    if (_formKey.currentState!.validate()) {
      // Если форма валидна, переключаем состояние загрузки
      setState(() {
        _isLoading = true;
      });

      try {
        // Вызываем метод создания пользователя с Email и Password из Firebase Auth
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email:
              _emailController.text.trim(), // trim() удаляет пробелы по краям
          password: _passwordController.text,
        );

        print(
            'Пользователь успешно зарегистрирован: ${userCredential.user?.email}');

        // !!! Опционально: Отправка письма для подтверждения Email !!!
        // Это хорошая практика для проверки, что Email настоящий.
        // await userCredential.user?.sendEmailVerification();
        // print('Письмо для подтверждения отправлено.');
        // Если вы отправляете подтверждение, возможно, стоит перенаправить на экран с инструкцией
        // по проверке почты вместо сразу на HomeScreen.

        // После успешной регистрации перенаправляем пользователя на главный экран
        // Используем pushReplacementNamed, чтобы нельзя было вернуться на экран регистрации кнопкой "Назад"
        Navigator.pushReplacementNamed(
            context, '/home'); // Предполагается, что у вас есть маршрут '/home'

        // Если вы не используете именованные маршруты:
        // Navigator.pushReplacement(
        //   context,
        //   MaterialPageRoute(builder: (context) => const HomeScreen()),
        // );
      } on FirebaseAuthException catch (e) {
        // Обработка ошибок Firebase Auth
        String message;
        if (e.code == 'weak-password') {
          message = 'Пароль слишком простой.';
        } else if (e.code == 'email-already-in-use') {
          message = 'Аккаунт с таким Email уже существует.';
        } else if (e.code == 'invalid-email') {
          message = 'Некорректный формат Email.';
        }
        // Добавьте обработку других ошибок, если нужно
        else {
          message = 'Ошибка регистрации: ${e.message}';
        }

        print('Ошибка регистрации: ${e.code} - ${e.message}');

        // Показываем сообщение об ошибке пользователю
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.redAccent,
          ),
        );
      } catch (e) {
        // Обработка других возможных ошибок
        print('Неизвестная ошибка при регистрации: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Произошла неизвестная ошибка.'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } finally {
        // Вне зависимости от успеха или ошибки, отключаем состояние загрузки
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Регистрация'),
      ),
      body: Center(
        // Центрируем содержимое по горизонтали
        child: SingleChildScrollView(
          // Позволяет прокручивать форму, если она не помещается
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey, // Привязываем ключ к форме
            child: Column(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Центрируем содержимое по вертикали в Column
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Растягиваем элементы по горизонтали
              children: <Widget>[
                // Поле ввода Email
                TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите Email';
                    }
                    // Дополнительная простая проверка формата Email
                    if (!value.contains('@')) {
                      return 'Некорректный формат Email';
                    }
                    return null; // Возвращаем null, если валидация успешна
                  },
                ),
                const SizedBox(height: 16.0),

                // Поле ввода Пароля
                TextFormField(
                  controller: _passwordController,
                  obscureText: true, // Скрываем вводимый текст
                  decoration: const InputDecoration(
                    labelText: 'Пароль',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите Пароль';
                    }
                    if (value.length < 6) {
                      // Firebase требует минимум 6 символов
                      return 'Пароль должен содержать минимум 6 символов';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                // Поле ввода Подтверждения Пароля
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true, // Скрываем вводимый текст
                  decoration: const InputDecoration(
                    labelText: 'Подтвердите Пароль',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, подтвердите Пароль';
                    }
                    if (value != _passwordController.text) {
                      return 'Пароли не совпадают';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 24.0),

                // Кнопка Регистрации
                _isLoading
                    ? const Center(
                        child:
                            CircularProgressIndicator()) // Показываем индикатор загрузки, если isLoading == true
                    : ElevatedButton(
                        onPressed: _isLoading
                            ? null
                            : _register, // Отключаем кнопку, пока идет загрузка
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text('Зарегистрироваться',
                            style: TextStyle(fontSize: 18)),
                      ),
                const SizedBox(height: 16.0),

                // Опционально: кнопка "Уже есть аккаунт?" для перехода на экран входа
                TextButton(
                  onPressed: () {
                    // Предполагается, что у вас есть маршрут '/signin' или другой способ перейти на экран входа
                    Navigator.pop(
                        context); // Просто вернуться назад, если экран регистрации был открыт поверх экрана входа
                    // Или использовать именованный маршрут:
                    // Navigator.pushReplacementNamed(context, '/signin');
                  },
                  child: const Text('Уже есть аккаунт? Войти'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
