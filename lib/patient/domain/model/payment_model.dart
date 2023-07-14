class BaseSession {
  String sessionId;
  String objectType;
  int subtotalAmount;
  int totalAmount;
  String cancelUrl;
  String successUrl;
  String clientReferenceId;
  String customerEmail;
  String currencyType;
  String stripeUrl;

  BaseSession(
    this.sessionId,
    this.objectType,
    this.subtotalAmount,
    this.totalAmount,
    this.cancelUrl,
    this.successUrl,
    this.clientReferenceId,
    this.customerEmail,
    this.currencyType,
    this.stripeUrl,
  );
}

class SessionModel {
  BaseSession? sessionData;
  SessionModel(this.sessionData);
}
