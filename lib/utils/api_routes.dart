class ApiRoutes {
  static products() => "products/";
  static favProducts(String uid) => "/users/$uid/favProducts/";
  static cartProducts(String uid) => "/users/$uid/cartProducts/";
  static addresses(String uid) => "/users/$uid/adresses/"; //edit name
  static address(String userID, String addressID) =>
      "users/$userID/adresses/$addressID";
  static paymentMethod(String userID, String paymentMethodID) =>
      "users/$userID/methodPayments/$paymentMethodID";
  static paymentMetdods(String uid) =>
      "/users/$uid/methodPayments/"; //edit name
  static favProduct(String uid, String favProductID) =>
      "/users/$uid/favProducts/$favProductID";
  static cartProduct(String uid, String cartProductID) =>
      "/users/$uid/cartProducts/$cartProductID";
  static product(String productID) => "products/$productID/";

  static announcements() => "announcements/";
  static announcement(String announcementID) =>
      "announcements/$announcementID/";

  static categories() => "categories/";
  static category(String categoryID) => "categories/$categoryID/";
  static user(String userID) => "user/$userID/";
  static linkedAccounts(String userID) => "user/$userID/linkedaccounts/";
}
