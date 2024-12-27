abstract interface class TokenGetter {
  String? get token;
}

class TokenStateHolder implements TokenGetter {
  @override
  String? token;
}
