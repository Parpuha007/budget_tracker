import 'package:auto_route/auto_route.dart';
import 'package:budget_tracker/router/app_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  Future<void> _register(BuildContext context) async {
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

        context.router.replace(const RootRoute());
      } on FirebaseAuthException catch (e) {
        // Обработка ошибок Firebase Auth
        String message;
        if (e.code == 'weak-password') {
          message = 'Пароль слишком простой.';
        } else if (e.code == 'email-already-in-use') {
          message = 'Аккаунт с таким Email уже существует.';
        } else if (e.code == 'invalid-email') {
          message = 'Некорректный формат Email.';
        } else {
          message = 'Ошибка регистрации: ${e.message}';
        }

        print('Ошибка регистрации: ${e.code} - ${e.message}');

        // Сообщение об ошибке
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(message),
            backgroundColor: Colors.redAccent,
          ),
        );
      } catch (e) {
        // Другая ошибка
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
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
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
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
                      return 'Пароль должен содержать минимум 6 символов';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),

                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: true,
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

                _isLoading
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ElevatedButton(
                        onPressed: _isLoading ? null : () => _register(context),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        child: const Text(
                          'Зарегистрироваться',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                const SizedBox(height: 16.0),

                TextButton(
                  onPressed: () {
                    context.router.maybePop();
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
