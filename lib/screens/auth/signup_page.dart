import 'package:flutter/material.dart';
import 'package:gestion_de_stock_flutter/core/theme/app_colors.dart';
import 'package:gestion_de_stock_flutter/generated/l10n.dart';
import 'package:gestion_de_stock_flutter/routes/app_routes.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formState = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool _isPasswordVisible = false;

  void _handleSignUp() {
    if (formState.currentState!.validate()) {
      Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: formState,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Text(
                  S.of(context).signup_title,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  S.of(context).signup_subtitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.textSecondary,
                  ),
                ),
                const SizedBox(height: 40),

                // username lable
                _buildLabel(S.of(context).signup_username_label),
                _buildTextField(
                  controller: _usernameController,
                  hint: S.of(context).signup_username_hint,
                  icon: Icons.person_outline,
                  validator: (value) => value!.isEmpty
                      ? S.of(context).signup_validation_username_required
                      : null,
                ),

                const SizedBox(height: 20),

                // emaill lable
                _buildLabel(S.of(context).signup_email_label),
                _buildTextField(
                  controller: _emailController,
                  hint: S.of(context).signup_email_hint,
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).signup_validation_email_required;
                    }
                    if (!value.contains('@')) {
                      return S.of(context).signup_validation_email_invalid;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // pwd lable
                _buildLabel(S.of(context).signup_password_label),
                _buildTextField(
                  controller: _passwordController,
                  hint: S.of(context).signup_password_hint,
                  icon: Icons.lock_outline,
                  isPassword: true,
                  validator: (value) => value!.length < 6
                      ? S.of(context).signup_validation_password_short
                      : null,
                ),

                const SizedBox(height: 20),

                // check pwd lable
                _buildLabel(S.of(context).signup_confirm_password_label),
                _buildTextField(
                  controller: _confirmPasswordController,
                  hint: S.of(context).signup_confirm_password_hint,
                  icon: Icons.lock_reset_outlined,
                  isPassword: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return S.of(context).signup_validation_confirm_required;
                    }
                    if (value != _passwordController.text) {
                      return S.of(context).signup_validation_password_mismatch;
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 40),

                // Signup btn
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: _handleSignUp,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      S.of(context).common_signup,
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Center(
                  child: TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.login,
                    ),
                    child: RichText(
                      text: TextSpan(
                        text: S.of(context).signup_have_account,
                        style: TextStyle(color: AppColors.textSecondary),
                        children: [
                          TextSpan(
                            text: S.of(context).common_login,
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    bool isPassword = false,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword && !_isPasswordVisible,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              )
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.border),
        ),
      ),
      validator: validator,
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }
}
