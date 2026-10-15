// ASHATIEL
I_C_T BDDAUSTO 5 C0OspreyDauston
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~这位就是黎明骑士多斯顿大人？他……嗯，他现在看起来脑子有点不太好使，你不觉得吗？~
END
INTERJECT BDDAUSTO 3 C0OspreyDauston2
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~我听过这个名字……星辰骑士团的安，晨光之主最负盛名的勇士之一。我在烛堡的史书里读到过他的事迹。还有……那位闪耀女士凯菈·阿金特，是他的族人。~
EXTERN BDDAUSTO 6
// IMOEN
I_C_T BDIMOEN 67 C0OspreyImoen
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~爱蒙！好久不见！~
== BDIMOEN ~谁……奥斯普蕾？真的是你吗？我还以为是毒素让我神志不清，把别人错认成你了！~
== C0CR2OSJ IF ~GlobalGT("C0OspreySoDTalk1","GLOBAL",1)~ THEN ~我从<CHARNAME>那里听说了你的遭遇。是圣战军的人干的，对不对？他们装出一副正义的样子，背地里却和刺客勾结，真是卑劣。~
== C0CR2OSJ IF ~!GlobalGT("C0OspreySoDTalk1","GLOBAL",1)~ THEN ~毒素？难怪你没和<CHARNAME>在一起……是圣战军的人干的，对不对？他们装出一副正义的样子，背地里却和刺客勾结，真是卑劣。~
== BDIMOEN ~我没事，奥斯普蕾……抱歉，我现在这副样子，见到熟人也没法表现得太开心。但我真的很高兴见到你。~
END
EXTEND_BOTTOM BDIMOEN 109
+ ~IsValidForPartyDialogue("C0CR2OS")~ + ~你没带奥斯普蕾一起来？我想她肯定会愿意跟来的。~ EXTERN BDIMOEN bdimoen.1
END
CHAIN BDIMOEN bdimoen.1
~我……没告诉她。出事之后她很难过，我觉得她回埃尔卡扎会更好。她能成为卡德利的学生，看起来特别开心，我实在不忍心叫她跟我们一起亡命天涯。~
= ~不过别担心。我临走前留了封信说明情况。至少她会知道你平安无事。~
EXTERN BDIMOEN 119
// JUNIA
INTERJECT BDJUNIA 16 C0OspreyJunia
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~等等，不对吧。你说的是晨光之主洛山达吧？你肯定是累坏了，都糊涂了。~
EXTERN BDDAUSTO 6
CHAIN IF WEIGHT #-1 ~Dead("BDYMORI")
AreaCheck("BD2000")
Global("KNOW_VELSHAROON","GLOBAL",0)
NearLocation(Myself,4089,408,10)~ THEN C0CR2OSJ VelsharoonTalk
~唔……情况不妙。<CHARNAME>，看到这些亡灵，情况比我预想的还要糟。~
DO ~SetGlobal("KNOW_VELSHAROON","GLOBAL",1)~
END
  ++ ~你什么意思？~ + VelsharoonTalk.1
  ++ ~对付亡灵对我来说不算什么。~ + VelsharoonTalk.2
CHAIN C0CR2OSJ VelsharoonTalk.1
~<CHARNAME>，你读过《异教诸信仰》吗？应该没有吧……修士们从来不让我们看。大概是觉得会教坏我们。~
= ~我——你见到泰瑟托尔的时候可别说出去，我……出于好奇翻看过一次，就一次。书里有一章提到了一位神祇——巫妖王维沙伦。他曾是一名红袍法师，执掌死灵领域，后来飞升成神。还有这些印记……我在那本书里见过。~
= ~如果我没猜错，不久之前一定有个牧师故意复活了这些亡灵。一个极其邪恶，而且恐怕实力很强的家伙。我们最好小心点。如果这是针对我们的陷阱，他们可能就在后面不远……或者就在前面等着。~
EXIT
CHAIN C0CR2OSJ VelsharoonTalk.2
~不，不是这个意思。是……~
EXTERN C0CR2OSJ VelsharoonTalk.1
INTERJECT BDJUNIA 33 C0OspreyJunia2
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~住口！洛山达绝不会纵容你说的这种卑劣行径。你才是死灵法师，以迪奈尔的指引之光之名，你要为你犯下的恶行付出代价！~
END
IF ~IsValidForPartyDialogue("Dynaheir")~ EXTERN BDDYNAHJ 95
IF ~!IsValidForPartyDialogue("Dynaheir")~ EXTERN BDJUNIA 34
// LITITA
EXTEND_BOTTOM BDLITILA 0
+ ~IsValidForPartyDialogue("C0CR2OS")~ + ~奥斯普蕾，你能和他们沟通吗？~ EXTERN C0CR2OSJ bdlitila
END
CHAIN C0CR2OSJ bdlitila
~我试试……逝去的灵魂啊，将意念集中于我的声音，我是迪奈尔的圣仆。~
== BDSOTUK ~我听到你的声音了……我看见你了。~
END
++ ~谢谢你，奥斯普蕾。灵魂，你现在能听懂我的话吗？告诉我你生前是谁。~ DO ~AddXPObject("C0Drake",500)~ EXTERN BDLITILA 1
++ ~总算说句人话了。差不多吧。你是谁？~ EXTERN BDLITILA 1
++ ~灵魂，你想从我们这里得到什么？~ EXTERN BDLITILA 1
// TAIELD
EXTEND_TOP BDTAIELD 1 #3
+ ~InParty("C0CR2OS")~ + ~奥斯普蕾，你好像有话要说。~ DO ~IncrementGlobal("BD_FIGHTERS_SKILL","BD3000",2) SetGlobal("bd_sdd301_taield_skill","global",2)~ EXTERN C0CR2OSJ OSPREY-TAIELD
END
CHAIN C0CR2OSJ OSPREY-TAIELD
~我不确定自己有没有资格给人提战斗士气方面的建议……唉，好吧。~
== C0CR2OSJ ~你和我一样是半精灵，所以我想我能体会那种感受。你肯定觉得格格不入，好像身边没人能理解你。~
== BDTAIELD ~我承认确实有些疏离感。当我和其他人如此不同的时候，很难融入队伍。~
== C0CR2OSJ ~我从小到大只认识人类父亲，甚至对家门外的世界一无所知。要是没有导师指引，我也会茫然无措。~
== C0CR2OSJ ~但就算你觉得和周围的人不一样，也总能找到共同点。值得学习的东西，或是你们都想守护的东西。一旦找到了那样东西，你就会慢慢忘记那些曾让你们隔阂的、转瞬即逝的差异。我相信你也有和他们一样在意的事，对吗？~
EXTERN BDTAIELD 6
// TAKOS
I_C_T BDTAKOS 4 C0OspreyTakos
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~是圣战军干的？哼，真是放肆……嘴上说行正义之事，所过之处却只剩一片焦土。要是让我找到干这事的人，定要让他们尝尝我战锤的滋味！~
END
// TRISTIAN
EXTEND_BOTTOM BDTRISTI 14
+ ~InParty("C0CR2OS")~ + ~奥斯普蕾。~ DO ~SetGlobal("bd_tristian_vs_npc","locals",1)~ EXTERN C0CR2OSJ OSPREY-TRISTIAN
END
CHAIN C0CR2OSJ OSPREY-TRISTIAN
~呵呵，包在我身上。以前我跟卡兰、泰瑟托尔、卡德利大师都玩过这类游戏……肯定很快就能上手。~
EXTERN BDTRISTI 15
// Thrix the Profane
EXTEND_BOTTOM BDTHRIX 21 26 30 34 38 42 46 50 54 58 62 66 70 74 78 82 86 90
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END
EXTEND_BOTTOM BDTHRIX 22 27 31 35 39 43 47 51 55 59 63 67 71 75 79 83 87 91 #1
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END
EXTEND_BOTTOM BDTHRIX 23 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 #10
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END
EXTEND_BOTTOM BDTHRIX 24 29 33 37 41 45 49 53 57 61 65 69 73 77 81 85 89 93 #5
IF ~Global("C02_Saved_Osprey","bd4500",0)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager1
END
CHAIN BDTHRIX ThrixWager1
~嗯……迪奈尔的女祭司，或许值得赌一把。我的手下只懂战具与刑具，其他工具一概不通。或许一个受过训练的抄写员正是我需要的。~
END
++ ~行。出你的谜题，要是我输了，奥斯普蕾随你处置。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",1) SetGlobal("bd_thrix_sacrifice_companion","global",1)~ EXTERN BDTHRIX 116
++ ~奥斯普蕾是我极为重要的朋友，我不会拿她冒险。~ DO ~SetGlobal("C02_Saved_Osprey","bd4500",1) IncrementGlobal("BD_NumInParty","bd4500",1)~ EXTERN C0CR2OSJ ThrixWager2
++ ~魔鬼，拿奥斯普蕾的灵魂当你的游戏赌注，我还算什么朋友。要赌可以，赌我的灵魂，别扯上别人。~ EXTERN BDTHRIX 113
++ ~魔鬼，你威胁我的朋友，这是大错特错。不想死就让开。~ EXTERN BDTHRIX 12
CHAIN C0CR2OSJ ThrixWager2
~谢谢你，<CHARNAME>，但真要赌的话，我宁愿赌我自己，也不愿连累别人。不过更明智的选择是根本不玩这场荒唐的游戏。~
== BDTHRIX ~哼。不过这股冲天的伪善味儿想必很快就会让人厌烦。也罢，我换一个人。~
END
IF ~RandomNum(4,1)~ EXTERN BDTHRIX 78
IF ~RandomNum(4,2)~ EXTERN BDTHRIX 79
IF ~RandomNum(4,3)~ EXTERN BDTHRIX 80
IF ~RandomNum(4,4)~ EXTERN BDTHRIX 81
EXTEND_BOTTOM BDTHRIX 118
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END
EXTEND_BOTTOM BDTHRIX 119
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END
EXTEND_BOTTOM BDTHRIX 120
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END
EXTEND_BOTTOM BDTHRIX 121
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END
EXTEND_BOTTOM BDTHRIX 122
IF ~Global("C02OspreySacrifice","bd4500",1)
IsValidForPartyDialogue("C0CR2OS")~ EXTERN BDTHRIX ThrixWager4
END
CHAIN BDTHRIX ThrixWager4
~好了，迪奈尔的信徒……很快你就能脱下这身袍子，换上更适合魔鬼仆从的装束了。~
END
++ ~对不起，奥斯普蕾。我犯了个错。~ DO ~SetGlobal("C02_thrix_mark_osprey","global",1)~ EXTERN C0CR2OSJ ThrixWager5
++ ~我不这么觉得。离她远点，斯瑞克斯。~ EXTERN BDTHRIX 10
CHAIN C0CR2OSJ ThrixWager5
~我的主迪奈尔不会轻易放弃我的，劣魔……我坚信如此。~
DO ~SetGlobal("bd_thrix_plot","global",11)~ EXTERN BDTHRIX 140
CHAIN IF WEIGHT #-1 ~Global("C02OspreySacrifice","bd4500",1)~ THEN C0CR2OSJ ThrixTalk0
~<CHARNAME>……我该说什么？我又能说什么？~
END
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~我当时真是昏了头，奥斯普蕾。请原谅我。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk1
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~我当时真是昏了头，奥斯普蕾。请原谅我。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~奥斯普蕾，为了终结这场威胁，我必须抓住任何获得力量的机会。你这样的人应该能理解。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk2
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~奥斯普蕾，为了终结这场威胁，我必须抓住任何获得力量的机会。你这样的人应该能理解。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3
+ ~!Global("C02_thrix_mark_osprey","global",1)~ + ~你不懂就闭嘴。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk4
+ ~Global("C02_thrix_mark_osprey","global",1)~ + ~你不懂就闭嘴。~ DO ~SetGlobal("C02OspreySacrifice","bd4500",2)~ + ThrixTalk3
CHAIN C0CR2OSJ ThrixTalk1
~*叹气*换作别人的话……但我没法生你的气，<CHARNAME>。再说……我们还有更重要的事要操心。就当这事没发生过，好吗？~
EXIT
CHAIN C0CR2OSJ ThrixTalk2
~至少你还能解开魔鬼的谜题，我该庆幸才对。不然……算了，既然最坏的情况没发生，我还是不去想自己会落得什么下场了。~
EXIT
CHAIN C0CR2OSJ ThrixTalk3
~我怕的不是魔鬼，<CHARNAME>。我相信迪奈尔主会保佑我……但你，我却越来越看不透了。你变了太多……变得太多了。~
= ~我会尽量忘掉这件事……但恐怕没那么容易。~
EXIT
CHAIN C0CR2OSJ ThrixTalk4
~……~
= ~随你便。~
EXIT
// TIAX
I_C_T BDTIAX 38 C0OspreyTiax
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~希瑞克的信徒，对吧？还能指望什么呢。~
END
// TSOLAK
I_C_T BDTSOLAK 5 C0OspreyTsolak
== C0CR2OSJ IF ~InParty("C0CR2OS")~ THEN ~*低语* <CHARNAME>，亡灵会抹掉一个人生前所有的善意。它的话一个字都不能信。~
END
// VIDYAD
EXTEND_BOTTOM BDVIDYAD 9
+ ~InParty("C0CR2OS")~ + ~奥斯普蕾，你有头绪吗？~ EXTERN C0CR2OSJ OSPREY-VIDYAD
END
CHAIN C0CR2OSJ OSPREY-VIDYAD
~哦，我好像听过类似的……肯定是蜜蜂，对吧？~
EXTERN BDVIDYAD 10
// WYNAN
EXTEND_BOTTOM BDWYNAN 14
+ ~InParty("C0CR2OS")~ + ~奥斯普蕾，你能解决吗？~ EXTERN C0CR2OSJ OSPREY-WYNAN
END
CHAIN C0CR2OSJ OSPREY-WYNAN
~当然。借迪奈尔的祝福，我们定能摆脱这邪祟。~
DO ~SetGlobal("BD_SDD200","GLOBAL",3)
SetGlobal("BD2100GL","GLOBAL",3)
SetGlobal("C0_sdd200_osprey","bd2100",1)
StartCutSceneMode()
ClearAllActions()
StartCutSceneEx("C02OSCV1",FALSE)~ EXIT
// TALK 1
CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk1","GLOBAL",1)~ THEN C0CR2OSJ T1
~对了，<CHARNAME>，我一直想问你……爱蒙没和你在一起吗？我还以为肯定能在你身边见到她。~
DO ~SetGlobal("C0OspreySoDTalk1","GLOBAL",2)~
END
  ++ ~她被刺客袭击了。现在在宫殿里接受治疗。~ + T1-1
  ++ ~闪耀女士的爪牙伤了她。不过她还活着。~ + T1-1
CHAIN C0CR2OSJ T1-1
~爱蒙遇袭了？是……圣战军干的？我从炎骑士团那边听说有传言说他们混进了城，但万万没想到他们居然敢闯公爵宫对你们下手。~
= ~你平安无事真是谢天谢地！我……爱蒙肯定也会没事的。大公爵们身边的治疗师都是最好的。~
= ~但我还是不敢相信。这场圣战……就像我听说的那样，光鲜的旗帜下果然藏着更黑暗的东西。~
END
  ++ ~你具体都听说了什么？~ + T1-2
  ++ ~谁都能竖起旗帜，声称自己是为正义而战。但街头的百姓说的却是另一回事。~ + T1-3
  ++ ~这事以后再说吧。不管是光明还是黑暗，我们很快就要亲自面对这场圣战了。~ + T1-4
CHAIN C0CR2OSJ T1-2
~我离开翔灵修道院之前，尽量查了闪耀女士凯菈·阿金特的相关记载。她是星辰骑士团的战士……出身于洛山达圣武士世家，是这一脉的最后一人，但她从未正式受封骑士，史书中也没记载原因。~
= ~尽管如此，史书记载她的功绩丝毫不逊于任何圣武士。据说这场圣战的发起者，都是曾被她救下的人，他们自愿追随她的事业，保护和拯救更多像他们一样的人。~
= ~所以……我实在不敢相信，追随如此正直之人的部下，竟会在剑湾烧杀抢掠。我一直想不通这是为什么，是有人假借她的名义为非作歹，还是……历史记载本就不全是真的。~
= ~我想很快我们就能亲眼见证了，对吧？如果你想了解更多圣战的消息，随时可以问我，说不定能帮上忙。~
END
  ++ ~谢谢你，奥斯普蕾。有你这样的学者同行，真是帮大忙了。~ + T1-5
  ++ ~我就知道你脑子里总能掏出些有用的知识。~ + T1-5
CHAIN C0CR2OSJ T1-3
~没错。我在了解圣战和其领袖的过程中，也有过不少疑虑……~
EXTERN C0CR2OSJ T1-2
CHAIN C0CR2OSJ T1-4
~你说得对。真相要靠自己去寻找。远征很快就要开始了，我得耐心点，仔细甄别得到的每一点信息。就像以前导师们教导我们的那样。~
EXIT
CHAIN C0CR2OSJ T1-5
~哼。等我回去了，可不能让莫丹笑话我荒废学业，对吧？~
EXIT
// TALK 2
CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk2","GLOBAL",2)~ THEN C0CR2OSJ T2
~<CHARNAME>，既然我们已经离开营地了……你觉得现在聊聊合适吗？~
DO ~SetGlobal("C0OspreySoDTalk2","GLOBAL",3)~
END
  ++ ~是说我们出城时发生的那件事吗？~ + T2-1
  ++ ~尽管说吧，你想说什么。~ + T2-1
  ++ ~行，但长话短说。~ + T2-1
CHAIN C0CR2OSJ T2-1
~我……我本来不想提的，我想等你准备好了自然会告诉我。但那天那个人当着那么多人的面质问你，我才觉得再等下去也没什么意义了。~
= ~<CHARNAME>，你要知道，我回到剑湾的时候，没来得及回烛堡，但和几位旧识通了信。泰瑟托尔、温思罗普、阿坎尼斯……他们告诉了我发生的事。还有……你回来之后得知的真相。~
END
  ++ ~原来你早就知道我是巴尔之子了？~ + T2-2
  ++ ~那就好。我还在发愁该怎么跟你说呢。~ + T2-3
  ++ ~你介意吗？甚至……害怕吗？~ + T2-4
  ++ ~既然你已经知道了，那就没什么好说的。听我的命令，一切都会没事的。~ + T2-6
CHAIN C0CR2OSJ T2-2
~是的，是泰瑟托尔告诉我的。我……惊讶的不是这件事本身，而是他居然觉得我该知道。~
EXTERN C0CR2OSJ T2-5
CHAIN C0CR2OSJ T2-3
~我想泰瑟托尔大概也觉得你可能不会亲口告诉我。所以他第一封信就跟我说了。而且他好像早就料到我会回来……我刚到博德之门，就有信使在等我。~
EXTERN C0CR2OSJ T2-5
CHAIN C0CR2OSJ T2-4
~不……当然不害怕。<CHARNAME>，我们认识这么多年了，就算不认识……我也敬重葛立安，相信他当年把你带回烛堡是正确的决定。~
EXTERN C0CR2OSJ T2-5
CHAIN C0CR2OSJ T2-5
~现在想来，卡德利大师恐怕早就知道了，也料到我会去找你。~
= ~我当时还奇怪，我才拜师没多久就提出离开翔灵修道院，他居然那么爽快就同意了。但如果他是想让我得知真相后来帮你，那就说得通了。而且……~
EXTERN C0CR2OSJ T2-6
CHAIN C0CR2OSJ T2-6
~<CHARNAME>，我当然会支持你。我不会轻易放弃朋友，而且……我也得尊重葛立安的遗愿。我是泰瑟托尔和我父亲养大的，但葛立安也是我最敬重的导师之一。他也一定希望我能尽我所能帮你。~
= ~再说……爱蒙现在不在你身边，总得有人补上她的位置。我的手可能没她灵巧，动作也慢，更没有她跟着你历练出来的那些经验，但我也学了不少东西，足以帮上你的忙。~
END
  ++ ~别担心。能有个熟人在身边，就已经很好了。~ + T2-7
  ++ ~就是走路的时候看着点。这地方可比烛堡那些积灰的书架危险多了，撞倒了可不是闹着玩的。~ + T2-8
  ++ ~你最好别拖后腿。不管是不是老朋友，要是你成了累赘，我照样会丢下你。~ + T2-9
CHAIN C0CR2OSJ T2-7
~嗯，就算别的不行，当个熟人还是没问题的。而且自从卡德利收我为徒，我的法术也精进了不少，到时候你就知道了。~
EXTERN C0CR2OSJ T2-10
CHAIN C0CR2OSJ T2-8
~呵呵，我尽量少闯祸。但我可不敢保证一次都不犯。不然的话，你都要认不出我了。~
EXTERN C0CR2OSJ T2-10
CHAIN C0CR2OSJ T2-9
~明白。不管怎样，我都不会要求特殊对待。不然的话，我都没脸见我老家的父亲了，对吧？~
EXTERN C0CR2OSJ T2-10
CHAIN C0CR2OSJ T2-10
~所以别担心，我的朋友。就算别人不理解你的为人，我也会在你身边，做你可以信赖的人。别把我当外人。我还是奥斯普蕾，那个笨手笨脚的小抄写员，走路都会绊倒，把书从书架上撞下来，就和你记得的一样……呵呵。~
EXIT
// TALK 3
CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk3","GLOBAL",2)~ THEN C0CR2OSJ T3
~<CHARNAME>，你感觉怎么样？~
DO ~SetGlobal("C0OspreySoDTalk3","GLOBAL",3)~
END
  ++ ~我没事。~ + T3-1
  ++ ~你就想问这个？刚才发生的事你一点都不好奇？~ + T3-2
  ++ ~糟透了。脑子里满是疑问。还有点疼。~ + T3-3
  ++ ~别烦我。~ + T3-0
CHAIN C0CR2OSJ T3-0
~抱歉。但你要是想说话，我随时都在。~
EXIT
CHAIN C0CR2OSJ T3-1
~说实话，我不太信……但我就当你没事吧。~
EXTERN C0CR2OSJ T3-2
CHAIN C0CR2OSJ T3-2
~那个印记突然出现，我当然又困惑又好奇，但最让我担心的还是你当场倒了下去。~
= ~和你同行这段时间，我总还把你当成当年那个和我、爱蒙一起玩耍读书的朋友，差点忘了你早已不止于此。~
= ~你一定很累吧。你已经背负了整座城市的希望，不该再承担他们的恐惧。我……~
END
  ++ ~你在担心我？~ + T3-4
  ++ ~你怕我？~ + T3-4
  ++ ~我现在不想谈这个。~ + T3-0
CHAIN C0CR2OSJ T3-3
~我能想象。就连我看到刚才那一幕都很震惊。~ 
EXTERN C0CR2OSJ T3-2
CHAIN C0CR2OSJ T3-4
~我是担心你，<CHARNAME>。我知道你或许已经变了很多，有些变化我甚至还不了解，但我希望你永远记得，还有人真心希望你好。希望你不仅能活下去，还能活得开心。~
= ~我也希望如此。泰瑟托尔肯定也是这么想的，温思罗普也是。还有所有老朋友，就连莫丹也是。还有葛立安……如果他在天有灵，肯定也希望你这样。~
END
  ++ ~别担心我的感受。只要身边的人信任我，就够了。~ + T3-5
  ++ ~谢谢你，奥斯普蕾。~ + T3-5
  ++ ~我还没脆弱到需要你来安慰。~ + T3-6
CHAIN C0CR2OSJ T3-5
~这就对了。打起精神来，记住我一直都在。谁敢找我朋友的麻烦，我就一锤子砸在他头上！~
EXIT
CHAIN C0CR2OSJ T3-6
~<CHARNAME>，在朋友面前敞开心扉从来不是软弱的表现。不过我明白，你大概只是需要时间消化。这事我就先不提了。~
EXIT
// TALK 4
CHAIN IF WEIGHT #-1 ~Global("C0OspreySoDTalk4","GLOBAL",2)~ THEN C0CR2OSJ T4
~<CHARNAME>，你看这个。是不是很眼熟？甚至有点怀念？~
DO ~SetGlobal("C0OspreySoDTalk4","GLOBAL",3)~
END
  ++ ~伊尔明斯特的《月下弦歌》？真是勾起回忆了。~ + T4-1
  ++ ~这本书我好久没读过了。~ + T4-1
  ++ ~我没印象。~ + T4-2
  ++ ~别在我眼前晃。走开。~ + T4-0
CHAIN C0CR2OSJ T4-0
~好吧。~
EXIT
CHAIN C0CR2OSJ T4-1
~是伊尔明斯特的《处世之道》。我记得这是我们第一本一起读的书——你、我、莫丹。还有爱蒙，不过我们都知道她肯定偷偷溜出去玩了。但说也奇怪，她后来居然对这本书倒背如流……~
= ~不知道你怎么想，我那时候觉得这本书无聊透顶。大概以我们当时的年纪，还理解不了其中的道理……但最近我又重读了一遍，才深深体会到书中的教诲。~
= ~这本书讲的是善与恶的本质，以及它们如同自然法则一般存在于我们的世界。我想导师们是想以此引导我们走正路，但我那时候只想着别睡着。~
END
  ++ ~那时候真好啊。~ + T4-3
  ++ ~我也是。真希望那时候能多读些史诗冒险的故事。~ + T4-4
  ++ ~看看你现在。以前的你肯定想不到自己会有今天。~ + T4-5
CHAIN C0CR2OSJ T4-2
~哎呀，你真的不记得了？泰瑟托尔知道了可要伤心的。~
EXTERN C0CR2OSJ T4-1
CHAIN C0CR2OSJ T4-3
~是啊，不是吗？~
EXTERN C0CR2OSJ T4-6
CHAIN C0CR2OSJ T4-4
~我想你现在肯定不稀罕那些故事了吧？你自己就在经历一场史诗冒险。~
EXTERN C0CR2OSJ T4-6
CHAIN C0CR2OSJ T4-5
~倒也不能这么说……我更庆幸所学的一切造就了今天的我。这让我觉得自己真正成长了。~
EXTERN C0CR2OSJ T4-6
CHAIN C0CR2OSJ T4-6
~那是一切改变之前的事了。不过早在你离开之前，就已经开始变了，对吧？后来泰瑟托尔专心收我为徒，你的学业就全交给葛立安了……~
= ~现在想来，大概都是为了让你为如今的命运做准备，而我本来就不用离开烛堡。~
END
  ++ ~你不会羡慕吧？~ + T4-7
  ++ ~不过你现在也在这里，人生总还是充满惊喜的。~ + T4-8
  ++ ~你更愿意留在烛堡，像你父亲一样当个抄写员吗？~ + T4-9
CHAIN C0CR2OSJ T4-7
~哦，我表现得有那么明显吗？我不是那个意思。其实我想的正好相反。~
EXTERN C0CR2OSJ T4-9
CHAIN C0CR2OSJ T4-8
~我出来也是一时兴起。家园受此威胁，我总不能袖手旁观。~
EXTERN C0CR2OSJ T4-9
CHAIN C0CR2OSJ T4-9
~说实话，要不是剑湾需要帮助，尤其是你需要帮助，我本乐意继承父亲的衣钵，在烛堡或是翔灵修道院度过余生。~
= ~要说我们那群老朋友里谁最不可能离开，我大概是排最后的。你、爱蒙、莫丹、德德……甚至坎德勒斯和阿坎尼斯都比我有可能。~
= ~但偏偏，我还是来了。他们要是知道我现在在做什么，肯定会大吃一惊……尤其是莫丹，非气死不可。~
END
  ++ ~她总说等准备好了，就离开去找她父亲。~ + T4-10
  ++ ~以你们现在的处境，怕是没法再像以前那样较劲了吧。~ + T4-11
  ++ ~这事以后再说吧。~ + T4-15
CHAIN C0CR2OSJ T4-10
~她从来没说过为什么会被留在图书馆和我们一起，我怀疑连她自己都不知道全部缘由……但我总觉得，她父亲不管在哪里，一定是卷入了什么大事，不想让她牵扯进来……但她呢，只想尽自己所能帮他。~
EXTERN C0CR2OSJ T4-12
CHAIN C0CR2OSJ T4-11
~嗨，那都是她自己瞎较劲。我总说，我更希望和她做朋友，而不是对手。我知道她也是这么想的……就是嘴硬不说。~
EXTERN C0CR2OSJ T4-12
CHAIN C0CR2OSJ T4-12
~我和莫丹的交情，就像你和爱蒙一样。虽然她有时候很难相处，还爱抬杠……~
= ~我们都追求知识，但目的不同。莫丹追求知识是为了自己，而我的目标是记录知识，留给后人用。她想提升自己，我也乐意帮她。~
= ~当然，不管我说多少次，她还是一口咬定我们是对手。说完还会扯我头发。~
END
  ++ ~等剑湾的事平定了，你该回烛堡看看她。~ + T4-13
  ++ ~等她准备好离开的时候，你会陪她一起吗？~ + T4-14
  ++ ~先聊到这儿吧。我喜欢聊朋友们的事，但我们还有正事要办。~ + T4-15
CHAIN C0CR2OSJ T4-13
~那是自然。等她什么时候准备好，来这广阔天地找我们……~
EXTERN C0CR2OSJ T4-16
CHAIN C0CR2OSJ T4-14
~我一定会陪在她身边。就像爱蒙一直陪着你一样。说不定有一天，我们四个还能一起去冒险，你觉得呢？~
EXTERN C0CR2OSJ T4-16
CHAIN C0CR2OSJ T4-15
~嗯……说定了。~
EXTERN C0CR2OSJ T4-16
CHAIN C0CR2OSJ T4-16
~不管怎么说，今天怀旧够久了，对吧？我喜欢聊过去，但更希望能亲自重历往昔，而这要等和平到来才行。~
= ~走吧，<CHARNAME>。我准备好了，听你吩咐。~
END
 ++ ~奥斯普蕾。~ + T4-17
 ++ ~那我们走。~ EXIT
CHAIN C0CR2OSJ T4-17
~怎么了？~
END
 ++ ~你的束腰外衣又穿反了。~ + T4-18
 ++ ~没什么。~ EXIT
CHAIN C0CR2OSJ T4-18
~真的？啊！真的穿反了！你们怎么不告诉我？~
= ~我现在装备穿太多，没法换……但我把盔甲穿上的话……就没人看得出来了，对吧？~
END
  ++ ~看来有些东西是永远不会变了。~ + T4-19
  ++ ~我估计好多人都看见了。~ + T4-19
  ++ ~你耽误够久了。我们走。~ EXIT
CHAIN C0CR2OSJ T4-19
~哎呀，别笑我了！但看来我就是这样，再怎么改也改不了。~
EXIT
