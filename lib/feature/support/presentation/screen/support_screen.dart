import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gestor_horas_extras/core/enum/help_steps_enum.dart';
import 'package:gestor_horas_extras/core_ui/images/images_constants.dart';
import 'package:gestor_horas_extras/core_ui/widgets/shared/widgets.dart';
import 'package:gestor_horas_extras/feature/support/presentation/provider/support_provider.dart';

class SupportScreen extends ConsumerWidget {
  static const String name = "SupportScreen";
  static const String link = "/$name";

  const SupportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const CustomBackground(),
            _buildBody(ref),
          ],
        ),
      ),
    );
  }

  _buildBody(WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 40.h,
          ),
          _buildTitle(),
          SizedBox(
            height: 30.h,
          ),
          _buildGallery(ref),
        ],
      ),
    );
  }

  _buildTitle() {
    return const Center(
      child: Text(
        "Soporte y Ayuda",
        style: TextStyle(fontSize: 70, color: Colors.blueAccent),
      ),
    );
  }

  _buildGallery(WidgetRef ref) {
    return Row(
      children: [
        SizedBox(
          width: 600.w,
        ),
        _buildImageInfo(ref),
        SizedBox(
          width: 100.w,
        ),
        Column(
          children: [
            _buildListPreview(ref),
          ],
        )
      ],
    );
  }

  _buildImageInfo(WidgetRef ref) {
    final helpStep = ref.watch(selectedStepHelpProvider);
    return SizedBox(
      width: 500.w,
      height: 800.h,
      child: Card(
          color: const Color(0x001E4B74),
          child: Column(
            children: [
              SizedBox(
                height: 50.h,
              ),
              Image.asset(helpStep.pathImage),
              SizedBox(
                height: 20.h,
              ),
              Text(
                helpStep.description,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.sp, color: Colors.white),
              )
            ],
          )),
    );
  }

  _buildListPreview(WidgetRef ref) {
    return SizedBox(
      width: 200.w,
      height: 800.h,
      child: ListView.builder(
        padding: EdgeInsets.only(left: 2.w),
        scrollDirection: Axis.vertical,
        itemCount: HelpStepsEnum.values.length,
        itemBuilder: (context, index) {
          return _buildCard(
            ref,
            HelpStepsEnum.values.elementAt(index),
          );
        },
      ),
    );
  }

  _buildCard(WidgetRef ref, HelpStepsEnum helpEnum) {
    return SizedBox(
      width: 100.w,
      height: 265.h,
      child: GestureDetector(
        child: Card(
          color: const Color(0x001E4B74),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Image.asset(helpEnum.pathImage),
            ],
          ),
        ),
        onTap: () {
          ref.read(selectedStepHelpProvider.notifier).setHelpStep(helpEnum);
        },
      ),
    );
  }
}
