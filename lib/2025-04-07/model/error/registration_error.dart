enum RegistrationError implements Error {
  invalidEmail,
  weakPassword,
  networkError;

  @override
  StackTrace? get stackTrace => null;
}
