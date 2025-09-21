// lib/widgets/custom_app_bar.dart (예시 경로)
import 'dart:async';
import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../widgets/single_button.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String? title; // 선택적 타이틀 (필요하다면)
  final VoidCallback? onPlusButtonTap; // 플러스 버튼 탭 콜백 (선택 사항)
  final IconButton? leadingIcon;

  const CustomAppBar({
    super.key,
    this.title,
    this.onPlusButtonTap,
    this.leadingIcon,
  });

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // AppBar의 표준 높이
}

class _CustomAppBarState extends State<CustomAppBar> {
  Timer? _timer;
  Duration _timeUntilMidnight = Duration.zero;

  final int _maxAttempts = 3;
  int _currentAttempts = 1;
  static const String _attemptsKey = 'custom_app_bar_attempts'; // 키 이름 변경 권장

  @override
  void initState() {
    super.initState();
    // _loadCurrentAttempts();
    // _calculateTimeUntilMidnight();
    // _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _calculateTimeUntilMidnight() {
    final now = DateTime.now();
    final midnightTomorrow = DateTime(now.year, now.month, now.day + 1);
    _timeUntilMidnight = midnightTomorrow.difference(now);
  }

  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (!mounted) {
        // 위젯이 여전히 마운트되어 있는지 확인
        timer.cancel();
        return;
      }
      if (_timeUntilMidnight.inSeconds > 0) {
        setState(() {
          _calculateTimeUntilMidnight();
        });
      } else {
        timer.cancel();
        _resetAttemptsAndRestartTimer();
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('자정이 되어 정보가 초기화됩니다.')));
        }
      }
    });
  }

  String get _formattedTime {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String hours = twoDigits(_timeUntilMidnight.inHours);
    String minutes = twoDigits(_timeUntilMidnight.inMinutes.remainder(60));
    String seconds = twoDigits(_timeUntilMidnight.inSeconds.remainder(60));
    return '$hours:$minutes:$seconds';
  }

  Future<void> _loadCurrentAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _currentAttempts = prefs.getInt(_attemptsKey) ?? 1;
    });
  }

  Future<void> _incrementAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    if (_currentAttempts < _maxAttempts) {
      if (!mounted) return;
      setState(() {
        _currentAttempts++;
        prefs.setInt(_attemptsKey, _currentAttempts);
      });
      // 외부에서 전달된 콜백 실행 (선택 사항)
      widget.onPlusButtonTap?.call();
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('최대 시도 횟수에 도달했습니다.')));
      }
    }
  }

  Future<void> _resetAttempts() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _currentAttempts = 1;
      prefs.setInt(_attemptsKey, _currentAttempts);
    });
  }

  void _resetAttemptsAndRestartTimer() {
    _resetAttempts();
    _calculateTimeUntilMidnight();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.white,
      surfaceTintColor: AppColors.transparent,
      toolbarHeight: 48.0,
      elevation: 1.0,
      automaticallyImplyLeading: false,
      // 뒤로가기 버튼을 직접 제어
      titleSpacing: 0,
      leading:
          widget.leadingIcon ??
          IconButton(
            icon: SvgPicture.asset(AppSvgs.backButtonIcon),
            onPressed: () => GoRouter.of(context).pop(),
            tooltip: '뒤로 가기',
          ),
      // title: Row(
      //   children: <Widget>[
      //     if (widget.title != null)
      //       Padding(
      //         padding: const EdgeInsets.only(left: 14.0),
      //         // leading이 없을 경우를 대비한 패딩
      //         child: Text(
      //           widget.title!,
      //           style: AppTextStyles.regular14(
      //             context,
      //           ).copyWith(color: AppColors.red500),
      //         ),
      //       ),
      //     const Spacer(),
      //     Row(
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         Text(
      //           _formattedTime,
      //           style: AppTextStyles.regular14En.copyWith(
      //             color: AppColors.red500,
      //           ),
      //         ),
      //         const SizedBox(width: 12),
      //         Ink(
      //           decoration: BoxDecoration(
      //             color: AppColors.slate100,
      //             borderRadius: BorderRadius.circular(14.0),
      //             border: Border.all(color: AppColors.slate200, width: 1),
      //           ),
      //           child: InkWell(
      //             onTap: _incrementAttempts,
      //             borderRadius: BorderRadius.circular(24),
      //             child: Row(
      //               mainAxisSize: MainAxisSize.min,
      //               children: [
      //                 SizedBox(width: 12.0),
      //                 Text(
      //                   '0$_currentAttempts ',
      //                   style: AppTextStyles.bold16En.copyWith(
      //                     color: AppColors.indigo400,
      //                   ),
      //                 ),
      //                 Text(
      //                   '/ 0$_maxAttempts',
      //                   style: AppTextStyles.bold16En.copyWith(
      //                     color: AppColors.slate950,
      //                   ),
      //                 ),
      //                 const SizedBox(width: 8),
      //                 Padding(
      //                   padding: const EdgeInsets.all(4.0),
      //                   child: SvgPicture.asset(AppSvgs.plusIcon),
      //                 ),
      //               ],
      //             ),
      //           ),
      //         ),
      //         const SizedBox(width: 16), // 오른쪽 끝 여백
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
