import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_async/flutter_async.dart';
import 'package:formx/formx.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../services/firebase/firebase_auth_service.dart';
import '../../../shared/constants/app_colors.dart';
import '../../../shared/constants/assets.dart';
import '../../home/views/home_page.dart';
import '../models/login_dto.dart';
import '../stores/auth_store.dart';
import 'forgot_password_page.dart';
import 'register_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const name = 'login';
  static void go(BuildContext context) => context.goNamed(name);

  static FirebaseAuthService _auth = FirebaseAuthService();
  static final TextEditingController _emailController = TextEditingController();
  static final TextEditingController _passwordController =
      TextEditingController();

  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.light.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Image.asset(AssetImages.logoAlpha, width: 160),
          ),
          const Spacer(),
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
                    const Text('Entre com a sua conta para começar'),
                    const Gap(24),
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
                      validator: Validator()
                          .required('Email necessário')
                          .email('Email precisa ser válido'),
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
                      validator: Validator().required('Necessário senha'),
                      decoration: InputDecoration(
                        isDense: true,
                        prefixIcon: Icon(
                          Icons.lock_outline_rounded,
                          color: AppColors.light.secondary,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () => ForgotPasswordPage.go(context),
                      child: Text(
                        'Esqueci minha senha',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: AppColors.light.secondary,
                        ),
                      ),
                    ),
                    // *

                    const Gap(16),
                    FilledButton(
                      onPressed: () async {
                        final state = context.formx();
                        if (!state.validate())
                          return;
                        else {
                          signIn(context);
                        }
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
                        'Entrar',
                        style: TextStyle(fontSize: 16),
                      ),
                    ).asAsync(),
                    const Gap(8),
                    Center(
                      child: Column(
                        children: [
                          const Text(
                            'Não tem uma conta? ',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const Gap(4),
                          TextButton(
                            onPressed: () => RegisterPage.go(context),
                            child: Text(
                              'Cadastre-se',
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
    );
  }

  void signIn(BuildContext context) async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      print("Usuário logado com sucesso");
      if (context.mounted) HomePage.go(context);
    } else {
      print("Erro ao entrar na conta do usuário");
    }
  }
}
