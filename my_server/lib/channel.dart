import 'my_server.dart';
import 'dart:math';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class MyServerChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen((rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router
      .route("/users/[:id]").link(()=>MyController());
    router
      .route("/random").link(()=>RandomController())
      ;

    return router;
  }
}

class RandomController extends ResourceController {
  //final List<String> things = ['thing1', 'thing2'];
   List<String> names = [];



  @Operation.get()
  Future<Response> getThings() async {
    //return Response.ok(names);
      await connect(names);
    int R=getRandom();
    return Response.ok(names[R]);
  }

  List<int> getRandom(int num, int maxlen){
    List<int> nums=[];
     Random random = new Random();
     for(int i=0; i<num; i++){
       int rand = random.nextInt(maxlen);
       if(nums.contains(rand)){
         i--;
       }else{
         nums.add(rand);
       }
     }   
      return nums;
  }

}

class MyController extends ResourceController {
  //final List<String> things = ['thing1', 'thing2'];
   List<String> names = [];

   MyController(){
    connect(names);
   }

  @Operation.get()
  Future<Response> getThings() async {
    return Response.ok(names);
  }

  @Operation.get('id')
  Future<Response> getThing(@Bind.path('id') int id) async {
    await connect(names);
    if (id < 0 || id >= 12) {

      return Response.notFound();
    }
    return Response.ok(names[id]);
  }


  Future connect(List<String> names) async{
  var s = ConnectionSettings(
    user: "root",
    password: "081724",
    host: "localhost",
    port: 3306,
    db: "example",
  );
  var conn = await MySqlConnection.connect(s);
  Results result =
      await conn.execute('SELECT id,name FROM student');
  result.forEach( (f) => names.add(f.toString()) );
}
}
