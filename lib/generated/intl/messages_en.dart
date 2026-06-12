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

  static String m5(count) => "In Stock — ${count} units";

  static String m6(count) => "Low Stock — ${count} left";

  static String m7(name) => "Are you sure you want to delete supplier ${name}?";

  static String m8(name) => "Supplier ${name} deleted successfully";

  static String m9(count) => "Suppliers (${count})";

  static String m10(count) => "Min: ${count}";

  static String m11(quantity) => "Qty: ${quantity}";

  static String m12(count) => "In Stock — ${count} units";

  static String m13(count) => "Low Stock — ${count} left";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "add_category_button": MessageLookupByLibrary.simpleMessage(
      "Create Category",
    ),
    "add_category_desc_hint": MessageLookupByLibrary.simpleMessage(
      "Enter category description",
    ),
    "add_category_desc_label": MessageLookupByLibrary.simpleMessage(
      "Description",
    ),
    "add_category_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter category name",
    ),
    "add_category_name_label": MessageLookupByLibrary.simpleMessage(
      "Category Name",
    ),
    "add_category_title": MessageLookupByLibrary.simpleMessage("New Category"),
    "add_movement_button": MessageLookupByLibrary.simpleMessage(
      "Save Movement",
    ),
    "add_movement_product_label": MessageLookupByLibrary.simpleMessage(
      "Select Product",
    ),
    "add_movement_quantity_label": MessageLookupByLibrary.simpleMessage(
      "Quantity",
    ),
    "add_movement_reason_hint": MessageLookupByLibrary.simpleMessage(
      "Enter reason (e.g. Initial inventory, sale)",
    ),
    "add_movement_reason_label": MessageLookupByLibrary.simpleMessage(
      "Reason / Reference",
    ),
    "add_movement_title": MessageLookupByLibrary.simpleMessage(
      "New Stock Movement",
    ),
    "add_movement_type_label": MessageLookupByLibrary.simpleMessage(
      "Movement Type",
    ),
    "add_product_button": MessageLookupByLibrary.simpleMessage(
      "Create Product",
    ),
    "add_product_category_label": MessageLookupByLibrary.simpleMessage(
      "Category",
    ),
    "add_product_min_stock_hint": MessageLookupByLibrary.simpleMessage("Min"),
    "add_product_min_stock_label": MessageLookupByLibrary.simpleMessage(
      "Alert Level",
    ),
    "add_product_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter product name",
    ),
    "add_product_name_label": MessageLookupByLibrary.simpleMessage(
      "Product Name",
    ),
    "add_product_price_label": MessageLookupByLibrary.simpleMessage("Price"),
    "add_product_stock_label": MessageLookupByLibrary.simpleMessage(
      "Stock Quantity",
    ),
    "add_product_title": MessageLookupByLibrary.simpleMessage("New Product"),
    "add_supplier_address_hint": MessageLookupByLibrary.simpleMessage(
      "Enter supplier physical address",
    ),
    "add_supplier_address_label": MessageLookupByLibrary.simpleMessage(
      "Address",
    ),
    "add_supplier_button": MessageLookupByLibrary.simpleMessage(
      "Create Supplier",
    ),
    "add_supplier_email_label": MessageLookupByLibrary.simpleMessage(
      "Email Address",
    ),
    "add_supplier_name_hint": MessageLookupByLibrary.simpleMessage(
      "Enter supplier name",
    ),
    "add_supplier_name_label": MessageLookupByLibrary.simpleMessage(
      "Supplier Name",
    ),
    "add_supplier_phone_label": MessageLookupByLibrary.simpleMessage(
      "Phone Number",
    ),
    "add_supplier_title_add": MessageLookupByLibrary.simpleMessage(
      "Add Supplier",
    ),
    "add_supplier_title_edit": MessageLookupByLibrary.simpleMessage(
      "Edit Supplier",
    ),
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
    "category_clothes": MessageLookupByLibrary.simpleMessage("Clothes"),
    "category_electronics": MessageLookupByLibrary.simpleMessage("Electronics"),
    "category_food": MessageLookupByLibrary.simpleMessage("Food"),
    "category_no_description": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "chart_distribution_subtitle": MessageLookupByLibrary.simpleMessage(
      "by category value",
    ),
    "chart_distribution_title": MessageLookupByLibrary.simpleMessage(
      "Stock Distribution",
    ),
    "chart_stock_by_category": MessageLookupByLibrary.simpleMessage(
      "Stock Value by Category",
    ),
    "common_cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "common_delete": MessageLookupByLibrary.simpleMessage("Delete"),
    "common_edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "common_login": MessageLookupByLibrary.simpleMessage("Login"),
    "common_low_stock": MessageLookupByLibrary.simpleMessage("Low Stock"),
    "common_no_data": MessageLookupByLibrary.simpleMessage("No data"),
    "common_save": MessageLookupByLibrary.simpleMessage("Save Changes"),
    "common_signup": MessageLookupByLibrary.simpleMessage("Sign Up"),
    "dashboard_categories": MessageLookupByLibrary.simpleMessage("Categories"),
    "dashboard_movements": MessageLookupByLibrary.simpleMessage("Movement"),
    "dashboard_overview": MessageLookupByLibrary.simpleMessage("Overview"),
    "dashboard_products": MessageLookupByLibrary.simpleMessage("Products"),
    "dashboard_settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "dashboard_suppliers": MessageLookupByLibrary.simpleMessage("Suppliers"),
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
    "movements_empty": MessageLookupByLibrary.simpleMessage(
      "No stock movements recorded",
    ),
    "movements_title": MessageLookupByLibrary.simpleMessage("Stock Movements"),
    "movements_type_adjustment": MessageLookupByLibrary.simpleMessage(
      "Adjustment",
    ),
    "movements_type_in": MessageLookupByLibrary.simpleMessage("Stock In"),
    "movements_type_out": MessageLookupByLibrary.simpleMessage("Stock Out"),
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
    "stockIn": MessageLookupByLibrary.simpleMessage("Stock In"),
    "stockOut": MessageLookupByLibrary.simpleMessage("Stock Out"),
    "stock_status_in": m5,
    "stock_status_low": m6,
    "stock_status_out": MessageLookupByLibrary.simpleMessage("Out of Stock"),
    "suppliers_delete_message": m7,
    "suppliers_delete_title": MessageLookupByLibrary.simpleMessage(
      "Delete Supplier",
    ),
    "suppliers_deleted": m8,
    "suppliers_empty": MessageLookupByLibrary.simpleMessage(
      "No suppliers found",
    ),
    "suppliers_total_count": m9,
    "todayMovements": MessageLookupByLibrary.simpleMessage(
      "Today\'s Movements",
    ),
    "validation_required": MessageLookupByLibrary.simpleMessage("Required"),
    "validation_too_short": MessageLookupByLibrary.simpleMessage(
      "Too short (min 2 chars)",
    ),
    "widget_category_no_desc": MessageLookupByLibrary.simpleMessage(
      "No description",
    ),
    "widget_min_stock": m10,
    "widget_product_out": MessageLookupByLibrary.simpleMessage("Out"),
    "widget_product_qty": m11,
    "widget_search_hint": MessageLookupByLibrary.simpleMessage(
      "Search products...",
    ),
    "widget_stock_in": m12,
    "widget_stock_low": m13,
    "widget_stock_out": MessageLookupByLibrary.simpleMessage("Out of Stock"),
  };
}
