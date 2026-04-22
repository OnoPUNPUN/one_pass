// dart format width=100

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Add.svg
  SvgGenImage get add => const SvgGenImage('assets/icons/Add.svg');

  /// File path: assets/icons/Amazon.svg
  SvgGenImage get amazon => const SvgGenImage('assets/icons/Amazon.svg');

  /// File path: assets/icons/Apple.svg
  SvgGenImage get apple => const SvgGenImage('assets/icons/Apple.svg');

  /// File path: assets/icons/Calendar.svg
  SvgGenImage get calendar => const SvgGenImage('assets/icons/Calendar.svg');

  /// File path: assets/icons/Copy.svg
  SvgGenImage get copy => const SvgGenImage('assets/icons/Copy.svg');

  /// File path: assets/icons/Delete.svg
  SvgGenImage get delete => const SvgGenImage('assets/icons/Delete.svg');

  /// File path: assets/icons/Dropdown.svg
  SvgGenImage get dropdown => const SvgGenImage('assets/icons/Dropdown.svg');

  /// File path: assets/icons/Edit.svg
  SvgGenImage get edit => const SvgGenImage('assets/icons/Edit.svg');

  /// File path: assets/icons/Facebook.svg
  SvgGenImage get facebook => const SvgGenImage('assets/icons/Facebook.svg');

  /// File path: assets/icons/Google.svg
  SvgGenImage get google => const SvgGenImage('assets/icons/Google.svg');

  /// File path: assets/icons/Home.svg
  SvgGenImage get home => const SvgGenImage('assets/icons/Home.svg');

  /// File path: assets/icons/Left.svg
  SvgGenImage get left => const SvgGenImage('assets/icons/Left.svg');

  /// File path: assets/icons/Link.svg
  SvgGenImage get link => const SvgGenImage('assets/icons/Link.svg');

  /// File path: assets/icons/Lock.svg
  SvgGenImage get lock => const SvgGenImage('assets/icons/Lock.svg');

  /// File path: assets/icons/Logout.svg
  SvgGenImage get logout => const SvgGenImage('assets/icons/Logout.svg');

  /// File path: assets/icons/Moon.svg
  SvgGenImage get moon => const SvgGenImage('assets/icons/Moon.svg');

  /// File path: assets/icons/Netflix.svg
  SvgGenImage get netflix => const SvgGenImage('assets/icons/Netflix.svg');

  /// File path: assets/icons/Search.svg
  SvgGenImage get search => const SvgGenImage('assets/icons/Search.svg');

  /// File path: assets/icons/Sun.svg
  SvgGenImage get sun => const SvgGenImage('assets/icons/Sun.svg');

  /// File path: assets/icons/User.svg
  SvgGenImage get user => const SvgGenImage('assets/icons/User.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
    add,
    amazon,
    apple,
    calendar,
    copy,
    delete,
    dropdown,
    edit,
    facebook,
    google,
    home,
    left,
    link,
    lock,
    logout,
    moon,
    netflix,
    search,
    sun,
    user,
  ];
}

class $AssetsLogoGen {
  const $AssetsLogoGen();

  /// File path: assets/logo/app_logo.svg
  SvgGenImage get appLogo => const SvgGenImage('assets/logo/app_logo.svg');

  /// File path: assets/logo/onboarding_logo.svg
  SvgGenImage get onboardingLogo => const SvgGenImage('assets/logo/onboarding_logo.svg');

  /// List of all assets
  List<SvgGenImage> get values => [appLogo, onboardingLogo];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsLogoGen logo = $AssetsLogoGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName, {this.size, this.flavors = const {}}) : _isVecFormat = false;

  const SvgGenImage.vec(this._assetName, {this.size, this.flavors = const {}})
    : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(_assetName, assetBundle: bundle, packageName: package);
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ?? (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
