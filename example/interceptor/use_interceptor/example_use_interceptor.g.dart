// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.routes;

// **************************************************************************
// Generator: ApiGenerator
// Target: class BooksApi
// **************************************************************************

abstract class _$JaguarBooksApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Get(),
    const Post()
  ];

  Map<dynamic, dynamic> getJaguarInfo();

  Map<dynamic, dynamic> createJaguarInfo(Map<dynamic, dynamic> body);

  Future<Response> handleRequest(Request request, {String prefix: ''}) async {
    prefix += '/api/book';
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for getJaguarInfo
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      EncodeToJson iEncodeToJson;
      try {
        iEncodeToJson = new WrapEncodeToJson().createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.setContentType('text/plain; charset=us-ascii');
        rRouteResponse0.value = getJaguarInfo();
        Response<String> rRouteResponse1 = iEncodeToJson.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iEncodeToJson?.onException();
        rethrow;
      }
    }

//Handler for createJaguarInfo
    match =
        routes[1].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      DecodeJsonMap iDecodeJsonMap;
      try {
        iDecodeJsonMap = new WrapDecodeJsonMap().createInterceptor();
        Map<String, dynamic> rDecodeJsonMap = await iDecodeJsonMap.pre(
          request,
        );
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.setContentType('text/plain; charset=us-ascii');
        rRouteResponse0.value = createJaguarInfo(
          rDecodeJsonMap,
        );
        return rRouteResponse0;
      } catch (e) {
        await iDecodeJsonMap?.onException();
        rethrow;
      }
    }

    return null;
  }
}
