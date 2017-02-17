// GENERATED CODE - DO NOT MODIFY BY HAND

part of example.body.json;

// **************************************************************************
// Generator: ApiGenerator
// Target: class BooksApi
// **************************************************************************

class JaguarBooksApi implements RequestHandler {
  static const List<RouteBase> routes = const <RouteBase>[
    const Post(),
    const Get(path: '/:id'),
    const Delete(path: '/:id'),
    const Put(path: '/:id')
  ];

  final BooksApi _internal;

  factory JaguarBooksApi() {
    final instance = new BooksApi();
    return new JaguarBooksApi.from(instance);
  }
  JaguarBooksApi.from(this._internal);

  Future<Response> handleRequest(Request request, {String prefix: ''}) async {
    prefix += '/api/book';
    PathParams pathParams = new PathParams();
    bool match = false;

//Handler for addBook
    match =
        routes[0].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      ContextImpl ctx = new ContextImpl(request, pathParams);
      EncodeToJson iEncodeToJson0;
      DecodeJsonMap iDecodeJsonMap0;
      try {
        iEncodeToJson0 = _internal.jsonEncoder.createInterceptor();
        iDecodeJsonMap0 = _internal.jsonDecoder.createInterceptor();
        Map<String, dynamic> rDecodeJsonMap0 = await iDecodeJsonMap0.pre(
          request,
        );
        ctx.addOutput(_internal.jsonDecoder, iDecodeJsonMap0, rDecodeJsonMap0);
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.headers
            .set('content-type', 'text/plain; charset=utf-8');
        rRouteResponse0.value = _internal.addBook(
          ctx.getInput(DecodeJsonMap),
        );
        Response<String> rRouteResponse1 = iEncodeToJson0.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iDecodeJsonMap0?.onException();
        await iEncodeToJson0?.onException();
        rethrow;
      }
    }

//Handler for getById
    match =
        routes[1].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      ContextImpl ctx = new ContextImpl(request, pathParams);
      EncodeToJson iEncodeToJson0;
      try {
        iEncodeToJson0 = _internal.jsonEncoder.createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.headers
            .set('content-type', 'text/plain; charset=utf-8');
        rRouteResponse0.value = _internal.getById(
          (pathParams.getField('id')),
        );
        Response<String> rRouteResponse1 = iEncodeToJson0.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iEncodeToJson0?.onException();
        rethrow;
      }
    }

//Handler for removeBook
    match =
        routes[2].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      ContextImpl ctx = new ContextImpl(request, pathParams);
      EncodeToJson iEncodeToJson0;
      try {
        iEncodeToJson0 = _internal.jsonEncoder.createInterceptor();
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.headers
            .set('content-type', 'text/plain; charset=utf-8');
        rRouteResponse0.value = _internal.removeBook(
          (pathParams.getField('id')),
        );
        Response<String> rRouteResponse1 = iEncodeToJson0.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iEncodeToJson0?.onException();
        rethrow;
      }
    }

//Handler for updateBook
    match =
        routes[3].match(request.uri.path, request.method, prefix, pathParams);
    if (match) {
      Response<Map> rRouteResponse0 = new Response(null);
      ContextImpl ctx = new ContextImpl(request, pathParams);
      EncodeToJson iEncodeToJson0;
      DecodeJsonMap iDecodeJsonMap0;
      try {
        iEncodeToJson0 = _internal.jsonEncoder.createInterceptor();
        iDecodeJsonMap0 = _internal.jsonDecoder.createInterceptor();
        Map<String, dynamic> rDecodeJsonMap0 = await iDecodeJsonMap0.pre(
          request,
        );
        ctx.addOutput(_internal.jsonDecoder, iDecodeJsonMap0, rDecodeJsonMap0);
        rRouteResponse0.statusCode = 200;
        rRouteResponse0.headers
            .set('content-type', 'text/plain; charset=utf-8');
        rRouteResponse0.value = _internal.updateBook(
          ctx.getInput(DecodeJsonMap),
          (pathParams.getField('id')),
        );
        Response<String> rRouteResponse1 = iEncodeToJson0.post(
          rRouteResponse0,
        );
        return rRouteResponse1;
      } catch (e) {
        await iDecodeJsonMap0?.onException();
        await iEncodeToJson0?.onException();
        rethrow;
      }
    }

    return null;
  }
}
