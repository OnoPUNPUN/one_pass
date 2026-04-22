import 'package:one_pass/gen/assets.gen.dart';

class PasswordItem {
  final String name;
  final String username;
  final String password;
  final SvgGenImage icon;

  const PasswordItem({
    required this.name,
    required this.username,
    required this.password,
    required this.icon,
  });
}

final List<PasswordItem> dummyPasswords = [
  PasswordItem(
    name: 'Facebook',
    username: 'user@facebook.com',
    password: 'password123',
    icon: Assets.icons.facebook,
  ),
  PasswordItem(
    name: 'Google',
    username: 'user@gmail.com',
    password: 'mysecurepassword',
    icon: Assets.icons.google,
  ),
  PasswordItem(
    name: 'Apple',
    username: 'user@icloud.com',
    password: 'applepassword',
    icon: Assets.icons.apple,
  ),
  PasswordItem(
    name: 'Amazon',
    username: 'user@amazon.com',
    password: 'amazonpassword',
    icon: Assets.icons.amazon,
  ),
  PasswordItem(
    name: 'Netflix',
    username: 'user@netflix.com',
    password: 'netflixpassword',
    icon: Assets.icons.netflix,
  ),
];
