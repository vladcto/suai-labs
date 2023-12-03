import 'package:my_math/my_math.dart';
import 'package:my_math/src/models/definite_integral.dart';

extension FuncExtensionExt on Func {
  DefiniteIntegral integral({required MathInterval interval}) {
    return DefiniteIntegral(this, interval: interval);
  }
}
