// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(name) => "Are you sure you want to delete \'${name}\'?";

  static String m1(name) => "${name} deleted";

  static String m2(name) => "Are you sure you want to delete \'${name}\'?";

  static String m3(name) => "${name} deleted";

  static String m4(count) => "Total Products: ${count}";

  static String m5(count) => "Min: ${count}";

  static String m6(quantity) => "Qty: ${quantity}";

  static String m7(count) => "In Stock — ${count} units";

  static String m8(count) => "Low Stock — ${count} left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "auth_login_button": MessageLookupByLibrary.simpleMessage("Login"),
    "auth_login_email_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your email",
    ),
    "auth_login_email_label": MessageLookupByLibrary.simpleMessage(
      "Email or Username",
    ),
    "auth_login_no_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account?",
    ),
    "auth_login_password_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your password",
    ),
    "auth_login_password_label": MessageLookupByLibrary.simpleMessage(
      "Password",
    ),
    "auth_login_signup_link": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "auth_login_subtitle": MessageLookupByLibrary.simpleMessage(
      "Login to manage your stock efficiently",
    ),
    "auth_login_title": MessageLookupByLibrary.simpleMessage("Welcome Back"),
    "auth_login_validation_empty_email": MessageLookupByLibrary.simpleMessage(
      "Please enter your username or email",
    ),
    "auth_login_validation_empty_password":
        MessageLookupByLibrary.simpleMessage("Please enter your password"),
    "auth_login_validation_short_password":
        MessageLookupByLibrary.simpleMessage(
          "Password must be at least 6 characters",
        ),
    "auth_signup_button": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "auth_signup_confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "Repeat password",
    ),
    "auth_signup_confirm_password_label": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "auth_signup_email_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your email",
    ),
    "auth_signup_email_label": MessageLookupByLibrary.simpleMessage("Email"),
    "auth_signup_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account?",
    ),
    "auth_signup_login_link": MessageLookupByLibrary.simpleMessage("Login"),
    "auth_signup_password_hint": MessageLookupByLibrary.simpleMessage(
      "Enter password",
    ),
    "auth_signup_password_label": MessageLookupByLibrary.simpleMessage(
      "Password",
    ),
    "auth_signup_subtitle": MessageLookupByLibrary.simpleMessage(
      "Fill in the details to get started",
    ),
    "auth_signup_title": MessageLookupByLibrary.simpleMessage("Create Account"),
    "auth_signup_username_hint": MessageLookupByLibrary.simpleMessage(
      "Enter your username",
    ),
    "auth_signup_username_label": MessageLookupByLibrary.simpleMessage(
      "Username",
    ),
    "auth_signup_validation_confirm_required":
        MessageLookupByLibrary.simpleMessage("Please confirm your password"),
    "auth_signup_validation_email_invalid":
        MessageLookupByLibrary.simpleMessage("Enter a valid email"),
    "auth_signup_validation_email_required":
        MessageLookupByLibrary.simpleMessage("Email is required"),
    "auth_signup_validation_password_mismatch":
        MessageLookupByLibrary.simpleMessage("Passwords do not match"),
    "auth_signup_validation_password_short":
        MessageLookupByLibrary.simpleMessage("Minimum 6 characters"),
    "auth_signup_validation_username_required":
        MessageLookupByLibrary.simpleMessage("Username is required"),
    "categories_delete_message": m0,
    "categories_delete_title": MessageLookupByLibrary.simpleMessage(
      "Delete Category",
    ),
    "categories_deleted": m1,
    "categories_empty": MessageLookupByLibrary.simpleMessage(
      "No categories found",
    ),
    "common_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "common_delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "common_edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "common_login": MessageLookupByLibrary.simpleMessage("Login"),
    "common_save": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "common_signup": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "dashboard_categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "dashboard_overview": MessageLookupByLibrary.simpleMessage("Overview"),
    "dashboard_products": MessageLookupByLibrary.simpleMessage("Products"),
    "dashboard_settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "dashboard_title": MessageLookupByLibrary.simpleMessage("Dashboard"),
    "detail_alert_level": MessageLookupByLibrary.simpleMessage("Alert Level"),
    "detail_category_info": MessageLookupByLibrary.simpleMessage(
      "CATEGORY INFO",
    ),
    "detail_category_name": MessageLookupByLibrary.simpleMessage(
      "Category Name",
    ),
    "detail_category_updated": MessageLookupByLibrary.simpleMessage(
      "Category updated",
    ),
    "detail_description": MessageLookupByLibrary.simpleMessage("Description"),
    "detail_edit_category": MessageLookupByLibrary.simpleMessage(
      "Edit Category",
    ),
    "detail_edit_product": MessageLookupByLibrary.simpleMessage("Edit Product"),
    "detail_no_products": MessageLookupByLibrary.simpleMessage(
      "No products in this category",
    ),
    "detail_price": MessageLookupByLibrary.simpleMessage("Price (MRU)"),
    "detail_product_info": MessageLookupByLibrary.simpleMessage("PRODUCT INFO"),
    "detail_product_name": MessageLookupByLibrary.simpleMessage("Product Name"),
    "detail_product_updated": MessageLookupByLibrary.simpleMessage(
      "Product updated",
    ),
    "detail_products_label": MessageLookupByLibrary.simpleMessage("PRODUCTS"),
    "detail_stock_info": MessageLookupByLibrary.simpleMessage("STOCK INFO"),
    "detail_stock_quantity": MessageLookupByLibrary.simpleMessage(
      "Stock Quantity",
    ),
    "onboarding_social_text": MessageLookupByLibrary.simpleMessage(
      "Sign up using",
    ),
    "onboarding_subtitle": MessageLookupByLibrary.simpleMessage(
      "Welcome to Little Drop, where you manage your daily tasks",
    ),
    "onboarding_title": MessageLookupByLibrary.simpleMessage("Hello"),
    "products_delete_message": m2,
    "products_delete_title": MessageLookupByLibrary.simpleMessage(
      "Delete Product",
    ),
    "products_deleted": m3,
    "products_empty": MessageLookupByLibrary.simpleMessage("No products found"),
    "products_title": m4,
    "settings_account": MessageLookupByLibrary.simpleMessage("Account"),
    "settings_appearance": MessageLookupByLibrary.simpleMessage("Appearance"),
    "settings_dark_mode": MessageLookupByLibrary.simpleMessage("Dark Mode"),
    "settings_logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "settings_logout_message": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to sign out?",
    ),
    "settings_logout_title": MessageLookupByLibrary.simpleMessage("Logout"),
    "settings_version": MessageLookupByLibrary.simpleMessage("Version 1.0.0"),
    "widget_category_no_desc": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "widget_min_stock": m5,
    "widget_product_out": MessageLookupByLibrary.simpleMessage("Out"),
    "widget_product_qty": m6,
    "widget_search_hint": MessageLookupByLibrary.simpleMessage(
      "Search products...",
    ),
    "widget_stock_in": m7,
    "widget_stock_low": m8,
    "widget_stock_out": MessageLookupByLibrary.simpleMessage("Out of Stock"),
  };
}
