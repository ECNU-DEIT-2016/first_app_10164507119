import 'dart:async';
import 'dart:html';
import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'random_service.dart';
import 'dart:math';

@Component(
  selector: 'random',
  styleUrls: ['random_component.css'],
  templateUrl: 'random_component.html',
  directives: [
    MaterialButtonComponent,
    MaterialInputComponent,
    NgFor,
    NgIf，
    coreDirectives，
  ],
  
  providers: [const ClassProvider(RandomtService)],
)


class RandomComponent implements OnInit {
  final RandomComponent RandomService;
  
  List<String> items = [];
  String newRandom = ' ';
  var list=[0,0,0,0,0,0,0,0,0,0,0,0,0]; 

  var time=0;
  var namelist ={
    0:'小龙',
    1:'小吴',
    2:'小张',
    3:'小唐',
    4:'小7',
    5:'小菜',
    6:'小李',
    7:'小周',
    8:'小郑',
    9:'小陈',
    10:'小赵',
    11:'小朱',
  };
 
 RandomComponent(this.RandomService)

 @override
 Future<Null> ngOnlnit()async {
   items = =await RandomService.getRandom();

 }

 void mian(){
   querySelector('#inputNum").onInput.listen(updateBadge);

 }

 void updateBadge(Event e) {
   String inputNum = (e.target as InputElement).value;
 }

 void randomname(){
   Random random = new Random();
   var number = random.nextInt(13);
   
    var id=number+1;
    String snumber=id.toString();
    querySelector('#number').text='学号：'+snumber;
    querySelector('#name').text='名字：'+namelist[number];
    list[number]++;
    String times=list[number].toString();
    querySelector('#counter').text=namelist[number]+'同学已经被点名'+times+'次';
  }
}
