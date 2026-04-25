import 'package:one_pass/features/home/domain/entities/password_item.dart';

abstract interface class HomeLocalDataSource {
  List<PasswordItem> getPasswords();
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  const HomeLocalDataSourceImpl();

  @override
  List<PasswordItem> getPasswords() => const [
    PasswordItem(
      name: 'Facebook',
      username: 'user@facebook.com',
      password: 'password123',
      iconName: 'facebook',
    ),
    PasswordItem(
      name: 'Google',
      username: 'user@gmail.com',
      password: 'mysecurepassword',
      iconName: 'google',
    ),
    PasswordItem(
      name: 'Apple',
      username: 'user@icloud.com',
      password: 'applepassword',
      iconName: 'apple',
    ),
    PasswordItem(
      name: 'Amazon',
      username: 'user@amazon.com',
      password: 'amazonpassword',
      iconName: 'amazon',
    ),
    PasswordItem(
      name: 'Netflix',
      username: 'user@netflix.com',
      password: 'netflixpassword',
      iconName: 'netflix',
    ),
  ];
}
