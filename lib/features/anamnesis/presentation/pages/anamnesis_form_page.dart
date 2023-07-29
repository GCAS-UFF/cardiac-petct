import 'package:cardiac_petct/features/anamnesis/anamnesis_cubit.dart';
import 'package:cardiac_petct/features/anamnesis/constants/anamnesis_internal_route_names.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/widgets/chronical_deseases_form.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/widgets/drink_form.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/widgets/physical_exercise_form.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/widgets/physical_form.dart';
import 'package:cardiac_petct/features/anamnesis/presentation/widgets/smoke_form.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class AnamnesisFormPage extends StatefulWidget {
  const AnamnesisFormPage({super.key});

  @override
  State<AnamnesisFormPage> createState() => _AnamnesisFormPageState();
}

class _AnamnesisFormPageState extends State<AnamnesisFormPage> {
  final AnamnesisCubit cubit = Modular.get();
  final CarouselController carouselController = CarouselController();
  int currentForm = 0;
  final List<GlobalKey<FormState>> _formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  List<Widget> _buildFormPages() {
    return [
      _buildFormPage(
        formKey: _formKeys[0],
        child: const PhysicalForm(),
      ),
      _buildFormPage(
        formKey: _formKeys[1],
        child: const SmokeForm(),
      ),
      _buildFormPage(
        formKey: _formKeys[2],
        child: const DrinkForm(),
      ),
      _buildFormPage(
        formKey: _formKeys[3],
        child: const PhysicalExerciseForm(),
      ),
      _buildFormPage(
        formKey: _formKeys[4],
        child: const ChronicalDiseasesForm(),
      ),
    ];
  }

  Widget _buildFormPage({
    required GlobalKey<FormState> formKey,
    required Widget child,
  }) {
    return Form(
      key: formKey,
      child: child,
    );
  }

  Future<void> _submitForm() async {
    final List<GlobalKey<FormState>> formKeys = _formKeys;
    bool isValid = true;
    if (!formKeys[currentForm].currentState!.validate()) {
      isValid = false;
    }

    if (isValid) {
      if (currentForm == _buildFormPages().length - 1) {
        Modular.to.navigate(AnamnesisInternalRouteNames.anamnesisDone);
      } else {
        carouselController.nextPage(
          duration: const Duration(milliseconds: 300),
          curve: Curves.linear,
        );
        setState(() {
          currentForm++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 56, left: 12, right: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CarouselSlider(
                            carouselController: carouselController,
                            items: _buildFormPages(),
                            disableGesture: false,
                            options: CarouselOptions(
                                viewportFraction: 1,
                                aspectRatio: 1,
                                height: 600),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      if (currentForm == 0) {
                        Modular.to
                            .navigate(AnamnesisInternalRouteNames.anamnesis);
                      } else {
                        carouselController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.linear,
                        );

                        setState(() {
                          currentForm--;
                        });
                      }
                    },
                    child: Text('back-label'.i18n()),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: PetctElevatedButton(
                    onPressed: () {
                      _submitForm();
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text('next-label'.i18n()),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
