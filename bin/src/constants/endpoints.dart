abstract class RouterEndpoints {
  ///Test server: IS RUNNING OR NOT
  ///For [GET] method
  static const String testServer = "/api/test/";

  ///==========================================================
  ///=======User API endpoints: get, login, delete, ...========
  ///==========================================================

  //==========Auth==========
  ///[POST] method
  static const String userSignIn = "/api/user/sign_in/";

  ///[POST] method
  static const String userSignUp = "/api/user/sign_up/";

  ///For [GET], [PUT], [DELETE] working
  static const String user = "/api/user/";

  //==========Saved Data==========
  ///[GET] method
  static const String userGetSavedServices = "/api/user/saved/services/";

  ///[GET] method
  static const String userGetSavedCompanies = "/api/user/saved/companies/";

  ///[GET] method
  static const String userGetSavedImages = "/api/user/saved/companies/";

  ///[GET] method
  static const String userGetSavedVideos = "/api/user/saved/companies/";

  //==========Joining==========
  ///[GET], [DELETE] method
  static const String userGetJoinedCompanies = "/api/user/joined/companies/";

  //==========Search History==========
  ///[GET], [DELETE] method
  static const String userGetSearchHistory = "/api/user/search/history/";

  //==========Nearby Services & Companies==========
  ///[GET] method
  static const String userNearbyCompanies = "/api/user/nearby/companies/";

  ///[GET] method
  static const String userNearbyServices = "/api/user/nearby/services/";

  ///================================================================
  ///=======Company Endpoints: get, auth, services, delete...========
  ///================================================================

  //==========Auth==========
  ///[POST] method
  static const String companySignIn = "/api/company/sign_in/";

  ///[POST] method
  static const String companySignUp = "/api/company/sign_up/";

  ///[DELETE], [GET], [PUT] methods
  static const String company = "/api/company/";

  //==========Service==========
  ///[GET] method
  static const String companyServices = "/api/company/services/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyService = "/api/company/services/service/";

  //==========Media==========
  ///[GET] method
  static const String companyVideos = "/api/company/media/videos/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyVideo = "/api/company/media/videos/video/";

  ///[GET] method
  static const String companyImages = "/api/company/media/images/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyImage = "/api/company/media/images/image/";

  //==========Contacts==========
  ///[GET] method
  static const String companyContacts = "/api/company/contacts/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyContact = "/api/company/contacts/contact/";

  //==========Socials==========
  ///[GET] method
  static const String companySocials = "/api/company/socials/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companySocialPage = "/api/company/socials/page/";

  //==========Locations==========
  ///[GET] method
  static const String companyLocations = "/api/company/locations/";

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyLocation = "/api/company/locations/location/";

  //==========Locations==========

  ///[GET], [POST], [PUT], [DELETE] methods
  static const String companyCategory = "/api/company/category/";

  ///===========================================
  ///=======For [User] & [Company] chats========
  ///===========================================
  ///
  ///[GET] method
  static const String userChats = "/api/user/chats/";

  ///[POST], [PUT], [DELETE], [GET]
  static const String userChat = "/api/user/chats/chat/";

  ///[GET] method
  static const String companyChats = "/api/company/chats/";

  ///[POST], [PUT], [DELETE], [GET]
  static const String companyChat = "/api/company/chats/chat/";

  ///[GET] method
  static const String messages = "/api/chat/messages/";

  ///[POST], [PUT], [DELETE], [GET]
  static const String message = "/api/chat/message/";
}
