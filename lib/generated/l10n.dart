// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Login`
  String get common_login {
    return Intl.message(
      'Login',
      name: 'common_login',
      desc: 'Generic login text',
      args: [],
    );
  }

  /// `Sign Up`
  String get common_signup {
    return Intl.message(
      'Sign Up',
      name: 'common_signup',
      desc: 'Generic signup text',
      args: [],
    );
  }

  /// `Cancel`
  String get common_cancel {
    return Intl.message(
      'Cancel',
      name: 'common_cancel',
      desc: 'Cancel button',
      args: [],
    );
  }

  /// `Delete`
  String get common_delete {
    return Intl.message(
      'Delete',
      name: 'common_delete',
      desc: 'Delete button',
      args: [],
    );
  }

  /// `Save Changes`
  String get common_save {
    return Intl.message(
      'Save Changes',
      name: 'common_save',
      desc: 'Save button',
      args: [],
    );
  }

  /// `Edit`
  String get common_edit {
    return Intl.message(
      'Edit',
      name: 'common_edit',
      desc: 'Edit button',
      args: [],
    );
  }

  /// `Hello`
  String get onboarding_title {
    return Intl.message(
      'Hello',
      name: 'onboarding_title',
      desc: 'Main greeting on onboarding',
      args: [],
    );
  }

  /// `Welcome to Little Drop, where you manage your daily tasks`
  String get onboarding_subtitle {
    return Intl.message(
      'Welcome to Little Drop, where you manage your daily tasks',
      name: 'onboarding_subtitle',
      desc: 'Onboarding subtitle',
      args: [],
    );
  }

  /// `Sign up using`
  String get onboarding_social_text {
    return Intl.message(
      'Sign up using',
      name: 'onboarding_social_text',
      desc: 'Social signup text',
      args: [],
    );
  }

  /// `Welcome Back`
  String get auth_login_title {
    return Intl.message(
      'Welcome Back',
      name: 'auth_login_title',
      desc: 'Login screen title',
      args: [],
    );
  }

  /// `Login to manage your stock efficiently`
  String get auth_login_subtitle {
    return Intl.message(
      'Login to manage your stock efficiently',
      name: 'auth_login_subtitle',
      desc: 'Login subtitle',
      args: [],
    );
  }

  /// `Email or Username`
  String get auth_login_email_label {
    return Intl.message(
      'Email or Username',
      name: 'auth_login_email_label',
      desc: 'Email label',
      args: [],
    );
  }

  /// `Enter your email`
  String get auth_login_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'auth_login_email_hint',
      desc: 'Email hint',
      args: [],
    );
  }

  /// `Password`
  String get auth_login_password_label {
    return Intl.message(
      'Password',
      name: 'auth_login_password_label',
      desc: 'Password label',
      args: [],
    );
  }

  /// `Enter your password`
  String get auth_login_password_hint {
    return Intl.message(
      'Enter your password',
      name: 'auth_login_password_hint',
      desc: 'Password hint',
      args: [],
    );
  }

  /// `Login`
  String get auth_login_button {
    return Intl.message(
      'Login',
      name: 'auth_login_button',
      desc: 'Login button',
      args: [],
    );
  }

  /// `Don't have an account?`
  String get auth_login_no_account {
    return Intl.message(
      'Don\'t have an account?',
      name: 'auth_login_no_account',
      desc: 'No account text',
      args: [],
    );
  }

  /// `Sign Up`
  String get auth_login_signup_link {
    return Intl.message(
      'Sign Up',
      name: 'auth_login_signup_link',
      desc: 'Signup link',
      args: [],
    );
  }

  /// `Please enter your username or email`
  String get auth_login_validation_empty_email {
    return Intl.message(
      'Please enter your username or email',
      name: 'auth_login_validation_empty_email',
      desc: 'Empty email error',
      args: [],
    );
  }

  /// `Please enter your password`
  String get auth_login_validation_empty_password {
    return Intl.message(
      'Please enter your password',
      name: 'auth_login_validation_empty_password',
      desc: 'Empty password error',
      args: [],
    );
  }

  /// `Password must be at least 6 characters`
  String get auth_login_validation_short_password {
    return Intl.message(
      'Password must be at least 6 characters',
      name: 'auth_login_validation_short_password',
      desc: 'Short password error',
      args: [],
    );
  }

  /// `Create Account`
  String get auth_signup_title {
    return Intl.message(
      'Create Account',
      name: 'auth_signup_title',
      desc: 'Signup title',
      args: [],
    );
  }

  /// `Fill in the details to get started`
  String get auth_signup_subtitle {
    return Intl.message(
      'Fill in the details to get started',
      name: 'auth_signup_subtitle',
      desc: 'Signup subtitle',
      args: [],
    );
  }

  /// `Username`
  String get auth_signup_username_label {
    return Intl.message(
      'Username',
      name: 'auth_signup_username_label',
      desc: 'Username label',
      args: [],
    );
  }

  /// `Enter your username`
  String get auth_signup_username_hint {
    return Intl.message(
      'Enter your username',
      name: 'auth_signup_username_hint',
      desc: 'Username hint',
      args: [],
    );
  }

  /// `Email`
  String get auth_signup_email_label {
    return Intl.message(
      'Email',
      name: 'auth_signup_email_label',
      desc: 'Email label',
      args: [],
    );
  }

  /// `Enter your email`
  String get auth_signup_email_hint {
    return Intl.message(
      'Enter your email',
      name: 'auth_signup_email_hint',
      desc: 'Email hint',
      args: [],
    );
  }

  /// `Password`
  String get auth_signup_password_label {
    return Intl.message(
      'Password',
      name: 'auth_signup_password_label',
      desc: 'Password label',
      args: [],
    );
  }

  /// `Enter password`
  String get auth_signup_password_hint {
    return Intl.message(
      'Enter password',
      name: 'auth_signup_password_hint',
      desc: 'Password hint',
      args: [],
    );
  }

  /// `Confirm Password`
  String get auth_signup_confirm_password_label {
    return Intl.message(
      'Confirm Password',
      name: 'auth_signup_confirm_password_label',
      desc: 'Confirm password label',
      args: [],
    );
  }

  /// `Repeat password`
  String get auth_signup_confirm_password_hint {
    return Intl.message(
      'Repeat password',
      name: 'auth_signup_confirm_password_hint',
      desc: 'Confirm password hint',
      args: [],
    );
  }

  /// `Sign Up`
  String get auth_signup_button {
    return Intl.message(
      'Sign Up',
      name: 'auth_signup_button',
      desc: 'Signup button',
      args: [],
    );
  }

  /// `Already have an account?`
  String get auth_signup_have_account {
    return Intl.message(
      'Already have an account?',
      name: 'auth_signup_have_account',
      desc: 'Have account text',
      args: [],
    );
  }

  /// `Login`
  String get auth_signup_login_link {
    return Intl.message(
      'Login',
      name: 'auth_signup_login_link',
      desc: 'Login link',
      args: [],
    );
  }

  /// `Username is required`
  String get auth_signup_validation_username_required {
    return Intl.message(
      'Username is required',
      name: 'auth_signup_validation_username_required',
      desc: 'Username required error',
      args: [],
    );
  }

  /// `Email is required`
  String get auth_signup_validation_email_required {
    return Intl.message(
      'Email is required',
      name: 'auth_signup_validation_email_required',
      desc: 'Email required error',
      args: [],
    );
  }

  /// `Enter a valid email`
  String get auth_signup_validation_email_invalid {
    return Intl.message(
      'Enter a valid email',
      name: 'auth_signup_validation_email_invalid',
      desc: 'Invalid email error',
      args: [],
    );
  }

  /// `Minimum 6 characters`
  String get auth_signup_validation_password_short {
    return Intl.message(
      'Minimum 6 characters',
      name: 'auth_signup_validation_password_short',
      desc: 'Short password error',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get auth_signup_validation_confirm_required {
    return Intl.message(
      'Please confirm your password',
      name: 'auth_signup_validation_confirm_required',
      desc: 'Confirm required error',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get auth_signup_validation_password_mismatch {
    return Intl.message(
      'Passwords do not match',
      name: 'auth_signup_validation_password_mismatch',
      desc: 'Password mismatch error',
      args: [],
    );
  }

  /// `Dashboard`
  String get dashboard_title {
    return Intl.message(
      'Dashboard',
      name: 'dashboard_title',
      desc: 'Dashboard tab title',
      args: [],
    );
  }

  /// `Products`
  String get dashboard_products {
    return Intl.message(
      'Products',
      name: 'dashboard_products',
      desc: 'Products tab title',
      args: [],
    );
  }

  /// `Suppliers`
  String get dashboard_suppliers {
    return Intl.message(
      'Suppliers',
      name: 'dashboard_suppliers',
      desc: 'Supplier tab title',
      args: [],
    );
  }

  /// `Categories`
  String get dashboard_categories {
    return Intl.message(
      'Categories',
      name: 'dashboard_categories',
      desc: 'Categories tab title',
      args: [],
    );
  }

  /// `Movement`
  String get dashboard_movements {
    return Intl.message(
      'Movement',
      name: 'dashboard_movements',
      desc: 'Movement tab title',
      args: [],
    );
  }

  /// `Settings`
  String get dashboard_settings {
    return Intl.message(
      'Settings',
      name: 'dashboard_settings',
      desc: 'Settings tab title',
      args: [],
    );
  }

  /// `Overview`
  String get dashboard_overview {
    return Intl.message(
      'Overview',
      name: 'dashboard_overview',
      desc: 'Overview bottom nav',
      args: [],
    );
  }

  /// `Total Products: {count}`
  String products_title(int count) {
    return Intl.message(
      'Total Products: $count',
      name: 'products_title',
      desc: 'Products page title with count',
      args: [count],
    );
  }

  /// `Stock Distribution`
  String get chart_distribution_title {
    return Intl.message(
      'Stock Distribution',
      name: 'chart_distribution_title',
      desc: '',
      args: [],
    );
  }

  /// `by category value`
  String get chart_distribution_subtitle {
    return Intl.message(
      'by category value',
      name: 'chart_distribution_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Stock Value by Category`
  String get chart_stock_by_category {
    return Intl.message(
      'Stock Value by Category',
      name: 'chart_stock_by_category',
      desc: '',
      args: [],
    );
  }

  /// `No data`
  String get common_no_data {
    return Intl.message('No data', name: 'common_no_data', desc: '', args: []);
  }

  /// `No products found`
  String get products_empty {
    return Intl.message(
      'No products found',
      name: 'products_empty',
      desc: 'Empty products message',
      args: [],
    );
  }

  /// `Delete Product`
  String get products_delete_title {
    return Intl.message(
      'Delete Product',
      name: 'products_delete_title',
      desc: 'Delete product dialog title',
      args: [],
    );
  }

  /// `Are you sure you want to delete '{name}'?`
  String products_delete_message(String name) {
    return Intl.message(
      'Are you sure you want to delete \'$name\'?',
      name: 'products_delete_message',
      desc: 'Delete confirmation message',
      args: [name],
    );
  }

  /// `{name} deleted`
  String products_deleted(String name) {
    return Intl.message(
      '$name deleted',
      name: 'products_deleted',
      desc: 'Product deleted message',
      args: [name],
    );
  }

  /// `No categories found`
  String get categories_empty {
    return Intl.message(
      'No categories found',
      name: 'categories_empty',
      desc: 'Empty categories message',
      args: [],
    );
  }

  /// `Delete Category`
  String get categories_delete_title {
    return Intl.message(
      'Delete Category',
      name: 'categories_delete_title',
      desc: 'Delete category dialog title',
      args: [],
    );
  }

  /// `No description`
  String get category_no_description {
    return Intl.message(
      'No description',
      name: 'category_no_description',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete '{name}'?`
  String categories_delete_message(String name) {
    return Intl.message(
      'Are you sure you want to delete \'$name\'?',
      name: 'categories_delete_message',
      desc: 'Delete confirmation message',
      args: [name],
    );
  }

  /// `{name} deleted`
  String categories_deleted(String name) {
    return Intl.message(
      '$name deleted',
      name: 'categories_deleted',
      desc: 'Category deleted message',
      args: [name],
    );
  }

  /// `Appearance`
  String get settings_appearance {
    return Intl.message(
      'Appearance',
      name: 'settings_appearance',
      desc: 'Appearance section',
      args: [],
    );
  }

  /// `Dark Mode`
  String get settings_dark_mode {
    return Intl.message(
      'Dark Mode',
      name: 'settings_dark_mode',
      desc: 'Dark mode toggle',
      args: [],
    );
  }

  /// `Account`
  String get settings_account {
    return Intl.message(
      'Account',
      name: 'settings_account',
      desc: 'Account section',
      args: [],
    );
  }

  /// `Low Stock`
  String get common_low_stock {
    return Intl.message(
      'Low Stock',
      name: 'common_low_stock',
      desc: 'Short title for low stock statistics',
      args: [],
    );
  }

  /// `Logout`
  String get settings_logout {
    return Intl.message(
      'Logout',
      name: 'settings_logout',
      desc: 'Logout button',
      args: [],
    );
  }

  /// `Logout`
  String get settings_logout_title {
    return Intl.message(
      'Logout',
      name: 'settings_logout_title',
      desc: 'Logout dialog title',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get settings_logout_message {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'settings_logout_message',
      desc: 'Logout confirmation message',
      args: [],
    );
  }

  /// `Version 1.0.0`
  String get settings_version {
    return Intl.message(
      'Version 1.0.0',
      name: 'settings_version',
      desc: 'App version',
      args: [],
    );
  }

  /// `Category updated`
  String get detail_category_updated {
    return Intl.message(
      'Category updated',
      name: 'detail_category_updated',
      desc: 'Category update success message',
      args: [],
    );
  }

  /// `Product updated`
  String get detail_product_updated {
    return Intl.message(
      'Product updated',
      name: 'detail_product_updated',
      desc: 'Product update success message',
      args: [],
    );
  }

  /// `Category Name`
  String get detail_category_name {
    return Intl.message(
      'Category Name',
      name: 'detail_category_name',
      desc: 'Category name label',
      args: [],
    );
  }

  /// `Description`
  String get detail_description {
    return Intl.message(
      'Description',
      name: 'detail_description',
      desc: 'Description label',
      args: [],
    );
  }

  /// `Edit Category`
  String get detail_edit_category {
    return Intl.message(
      'Edit Category',
      name: 'detail_edit_category',
      desc: 'Edit category button',
      args: [],
    );
  }

  /// `PRODUCTS`
  String get detail_products_label {
    return Intl.message(
      'PRODUCTS',
      name: 'detail_products_label',
      desc: 'Products section label',
      args: [],
    );
  }

  /// `No products in this category`
  String get detail_no_products {
    return Intl.message(
      'No products in this category',
      name: 'detail_no_products',
      desc: 'No products message',
      args: [],
    );
  }

  /// `Product Name`
  String get detail_product_name {
    return Intl.message(
      'Product Name',
      name: 'detail_product_name',
      desc: 'Product name label',
      args: [],
    );
  }

  /// `Price (MRU)`
  String get detail_price {
    return Intl.message(
      'Price (MRU)',
      name: 'detail_price',
      desc: 'Price label',
      args: [],
    );
  }

  /// `PRODUCT INFO`
  String get detail_product_info {
    return Intl.message(
      'PRODUCT INFO',
      name: 'detail_product_info',
      desc: 'Product info section',
      args: [],
    );
  }

  /// `STOCK INFO`
  String get detail_stock_info {
    return Intl.message(
      'STOCK INFO',
      name: 'detail_stock_info',
      desc: 'Stock info section',
      args: [],
    );
  }

  /// `Stock Quantity`
  String get detail_stock_quantity {
    return Intl.message(
      'Stock Quantity',
      name: 'detail_stock_quantity',
      desc: 'Stock quantity label',
      args: [],
    );
  }

  /// `Alert Level`
  String get detail_alert_level {
    return Intl.message(
      'Alert Level',
      name: 'detail_alert_level',
      desc: 'Alert level label',
      args: [],
    );
  }

  /// `Edit Product`
  String get detail_edit_product {
    return Intl.message(
      'Edit Product',
      name: 'detail_edit_product',
      desc: 'Edit product button',
      args: [],
    );
  }

  /// `CATEGORY INFO`
  String get detail_category_info {
    return Intl.message(
      'CATEGORY INFO',
      name: 'detail_category_info',
      desc: 'Category info section',
      args: [],
    );
  }

  /// `Out`
  String get widget_product_out {
    return Intl.message(
      'Out',
      name: 'widget_product_out',
      desc: 'Out of stock status',
      args: [],
    );
  }

  /// `Qty: {quantity}`
  String widget_product_qty(int quantity) {
    return Intl.message(
      'Qty: $quantity',
      name: 'widget_product_qty',
      desc: 'Stock quantity display',
      args: [quantity],
    );
  }

  /// `Search products...`
  String get widget_search_hint {
    return Intl.message(
      'Search products...',
      name: 'widget_search_hint',
      desc: 'Search bar hint',
      args: [],
    );
  }

  /// `No description`
  String get widget_category_no_desc {
    return Intl.message(
      'No description',
      name: 'widget_category_no_desc',
      desc: 'No description message',
      args: [],
    );
  }

  /// `Out of Stock`
  String get widget_stock_out {
    return Intl.message(
      'Out of Stock',
      name: 'widget_stock_out',
      desc: 'Out of stock label',
      args: [],
    );
  }

  /// `Low Stock — {count} left`
  String widget_stock_low(int count) {
    return Intl.message(
      'Low Stock — $count left',
      name: 'widget_stock_low',
      desc: 'Low stock label',
      args: [count],
    );
  }

  /// `In Stock — {count} units`
  String widget_stock_in(int count) {
    return Intl.message(
      'In Stock — $count units',
      name: 'widget_stock_in',
      desc: 'In stock label',
      args: [count],
    );
  }

  /// `Min: {count}`
  String widget_min_stock(int count) {
    return Intl.message(
      'Min: $count',
      name: 'widget_min_stock',
      desc: 'Minimum stock label',
      args: [count],
    );
  }

  /// `New Product`
  String get add_product_title {
    return Intl.message(
      'New Product',
      name: 'add_product_title',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get add_product_name_label {
    return Intl.message(
      'Product Name',
      name: 'add_product_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter product name`
  String get add_product_name_hint {
    return Intl.message(
      'Enter product name',
      name: 'add_product_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Price`
  String get add_product_price_label {
    return Intl.message(
      'Price',
      name: 'add_product_price_label',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get add_product_category_label {
    return Intl.message(
      'Category',
      name: 'add_product_category_label',
      desc: '',
      args: [],
    );
  }

  /// `Stock Quantity`
  String get add_product_stock_label {
    return Intl.message(
      'Stock Quantity',
      name: 'add_product_stock_label',
      desc: '',
      args: [],
    );
  }

  /// `Alert Level`
  String get add_product_min_stock_label {
    return Intl.message(
      'Alert Level',
      name: 'add_product_min_stock_label',
      desc: '',
      args: [],
    );
  }

  /// `Min`
  String get add_product_min_stock_hint {
    return Intl.message(
      'Min',
      name: 'add_product_min_stock_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Product`
  String get add_product_button {
    return Intl.message(
      'Create Product',
      name: 'add_product_button',
      desc: '',
      args: [],
    );
  }

  /// `Electronics`
  String get category_electronics {
    return Intl.message(
      'Electronics',
      name: 'category_electronics',
      desc: '',
      args: [],
    );
  }

  /// `Food`
  String get category_food {
    return Intl.message('Food', name: 'category_food', desc: '', args: []);
  }

  /// `Clothes`
  String get category_clothes {
    return Intl.message(
      'Clothes',
      name: 'category_clothes',
      desc: '',
      args: [],
    );
  }

  /// `Required`
  String get validation_required {
    return Intl.message(
      'Required',
      name: 'validation_required',
      desc: '',
      args: [],
    );
  }

  /// `New Category`
  String get add_category_title {
    return Intl.message(
      'New Category',
      name: 'add_category_title',
      desc: '',
      args: [],
    );
  }

  /// `Category Name`
  String get add_category_name_label {
    return Intl.message(
      'Category Name',
      name: 'add_category_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter category name`
  String get add_category_name_hint {
    return Intl.message(
      'Enter category name',
      name: 'add_category_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get add_category_desc_label {
    return Intl.message(
      'Description',
      name: 'add_category_desc_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter category description`
  String get add_category_desc_hint {
    return Intl.message(
      'Enter category description',
      name: 'add_category_desc_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Category`
  String get add_category_button {
    return Intl.message(
      'Create Category',
      name: 'add_category_button',
      desc: '',
      args: [],
    );
  }

  /// `Too short (min 2 chars)`
  String get validation_too_short {
    return Intl.message(
      'Too short (min 2 chars)',
      name: 'validation_too_short',
      desc: '',
      args: [],
    );
  }

  /// `Out of Stock`
  String get stock_status_out {
    return Intl.message(
      'Out of Stock',
      name: 'stock_status_out',
      desc: '',
      args: [],
    );
  }

  /// `Low Stock — {count} left`
  String stock_status_low(int count) {
    return Intl.message(
      'Low Stock — $count left',
      name: 'stock_status_low',
      desc: '',
      args: [count],
    );
  }

  /// `Today's Movements`
  String get todayMovements {
    return Intl.message(
      'Today\'s Movements',
      name: 'todayMovements',
      desc: '',
      args: [],
    );
  }

  /// `Stock In`
  String get stockIn {
    return Intl.message('Stock In', name: 'stockIn', desc: '', args: []);
  }

  /// `Stock Out`
  String get stockOut {
    return Intl.message('Stock Out', name: 'stockOut', desc: '', args: []);
  }

  /// `Delete Supplier`
  String get suppliers_delete_title {
    return Intl.message(
      'Delete Supplier',
      name: 'suppliers_delete_title',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to delete supplier {name}?`
  String suppliers_delete_message(Object name) {
    return Intl.message(
      'Are you sure you want to delete supplier $name?',
      name: 'suppliers_delete_message',
      desc: '',
      args: [name],
    );
  }

  /// `Supplier {name} deleted successfully`
  String suppliers_deleted(Object name) {
    return Intl.message(
      'Supplier $name deleted successfully',
      name: 'suppliers_deleted',
      desc: '',
      args: [name],
    );
  }

  /// `Suppliers ({count})`
  String suppliers_total_count(Object count) {
    return Intl.message(
      'Suppliers ($count)',
      name: 'suppliers_total_count',
      desc: '',
      args: [count],
    );
  }

  /// `No suppliers found`
  String get suppliers_empty {
    return Intl.message(
      'No suppliers found',
      name: 'suppliers_empty',
      desc: '',
      args: [],
    );
  }

  /// `Add Supplier`
  String get add_supplier_title_add {
    return Intl.message(
      'Add Supplier',
      name: 'add_supplier_title_add',
      desc: '',
      args: [],
    );
  }

  /// `Edit Supplier`
  String get add_supplier_title_edit {
    return Intl.message(
      'Edit Supplier',
      name: 'add_supplier_title_edit',
      desc: '',
      args: [],
    );
  }

  /// `Supplier Name`
  String get add_supplier_name_label {
    return Intl.message(
      'Supplier Name',
      name: 'add_supplier_name_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter supplier name`
  String get add_supplier_name_hint {
    return Intl.message(
      'Enter supplier name',
      name: 'add_supplier_name_hint',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get add_supplier_phone_label {
    return Intl.message(
      'Phone Number',
      name: 'add_supplier_phone_label',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get add_supplier_email_label {
    return Intl.message(
      'Email Address',
      name: 'add_supplier_email_label',
      desc: '',
      args: [],
    );
  }

  /// `Address`
  String get add_supplier_address_label {
    return Intl.message(
      'Address',
      name: 'add_supplier_address_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter supplier physical address`
  String get add_supplier_address_hint {
    return Intl.message(
      'Enter supplier physical address',
      name: 'add_supplier_address_hint',
      desc: '',
      args: [],
    );
  }

  /// `Create Supplier`
  String get add_supplier_button {
    return Intl.message(
      'Create Supplier',
      name: 'add_supplier_button',
      desc: '',
      args: [],
    );
  }

  /// `In Stock — {count} units`
  String stock_status_in(int count) {
    return Intl.message(
      'In Stock — $count units',
      name: 'stock_status_in',
      desc: '',
      args: [count],
    );
  }

  /// `Stock Movements`
  String get movements_title {
    return Intl.message(
      'Stock Movements',
      name: 'movements_title',
      desc: '',
      args: [],
    );
  }

  /// `No stock movements recorded`
  String get movements_empty {
    return Intl.message(
      'No stock movements recorded',
      name: 'movements_empty',
      desc: '',
      args: [],
    );
  }

  /// `Stock In`
  String get movements_type_in {
    return Intl.message(
      'Stock In',
      name: 'movements_type_in',
      desc: '',
      args: [],
    );
  }

  /// `Stock Out`
  String get movements_type_out {
    return Intl.message(
      'Stock Out',
      name: 'movements_type_out',
      desc: '',
      args: [],
    );
  }

  /// `Adjustment`
  String get movements_type_adjustment {
    return Intl.message(
      'Adjustment',
      name: 'movements_type_adjustment',
      desc: '',
      args: [],
    );
  }

  /// `New Stock Movement`
  String get add_movement_title {
    return Intl.message(
      'New Stock Movement',
      name: 'add_movement_title',
      desc: '',
      args: [],
    );
  }

  /// `Select Product`
  String get add_movement_product_label {
    return Intl.message(
      'Select Product',
      name: 'add_movement_product_label',
      desc: '',
      args: [],
    );
  }

  /// `Quantity`
  String get add_movement_quantity_label {
    return Intl.message(
      'Quantity',
      name: 'add_movement_quantity_label',
      desc: '',
      args: [],
    );
  }

  /// `Movement Type`
  String get add_movement_type_label {
    return Intl.message(
      'Movement Type',
      name: 'add_movement_type_label',
      desc: '',
      args: [],
    );
  }

  /// `Reason / Reference`
  String get add_movement_reason_label {
    return Intl.message(
      'Reason / Reference',
      name: 'add_movement_reason_label',
      desc: '',
      args: [],
    );
  }

  /// `Enter reason (e.g. Initial inventory, sale)`
  String get add_movement_reason_hint {
    return Intl.message(
      'Enter reason (e.g. Initial inventory, sale)',
      name: 'add_movement_reason_hint',
      desc: '',
      args: [],
    );
  }

  /// `Save Movement`
  String get add_movement_button {
    return Intl.message(
      'Save Movement',
      name: 'add_movement_button',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
