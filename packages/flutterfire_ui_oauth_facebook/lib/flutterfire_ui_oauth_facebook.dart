export 'src/provider.dart' show FacebookProvider;
export 'src/theme.dart' show FacebookProviderButtonStyle;

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterfire_ui_oauth/flutterfire_ui_oauth.dart';

import 'src/provider.dart';

class FacebookSignInButton extends _FacebookSignInButton {
  const FacebookSignInButton({
    Key? key,
    required Widget loadingIndicator,
    required String clientId,
    String? redirectUri,
    AuthAction? action,
    FirebaseAuth? auth,
    bool? isLoading,
    String? label,
    DifferentProvidersFoundCallback? onDifferentProvidersFound,
    SignedInCallback? onSignedIn,
    void Function()? onTap,
    bool? overrideDefaultTapAction,
    double? size,
  }) : super(
          key: key,
          clientId: clientId,
          action: action,
          auth: auth,
          isLoading: isLoading ?? false,
          loadingIndicator: loadingIndicator,
          label: label,
          onDifferentProvidersFound: onDifferentProvidersFound,
          onSignedIn: onSignedIn,
          onTap: onTap,
          overrideDefaultTapAction: overrideDefaultTapAction,
          size: size,
          redirectUri: redirectUri,
        );
}

class FacebookSignInIconButton extends _FacebookSignInButton {
  const FacebookSignInIconButton({
    Key? key,
    required String clientId,
    required Widget loadingIndicator,
    AuthAction? action,
    FirebaseAuth? auth,
    bool? isLoading,
    DifferentProvidersFoundCallback? onDifferentProvidersFound,
    SignedInCallback? onSignedIn,
    void Function()? onTap,
    bool? overrideDefaultTapAction,
    double? size,
    String? redirectUri,
  }) : super(
          key: key,
          action: action,
          clientId: clientId,
          auth: auth,
          isLoading: isLoading ?? false,
          loadingIndicator: loadingIndicator,
          label: '',
          onDifferentProvidersFound: onDifferentProvidersFound,
          onSignedIn: onSignedIn,
          onTap: onTap,
          overrideDefaultTapAction: overrideDefaultTapAction,
          size: size,
          redirectUri: redirectUri,
        );
}

class _FacebookSignInButton extends StatelessWidget {
  final String label;
  final Widget loadingIndicator;
  final void Function()? onTap;
  final bool overrideDefaultTapAction;
  final bool isLoading;
  final AuthAction? action;
  final FirebaseAuth? auth;
  final DifferentProvidersFoundCallback? onDifferentProvidersFound;
  final SignedInCallback? onSignedIn;
  final double size;
  final String clientId;
  final String? redirectUri;

  const _FacebookSignInButton({
    Key? key,
    required this.clientId,
    required this.loadingIndicator,
    String? label,
    bool? overrideDefaultTapAction,
    this.onTap,
    this.isLoading = false,
    this.action = AuthAction.signIn,
    this.auth,
    this.onDifferentProvidersFound,
    this.onSignedIn,
    double? size,
    this.redirectUri,
  })  : label = label ?? 'Sign in with Facebook',
        overrideDefaultTapAction = overrideDefaultTapAction ?? false,
        size = size ?? 19,
        super(key: key);

  FacebookProvider get provider => FacebookProvider(
        clientId: clientId,
        redirectUri: redirectUri,
      );

  @override
  Widget build(BuildContext context) {
    return OAuthProviderButton(
      provider: provider,
      label: label,
      onTap: onTap,
      loadingIndicator: loadingIndicator,
      isLoading: isLoading,
      action: action,
      auth: auth ?? FirebaseAuth.instance,
      onDifferentProvidersFound: onDifferentProvidersFound,
      onSignedIn: onSignedIn,
      overrideDefaultTapAction: overrideDefaultTapAction,
      size: size,
    );
  }
}
