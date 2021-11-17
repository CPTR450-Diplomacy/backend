part of controller;

class GoogleJwt {
  late final String token;

  final List<String> parts = [];

  final String publicKeyUrl =
      'https://www.googleapis.com/robot/v1/metadata/x509/'
      'securetoken@system.gserviceaccount.com';

  Map<String, dynamic>? headerJson;

  var payloadJson;

  GoogleJwt(String jwt) {
    token = jwt;
    parts.addAll(jwt.split('.'));
    if (parts.length != 3) {
      throw StateError('Invalid token');
    }
  }

  // https://stacksecrets.com/dart/how-to-decode-a-json-web-tokenjwt-in-dart
  void decodeHeaderAndPayload() {
    parts[0] = utf8.decode(base64Url.decode(base64.normalize(parts[0])));
    parts[1] = utf8.decode(base64Url.decode(base64.normalize(parts[1])));

    headerJson = jsonDecode(parts[0]);
    payloadJson = jsonDecode(parts[1]);
  }

  Future<bool> verifySignature() async {
    // if (headerJson == null) {
    //   decodeHeaderAndPayload();
    // }
    // String pem = await retrievePublicKey(headerJson!['kid']);
    // var cert = X509Utils.x509CertificateFromPem(pem);
    // print(CryptoUtils.rsaPublicKeyFromDERBytesPkcs1(
    //     cert.publicKeyData.plainSha1!));
    // var bytes = CryptoUtils.getBytesFromPEMString(pem);
    // print(CryptoUtils.rsaPublicKeyFromDERBytes(bytes));
    // cert = X509Utils.x509CertificateFromPem(cert.publicKeyData.bytes!);
    // print(cert.publicKeyData.bytes);
    // String bytesString = cert.publicKeyData.bytes!;
    // List<int> bytesList = [];
    // var temp = '';
    // for (int i = 0; i < bytesString.length; i++) {
    //   temp += bytesString[i];
    //   if (temp.length == 2) {
    //     bytesList.add(int.parse(temp));
    //     temp = '';
    //   }
    // }
    // print(bytesList);
    // String publicKey =
    //     CryptoUtils.rsaPublicKeyFromPem(cert.publicKeyData.bytes!).toString();
    // print(publicKey);
    // try {
    //   // jwt.JWT.verify(token, jwt.RSAPublicKey(cert.publicKeyData));
    //   return true;
    // } catch (e) {
    //   print(e.toString());
    //   return false;
    // }
    return true;
  }

  Future<String> retrievePublicKey(String kid) async {
    http.Request request = http.Request('GET', Uri.parse(publicKeyUrl));

    http.StreamedResponse response;
    try {
      response = await request.send();
    } catch (_) {
      rethrow;
    }

    var json = jsonDecode(await response.stream.bytesToString());
    return json[kid];
  }
}
