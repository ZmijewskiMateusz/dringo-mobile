class AppUrl {
  static const String liveBaseURL = "https://dringo.herokuapp.com";
  static const String localBaseURL = "http://10.0.2.2:3000";
  static const String liveWsURL = "ws://dringo.herokuapp.com";
  static const String localWsURL = "ws://10.0.2.2:3000";
  static const String baseURL = liveBaseURL;
  static const String baseWsURL = liveWsURL;

  static const String login = baseURL + "/auth/login";
  static const String register = baseURL + "/auth/register";
}
