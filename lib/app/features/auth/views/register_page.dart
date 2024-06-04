// ignore_for_file: lines_longer_than_80_chars

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_async/flutter_async.dart';
import 'package:formx/formx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:typeset/typeset.dart';

import '../../../services/firebase/firebase_auth_service.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/assets.dart';
import '../../home/views/home_page.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});
  static const name = 'register';
  static void go(BuildContext context) => context.goNamed(name);

  static FirebaseAuthService _auth = FirebaseAuthService();
  static TextEditingController _emailController = TextEditingController();
  static TextEditingController _passwordController = TextEditingController();
  static TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: AppColors.light.primary,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 100),
                child: Image.asset(AssetImages.logoAlpha, width: 160),
              ),
            ),
            DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.light.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Form(
                key: const Key('login_form'),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Olá',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.light.secondary,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                            TextSpan(
                              text: ', viajante!',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(
                                    color: AppColors.light.primary,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w300,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      const Text(
                          'Crie a sua conta para ter acesso ao serviços'),
                      const Gap(24),
                      Text(
                        'Nome',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      const Gap(4),
                      TextFormField(
                        controller: _nameController,
                        key: const Key('nome'),
                        validator: Validator().required(),
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.person_2_outlined,
                            color: AppColors.light.secondary,
                          ),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'E-mail',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      const Gap(4),
                      TextFormField(
                        controller: _emailController,
                        key: const Key('email'),
                        validator: Validator().required().email(),
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: AppColors.light.secondary,
                          ),
                        ),
                      ),
                      const Gap(16),
                      Text(
                        'Senha:',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontSize: 16,
                            ),
                      ),
                      const Gap(4),
                      TextFormField(
                        controller: _passwordController,
                        key: const Key('password'),
                        validator: Validator().required(),
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Icon(
                            Icons.lock_outline_rounded,
                            color: AppColors.light.secondary,
                          ),
                        ),
                      ),
                      const Gap(4),
                      const CheckboxTerms(),
                      const Gap(16),
                      FilledButton(
                        onPressed: () async {
                          final state = context.formx();
                          if (!state.validate())
                            return;
                          else {
                            _signUp(context);
                          }
                          // final dto = RegisterUserDto.fromMap(state.values);
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(double.infinity, 48),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(8),
                            ),
                          ),
                          backgroundColor: AppColors.light.secondary,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Criar Conta',
                          style: TextStyle(fontSize: 16),
                        ),
                      ).asAsync(),
                      const Gap(16),
                      Center(
                        child: Column(
                          children: [
                            const Text(
                              'Já possui cadastro? ',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextButton(
                              onPressed: () => LoginPage.go(context),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.light.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _signUp(BuildContext context) async {
    String name = _nameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signUpWithEmailAndPassword(email, password);

    if (user != null) {
      print("Usuário criado com sucesso");
      if (context.mounted) HomePage.go(context);
    } else {
      print("Erro ao criar novo usuário");
    }
  }
}

class CheckboxTerms extends StatefulWidget {
  const CheckboxTerms({
    super.key,
  });

  @override
  State<CheckboxTerms> createState() => _CheckboxTermsState();
}

class _CheckboxTermsState extends State<CheckboxTerms> {
  bool isCheck = false;

  void selectedCheck(bool? value) {
    setState(() {
      isCheck = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
            value: isCheck,
            onChanged: selectedCheck,
            activeColor: AppColors.light.secondary),
        Expanded(
          child: TypeSet(
            softWrap: true,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.light.primary,
                ),
            linkStyle: TextStyle(
              color: AppColors.light.primary,
              decoration: TextDecoration.underline,
            ),
            'Ao criar uma conta, você concorda com nossos §Termos de uso|https://google.com§ e nossa §Política de Privacidade |https://google.com§',
          ),
        ),
      ],
    );
  }
}
