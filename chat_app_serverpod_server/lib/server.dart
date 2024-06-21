import 'package:mailer/mailer.dart' as mail;
import 'package:mailer/smtp_server/gmail.dart';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'package:chat_app_serverpod_server/src/web/routes/root.dart';

import 'src/generated/protocol.dart';
import 'src/generated/endpoints.dart';

void run(List<String> args) async {
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler,
  );
// Configuration for sign in with email.
  auth.AuthConfig.set(auth.AuthConfig(
    sendValidationEmail: (session, email, validationCode) async {
      // Retrieve the credentials
      final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
      final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

      // Create a SMTP client for Gmail.
      final smtpServer = gmail(gmailEmail, gmailPassword);

      // Create an email message with the validation code.
      final message = mail.Message()
        ..from = mail.Address(gmailEmail)
        ..recipients.add(email)
        ..subject = 'Verification code for Serverpod'
        ..html = 'Your verification code is: $validationCode';

      // Send the email message.
      try {
        await mail.send(message, smtpServer);
      } catch (_) {
        // Return false if the email could not be sent.
        return false;
      }

      return true;
    },
    sendPasswordResetEmail: (session, userInfo, validationCode) async {
      // Retrieve the credentials
      final gmailEmail = session.serverpod.getPassword('gmailEmail')!;
      final gmailPassword = session.serverpod.getPassword('gmailPassword')!;

      // Create a SMTP client for Gmail.
      final smtpServer = gmail(gmailEmail, gmailPassword);

      // Create an email message with the password reset link.
      final message = mail.Message()
        ..from = mail.Address(gmailEmail)
        ..recipients.add(userInfo.email!)
        ..subject = 'Password reset link for Serverpod'
        ..html = 'Here is your password reset code: $validationCode>';

      // Send the email message.
      try {
        await mail.send(message, smtpServer);
      } catch (_) {
        // Return false if the email could not be sent.
        return false;
      }

      return true;
    },
  ));
  pod.webServer.addRoute(RouteRoot(), '/');
  pod.webServer.addRoute(RouteRoot(), '/index.html');

  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: 'static', basePath: '/'),
    '/*',
  );

  await pod.start();
}
