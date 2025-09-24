import 'package:dbheatlcareproject/core/theme/app_colors.dart';
import 'package:dbheatlcareproject/core/theme/app_svgs.dart';
import 'package:dbheatlcareproject/core/theme/app_text_styles.dart';
import 'package:dbheatlcareproject/features/presentation/loading_screen.dart';
import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/serverity.dart';
import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/symptom_result_detail_notifier.dart';
import 'package:dbheatlcareproject/features/presentation/symptomresultdetail/symptom_result_detail_state.dart';
import 'package:dbheatlcareproject/features/presentation/widgets/single_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../core/utils/analytics_service.dart';
import '../symptom_input_result_notifier.dart';
import 'diseases_prediction.dart';
import 'medicine.dart';

class SymptomResultDetailScreen extends ConsumerStatefulWidget {
  const SymptomResultDetailScreen({super.key});

  static const String routeName = 'symptomResultDetail';
  static const String routePath = '/symptom/resultDetail';

  @override
  ConsumerState<SymptomResultDetailScreen> createState() =>
      _SymptomResultDetailScreenState();
}

class _SymptomResultDetailScreenState
    extends ConsumerState<SymptomResultDetailScreen> {
  final ScrollController _scrollController = ScrollController(); // 스크롤 컨트롤러 추가

  final double spaceBetweenBoxes = 16.0;

  @override
  void initState() {
    super.initState();
    AnalyticsService.logScreenView(screenName: 'system_input_screen');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final notifier = ref.read(symptomResultDetailNotifierProvider.notifier);
      notifier.updateStateWithGptResponse(
        ref.read(symptomInputResultNotifierProvider).userInputRequest!,
      );
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SymptomResultDetailState state = ref.watch(
      symptomResultDetailNotifierProvider,
    );

    ref.listen<SymptomResultDetailState>(symptomResultDetailNotifierProvider, (
      SymptomResultDetailState? previousState,
      SymptomResultDetailState newState,
    ) {
      if (newState.errorMessage.isNotEmpty &&
          (previousState?.errorMessage == null ||
              previousState!.errorMessage.isEmpty)) {
        if (mounted) {
          showDialog(
            context: context,
            // barrierDismissible: true, // 기본값이 true이므로 생략 가능
            builder: (BuildContext dialogContext) {
              // 여기서 context 이름을 dialogContext로 변경하여 외부 context와 구분
              return AlertDialog(
                content: SingleChildScrollView(
                  // 내용이 길어질 경우 스크롤 가능하도록
                  child: ListBody(
                    // 여러 줄의 텍스트나 위젯을 세로로 배치
                    children: <Widget>[
                      Text(
                        newState.errorMessage,
                        style: AppTextStyles.bold20(context),
                      ),
                      SizedBox(height: 24),
                      Text(
                        'AI 결과를 받아오는 도중 에러가 발생 했습니다. 재시도 해주세요.',
                        style: AppTextStyles.regular16(context),
                      ),
                      // 필요하다면 다른 위젯들도 추가 가능
                    ],
                  ),
                ),
                actions: <Widget>[
                  singleButton(
                    context: context,
                    text: '재시도',
                    onPressed: () {
                      AnalyticsService.logButtonClick(
                        buttonName: 'result_detail_refresh',
                      );
                      ref
                          .read(symptomResultDetailNotifierProvider.notifier)
                          .updateStateWithGptResponse(
                            ref
                                .read(symptomInputResultNotifierProvider)
                                .userInputRequest!,
                          );
                      Navigator.of(dialogContext).pop();
                    },
                    horizontalPadding: 0.0,
                    verticalPadding: 0.0,
                  ),
                ],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                backgroundColor: AppColors.white,
                // elevation: 8.0, // 다이얼로그 그림자 (선택 사항)
              );
            },
          );
        }
      }
    });

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.detailBackground,
            surfaceTintColor: Colors.transparent,
            leading: IconButton(
              icon: SvgPicture.asset(AppSvgs.backButtonWhiteIcon),
              onPressed: () {
                if (!state.isLoading) {
                  AnalyticsService.logButtonClick(
                    buttonName: 'result_detail_back_btn',
                  );
                  GoRouter.of(context).pop();
                }
              },
              tooltip: '뒤로 가기',
            ),
          ),
          body: SafeArea(child: _buildBody(state)),
        ),
        if (state.isLoading) LoadingScreen(),
      ],
    );
  }

  Widget _buildBody(SymptomResultDetailState state) {
    final today = DateTime.now();
    return Expanded(
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(color: AppColors.detailBackground),
            ),
            Positioned(
              bottom: 56.0,
              right: 0,
              child: SvgPicture.asset(AppSvgs.resultYImage),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Container(height: 96.0, color: AppColors.appBarDark),
                SizedBox(height: 56.0),
                Text(
                  '당신의 질병을 예측하는 AI, 닥터 와이',
                  style: AppTextStyles.regular16(
                    context,
                  ).copyWith(color: AppColors.white),
                ),
                SizedBox(height: 16.0),
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(AppSvgs.doctorWhyTextWhite),
                ),
                SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: SvgPicture.asset(AppSvgs.resultDetailLogoImage),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    AppSvgs.symptomResultDetailImage,
                    fit: BoxFit.fill,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    // gradient: _boxGradient()
                    color: AppColors.transparent,
                  ),
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 24.0),
                        Text(
                          '${today.year}.${today.month}.${today.day} 일자로 예측한',
                          style: AppTextStyles.bold20(
                            context,
                          ).copyWith(color: AppColors.white),
                        ),
                        Text(
                          '질병 결과입니다.',
                          style: AppTextStyles.bold20(
                            context,
                          ).copyWith(color: AppColors.white),
                        ),
                        SizedBox(height: 40.0),

                        // 분석 내용
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultSearchIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '분석 내용',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            state.analysedText,
                            style: AppTextStyles.regular16(
                              context,
                            ).copyWith(color: AppColors.white),
                          ),
                        ]),

                        SizedBox(height: spaceBetweenBoxes),

                        // 예상되는 질병
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.diseasesResultIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '예상되는 질병',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          _getDiseasesResultList(state.diseasePredictionList),
                          SizedBox(height: 4.0),
                        ]),

                        SizedBox(height: spaceBetweenBoxes),

                        // 심각도
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultDangerIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '심각도',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                              Spacer(flex: 1),
                              Text(
                                state.serverity?.displayName ?? '',
                                style: AppTextStyles.regular16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),

                          SizedBox(height: 16.0),

                          Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Visibility(
                                      visible: state.serverity == Severity.mild,
                                      child: SvgPicture.asset(
                                        AppSvgs.resultTriangleIcon,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Visibility(
                                      visible:
                                          state.serverity == Severity.moderate,
                                      child: SvgPicture.asset(
                                        AppSvgs.resultTriangleIcon,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Visibility(
                                      visible:
                                          state.serverity == Severity.severe,
                                      child: SvgPicture.asset(
                                        AppSvgs.resultTriangleIcon,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.0),
                              SizedBox(
                                height: 8.0,
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: AppColors.green400,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(
                                        color: AppColors.yellow300,
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Container(color: AppColors.red500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 24.0),
                            ],
                          ),
                        ]),

                        SizedBox(height: 40.0),

                        Container(
                          width: double.infinity,
                          child: SvgPicture.asset(
                            AppSvgs.resultWhatToDoAfterImg,
                          ),
                        ),

                        SizedBox(height: 40.0),

                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultCrossIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '관련 진료과',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          _whiteText(
                            '위와 같은 질병이라면 해당 진료과를 방문하는 것을 권장드려요.',
                            AppTextStyles.regular16(context),
                          ),
                          SizedBox(height: 12.0),
                          _buildMedicalDepartmentList(
                            state.medicalDepartmentList,
                          ),
                        ]),
                        SizedBox(height: spaceBetweenBoxes),
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultBulbIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '생활 습관 팁 및 주의 사항',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          _buildWhatToDoList(state.whatToDoList),
                        ]),
                        SizedBox(height: spaceBetweenBoxes),
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultMedicineIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '추천 의약품 또는 건강기능식품',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          _buildMedicineList(state.medicineList),
                        ]),
                        SizedBox(height: spaceBetweenBoxes),
                        _container([
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(AppSvgs.resultFoodIcon),
                              SizedBox(width: 8.0),
                              Text(
                                '추천 식품',
                                style: AppTextStyles.bold16(
                                  context,
                                ).copyWith(color: AppColors.white),
                              ),
                            ],
                          ),
                          SizedBox(height: 16.0),
                          _buildMedicineList(state.foodList),
                        ]),
                        SizedBox(height: spaceBetweenBoxes),
                        if (state.recommendedNextStep != null)
                          _container([
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppSvgs.resultNextStepIcon),
                                SizedBox(width: 8.0),
                                Text(
                                  '권장 다음 단계',
                                  style: AppTextStyles.bold16(
                                    context,
                                  ).copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              state.recommendedNextStep!,
                              style: AppTextStyles.regular16(
                                context,
                              ).copyWith(color: AppColors.white),
                            ),
                          ]),
                        SizedBox(height: spaceBetweenBoxes),
                        if (state.precautions != null)
                          _container([
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(AppSvgs.resultDotsIcon),
                                SizedBox(width: 8.0),
                                Text(
                                  '참고 사항',
                                  style: AppTextStyles.bold16(
                                    context,
                                  ).copyWith(color: AppColors.white),
                                ),
                              ],
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              state.precautions!,
                              style: AppTextStyles.regular16(
                                context,
                              ).copyWith(color: AppColors.white),
                            ),
                          ]),

                        SizedBox(height: spaceBetweenBoxes),

                        SizedBox(
                          width: double.infinity,
                          child: _container([
                            _whiteText(
                              '결과가 어떠셨나요?',
                              AppTextStyles.bold20(context),
                            ),
                            SizedBox(height: 8.0),
                            _whiteText(
                              '더 나은 서비스를 위해 평가를 부탁드려요.',
                              AppTextStyles.regular16(context),
                            ),
                            SizedBox(height: 24.0),
                            singleButton(
                              context: context,
                              onPressed: () {
                                AnalyticsService.logButtonClick(
                                  buttonName: 'result_detail_survey_btn',
                                );
                                // TODO Onpressed
                              },
                              backgroundColor: AppColors.white,
                              borderColor: AppColors.white,
                              textColor: AppColors.slate500,
                              text: '리뷰 남기기',
                            ),
                          ], crssAxisAlignment: CrossAxisAlignment.center),
                        ),
                        SizedBox(height: 64.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _container(
    List<Widget> child, {
    CrossAxisAlignment crssAxisAlignment = CrossAxisAlignment.start,
  }) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 480.0, // max-width
      ),
      child: Container(
        padding: const EdgeInsets.all(16.0), // padding
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,

            colors: const [
              Color.fromRGBO(93, 48, 255, 0.2),
              Color.fromRGBO(0, 204, 250, 0.2),
            ],
            stops: const [
              0.1207, // 12.07%
              0.8832, // 88.32%
            ],
          ),
          borderRadius: BorderRadius.circular(16.0), // border-radius
        ),
        child: Column(crossAxisAlignment: crssAxisAlignment, children: child),
      ),
    );
  }

  Widget _getDiseasesResultList(List<DiseasePrediction> diseasePredictionList) {
    return Column(
      children: diseasePredictionList.map(_getDiseaseResultIem).toList(),
    );
  }

  Widget _getDiseaseResultIem(DiseasePrediction item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                item.name,
                style: AppTextStyles.regular16(
                  context,
                ).copyWith(color: AppColors.white),
              ),
            ),
            Text(
              "${item.probability}%",
              style: AppTextStyles.bold20(
                context,
              ).copyWith(color: AppColors.white),
            ),
          ],
        ),
        SizedBox(height: 12.0),
        Container(
          height: 12.0,
          decoration: BoxDecoration(
            color: AppColors.white.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(4.0),
          ),
          child: Row(
            children: [
              Expanded(
                flex: item.probability.toInt(),
                child: Container(
                  height: 12.0,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft, // 90deg는 왼쪽에서 시작
                      end: Alignment.centerRight, // 오른쪽으로 끝남
                      colors: const [
                        Color(0xFF8041FF), // 시작 색상 (#8041FF)
                        Color(0xFF0DA2FF), // 끝 색상 (#0DA2FF)
                      ],
                      stops: const [
                        0.0, // 0% 지점 (생략 가능, 기본값)
                        1.0, // 100% 지점 (생략 가능, 기본값)
                      ],
                    ),
                    borderRadius: BorderRadius.circular(4), // 선택 사항: 모서리 둥글게
                  ),
                ),
              ),
              Spacer(flex: 100 - item.probability.toInt()),
            ],
          ),
        ),
        SizedBox(height: 20.0),
      ],
    );
  }

  Widget _buildWhatToDoList(List<String> whatToDoList) {
    if (whatToDoList.isEmpty) {
      return SizedBox();
    }
    List<Widget> list = [];
    for (int i = 0; i < whatToDoList.length; i++) {
      list.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${i + 1}. ',
              style: AppTextStyles.regular16(
                context,
              ).copyWith(color: AppColors.white),
            ),
            Expanded(
              flex: 1,
              child: _whiteText(
                whatToDoList[i],
                AppTextStyles.regular16(context),
              ),
            ),
          ],
        ),
      );
      list.add(SizedBox(height: 16.0));
    }
    return Column(children: list);
  }

  Widget _buildMedicalDepartmentList(List<String> list) {
    if (list.isEmpty) {
      return SizedBox();
    }
    List<Widget> listWidget = [];
    for (int i = 0; i < list.length; i++) {
      listWidget.add(
        _buildItemBoxWithBorder(
          Text(
            list[i],
            style: AppTextStyles.bold14(
              context,
            ).copyWith(color: AppColors.white),
          ),
        ),
      );
      listWidget.add(SizedBox(width: 8.0));
    }
    listWidget.removeLast();
    return Row(children: listWidget);
  }

  Widget _buildItemBoxWithBorder(Widget child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Colors.white, width: 1.0),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: child,
    );
  }

  Widget _buildMedicineList(List<Medicine> list) {
    if (list.isEmpty) {
      return SizedBox();
    }
    List<Widget> listWidget = [];
    for (int i = 0; i < list.length; i++) {
      listWidget.add(
        _buildItemBoxWithBorder(
          _whiteText(list[i].name, AppTextStyles.bold16(context)),
        ),
      );
      listWidget.add(SizedBox(height: 8.0));
      listWidget.add(
        _whiteText(list[i].description, AppTextStyles.regular16(context)),
      );
      listWidget.add(SizedBox(height: 24));
    }
    listWidget.removeLast();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: listWidget,
    );
  }

  Widget _whiteText(String text, TextStyle style) {
    return Text(text, style: style.copyWith(color: AppColors.white));
  }
}
