class AppUrl {
  static var baseUrl = 'https://soft.madicaltrade.com';

  static var loginEndPint = '$baseUrl/user-Login';
  static var registerEndPint = '$baseUrl/user-register';
  // static var registerApiEndPoint =  '$baseUrl/api/register' ;
  static var getcategoriesEndPoint = '$baseUrl/get-categories';
  static var updatecategoriesEndPoint = '$baseUrl/update-categories';
  static var deletecategoriesEndPoint = '$baseUrl/delete-categories';
  static var addcategoriesEndPoint = '$baseUrl/add-categories';
  static var getProductsEndPoint = '$baseUrl/get-products';
  static String getCategoryProduct(String productId) {
  return '$baseUrl/get-products/$productId';
}
}
