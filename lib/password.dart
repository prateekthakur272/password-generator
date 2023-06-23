import 'dart:math';

final alphabetsSmall = 'abcdefghijklmnopqrstuvwxyz'.split('');
final alphabetsCapital = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'.split('');
final digits = '1234567890'.split('');
final symbols = '@!#\$%*&()'.split('');

class Password {
  final int length;
  const Password(this.length);

  String genrate(
      {required includeAlphabetSmall,
      required includeAlphabetCapital,
      required includeDigits,
      required includeSymbols}) {
    String password = '';
    final all = (includeAlphabetCapital ? alphabetsCapital : <String>[]) +
        (includeAlphabetSmall ? alphabetsSmall : <String>[]) +
        (includeDigits ? digits : <String>[]) +
        (includeSymbols ? symbols : <String>[]);

    Random random = Random();
    for (var i = 0; i < length; i++) {
      password += all[random.nextInt(all.length)];
    }

    return password;
  }
}
