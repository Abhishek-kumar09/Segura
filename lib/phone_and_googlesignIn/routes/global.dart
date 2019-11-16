class Globalk {
 static String phoneNu;
static String name;
  Globalk(String phoneNum, String names) {
    phoneNu = phoneNum != null ? phoneNum : "Error retriving Phone";
    name = names != null ? names : "Error retriving Name";
  }
}