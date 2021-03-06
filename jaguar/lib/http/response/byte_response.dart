import 'dart:io';
import 'response.dart';

/// [Response] that writes the bytes provided in [value] to the response.
class ByteResponse extends Response<List<int>> {
  ByteResponse(List<int> value,
      {int statusCode: 200,
      Map<String, dynamic> headers,
      String mimeType,
      String charset})
      : super(value,
            statusCode: statusCode,
            headers: headers,
            mimeType: mimeType,
            charset: charset);

  @override
  void writeResponse(HttpResponse resp) {
    writeAllButBody(resp);
    resp.add(value);
  }
}
