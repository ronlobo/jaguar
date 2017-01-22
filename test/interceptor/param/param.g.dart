// GENERATED CODE - DO NOT MODIFY BY HAND

part of test.interceptor.param;

// **************************************************************************
// Generator: ApiGenerator
// Target: class ExampleApi
// **************************************************************************

abstract class _$JaguarExampleApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Route(path: '/user', methods: const <String>['GET'])
  ];

  String getUser(String who);

  Future<Response> handleRequest(Request request, {String prefix: ''}) async {
    prefix += '/api';
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for getUser
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<String> rRouteResponse0 = new Response(null);
      WithParam iWithParam;
      try {
        iWithParam = new WrapWithParam(
          makeParams: const {#checker: const MakeParamFromType(CheckerImpl)},
          checker: new CheckerImpl(),
        )
            .createInterceptor();
        String rWithParam = iWithParam.pre();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.setContentType('text/plain; charset=us-ascii');
        rRouteResponse0.value = getUser(
          rWithParam,
        );
        return rRouteResponse0;
      } catch (e) {
        await iWithParam?.onException();
        rethrow;
      }
    }

    return null;
  }
}
