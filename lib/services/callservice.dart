import 'package:url_launcher/url_launcher.dart';

class CallService{
  void call(String number) => launch('tel: $number');
  void sms(String number) => launch('sms: $number');
  void email(String email) => launch('mailto: $email');
}