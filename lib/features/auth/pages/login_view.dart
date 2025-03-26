
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:recipe/core/routing/routes.dart';

import '../../../data/repository/auth_repository.dart';
import '../../common/widgets/recipe_eleveted_button.dart';
import '../manager/login_view_model.dart';
import '../widgets/login_view_form.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(
        repo: context.read<AuthRepository>(),
      ),
      builder: (context, recipeButton) {
        final vm = context.watch<LoginViewModel>();
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Login"),
          ),
          body: ListView(
            padding: EdgeInsets.only(top: 150),
            children: [
              const LoginViewForm(),
              if (vm.hasError)
                Text(
                  vm.errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              SizedBox(height: 90),
              RecipeElevatedButton(
                text: "Login",
                fontSize: 20,
                callback: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      context.go(Routes.home);
                    }
                  }
                },
                size: Size(207.w, 45.h),
              ),
              SizedBox(height: 27),
              RecipeElevatedButton(
                text: "Sign Up",
                fontSize: 20,
                callback: () => context.go(Routes.signUp),
                size: Size(207, 45),
              ),
            ],
          ),
        );
      },
    );
  }
}
