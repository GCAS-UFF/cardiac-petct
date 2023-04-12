import 'package:cardiac_petct/features/auth/submodules/registration/registration_cubit.dart';
import 'package:cardiac_petct/src/input_validators/validations_mixin.dart';
import 'package:cardiac_petct/features/auth/domain/entities/user_entity.dart';
import 'package:cardiac_petct/src/ui/petct_date_picker.dart';
import 'package:cardiac_petct/src/ui/petct_dropdown_button.dart';
import 'package:cardiac_petct/src/ui/petct_elevated_button.dart';
import 'package:cardiac_petct/src/ui/petct_switch_theme_mode.dart';
import 'package:cardiac_petct/src/ui/petct_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>
    with ValidationsMixin {
  final RegistrationCubit cubit = Modular.get();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatPasswordController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  String? genderText;
  DateTime? birthdate;
  List<DropdownMenuItem<String>> genderItems = [
    const DropdownMenuItem(
      value: 'male',
      child: Text(
        'Homem',
      ),
    ),
    const DropdownMenuItem(
      value: 'female',
      child: Text(
        'Mulher',
      ),
    ),
    const DropdownMenuItem(
      value: 'not-informed',
      child: Text(
        'Não informar',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(
                FeatherIcons.arrowLeft,
              ),
            ),
            const PetctSwitchThemeMode(),
          ],
        ),
      ),
      body: BlocConsumer(
        bloc: cubit,
        listener: (context, state) {
          if (state.runtimeType == RegistrationSuccessState) {
            Modular.to.navigate('/email-verify');
          } else if (state.runtimeType == RegistrationErrorState) {
            final errorState = state as RegistrationErrorState;
            var snackBar = SnackBar(
              content: Text(
                errorState.failure.errorMessage,
              ),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        builder: (context, state) {
          return Container(
            width: double.infinity,
            padding: const EdgeInsets.fromLTRB(22, 36, 22, 0),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Cadastro',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Name
                    PetctTextFormField(
                      controller: nameController,
                      hintText: 'Nome',
                      validator: (val) => combine(
                        [
                          () => isNotEmpty(val),
                          () => hasMinLength(val, 4),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // BirthDate
                    PetctDatePicker(
                      onValue: (date) {
                        if (date != null) {
                          birthdate = date;
                          birthDateController.text =
                              '${date.day < 10 ? 0 : ''}${date.day}/${date.month < 10 ? 0 : ''}${date.month}/${date.year}';
                        }
                      },
                      controller: birthDateController,
                      hintText: 'Data de Nascimento',
                      validator: isNotEmpty,
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Gender
                    PetcetDropdownButton(
                      items: genderItems,
                      seletedItem: genderText,
                      hintText: 'Gênero',
                      onChanged: (value) {
                        genderText = value;
                      },
                      validator: isNotEmpty,
                    ),

                    const SizedBox(
                      height: 22,
                    ),
                    // Email
                    PetctTextFormField(
                      controller: emailController,
                      hintText: 'Email',
                      textInputType: TextInputType.emailAddress,
                      validator: (val) => combine([
                        () => isNotEmpty(val),
                        () => isEmailValid(val),
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Password
                    PetctTextFormField(
                      controller: passwordController,
                      hintText: 'Senha',
                      obscureText: obscurePassword,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                        icon: Icon(
                          obscurePassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                          color: Colors.grey,
                        ),
                      ),
                      validator: (value) => combine([
                        () => isNotEmpty(value),
                        () => hasMinLength(value, 8),
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Repeat Password
                    PetctTextFormField(
                      controller: repeatPasswordController,
                      hintText: 'Digite a senha novamente',
                      obscureText: true,
                      validator: (val) => combine([
                        () => isNotEmpty(val),
                        () => equalPassword(val, passwordController.text),
                      ]),
                    ),
                    const SizedBox(
                      height: 22,
                    ),
                    // Diabetes
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Sign Up Button
                        Row(
                          children: [
                            Expanded(
                              child: PetctElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    final user = UserEntity(
                                        name: nameController.text,
                                        email: emailController.text,
                                        birthdate: birthdate!,
                                        gender: genderText!);
                                    cubit.registration(
                                        user, passwordController.text);
                                  }
                                },
                                child: const Text(
                                  'Cadastrar',
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
