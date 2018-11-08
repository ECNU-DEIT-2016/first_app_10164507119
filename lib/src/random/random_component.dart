import 'dart:async';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'dart:html';
import 'random_service.dart';
import 'dart:math';

ButtonElement genButton;
ButtonElement replayBtn;

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
  providers: [const ClassProvider(RandomService)],
)


class RandomComponent implements OnInit {
  final RandomService randomService;
  
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
 
 RandomComponent(this.randomService)

 @override
 Future<Null> ngOnInit()async {
   items = await randomService.getRandom();

 }

 void mian(){
   querySelector('#inputNum').onInput.listen(updateBadge);
   genButton = querySelector('#generateButton');
   genButton.onClick.listen(generateBadge);
   replayBtn = querySelector('#generateButton');
   replayBtn.onClick.listen(generateBadge);
 }

void generateBadge(Event e) {
  setBadgeNum('1,2,3,4,5,6,7,8,9,10,11,12');
}

void setBadgeNum(String newName) {
querySelector('#badgeName').text = newName;
}

voidreplayBadge(Event e) {
  genButton.disabled = true;
  replayBtn.disabled = false;

  resetRandomname();
}

void resetRandomname(){
  querySelector('#number').text='学号：'+' ';
    querySelector('#name').text='名字：'+' ';

}


void updateBadge(Event e) {
   String inputNum = (e.target as InputElement).value;
   setBadgeNum(inputNum);
   if (inputNum.trim().isEmpty) {
    genButton..disabled = false
             ..text = '请输入要点名的人数！';
  } else {
    genButton..disabled = true
             ..text = '请输入要点名的人数！';
  }
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
