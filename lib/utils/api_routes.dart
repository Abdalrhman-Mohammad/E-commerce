class ApiRoutes {
  static products() => "products/";
  static product(String productID) => "products/$productID/";

  static announcements() => "announcements/";
  static announcement(String announcementID) =>
      "announcements/$announcementID/";

  static categories() => "categories/";
  static category(String categoryID) => "categories/$categoryID/";
  static user(String userID) => "user/$userID/";
  static linkedAccounts(String userID) => "user/$userID/linkedaccounts/";
}
