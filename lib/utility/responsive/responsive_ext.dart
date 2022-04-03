
import '../../Thems/Responsive.dart';

extension ResponsiveExt on num {
  double get h => ResponsiveUtil.height(this);

  double get w => ResponsiveUtil.width(this);

  double get sp => ResponsiveUtil.sp(this);

  double get fh => ResponsiveUtil.height(300);

  double get fw => ResponsiveUtil.width(300);
}
