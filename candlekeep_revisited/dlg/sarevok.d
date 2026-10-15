EXTEND_BOTTOM CUTSAR 1
IF ~True()~ THEN EXTERN CUTGOR C0CandleReSarevScene
END
CHAIN CUTGOR C0CandleReSarevScene
~快跑，孩子。离开这里！~ [GORIN02]
DO ~SetGlobal("C0CandleReSarevokScene","GLOBAL",1)~ END
  ++ ~什么？可是——~ EXTERN CUTGOR C0CandleReSarevScene.1
  ++ ~不，我们可以——~ EXTERN CUTGOR C0CandleReSarevScene.1
  ++ ~（快跑。逃命吧。）~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C0CR#C02")~ EXIT
CHAIN CUTGOR C0CandleReSarevScene.1
~别说话。只管跑。我很快就来找你。你不该看到接下来发生的事。~
END
  ++ ~你是什么意思……？~ + C0CandleReSarevScene.2
  ++ ~不，父亲。让我帮你！~ + C0CandleReSarevScene.2
  ++ ~我不能丢下你！~ + C0CandleReSarevScene.2
  ++ ~（听你父亲的话，快跑。）~ DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C0CR#C02")~ EXIT
CHAIN CUTGOR C0CandleReSarevScene.2
~<CHARNAME>，我的孩子……~
 = ~对不起。~
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C0CR#C01")~ EXIT
CHAIN IF WEIGHT #-1 ~Global("C0CandleReSarevokScene","GLOBAL",1)~ THEN CUTSAR C0CandleReSarevScene.1
~都到最后一刻了，你还要骗<PRO_HIMHER>。你很清楚结局会如何。~ [C0BLANK]
DO ~SetGlobal("C0CandleReSarevokScene","GLOBAL",2)~ 
== CUTGOR ~或许吧。但我倒是想知道……这就是你所谓的复仇吗，小子？~
== CUTSAR ~过去早已无关紧要。看着你和你被监护人落到这般田地，我反倒庆幸自己没被这种软弱诅咒。~
== CUTGOR ~你是我过去失败的产物。你再怎么装腔作势，我也不怕你，只觉得可悲。~
== CUTSAR ~可你最擅长的不就是失败吗，老头？你救不了那个女人，也救不了其他人……等你死了，你连那个小崽子也救不了。~
== CUTGOR ~你说得对，我失败过太多次……但这最后一次，你错了。我已经救了那孩子，没让他沦为力量的奴隶，不像你。没错，<PRO_HISHER>的路会很艰难……但<PRO_HISHER>还有希望。不像你。~
== CUTSAR ~是吗？那我该留你一口气，让你亲眼看着那一天，我彻底将你的希望踩在脚下……~
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C0CR#C03")~ EXIT
CHAIN IF WEIGHT #-1 ~Global("C0CandleReSarevokScene","GLOBAL",2)~ THEN CUTSAR C0CandleReSarevScene.2
~呵……原来你骨子里还剩点当年的血性。这可比我预想的有意思多了。~ [C0BLANK]
DO ~SetGlobal("C0CandleReSarevokScene","GLOBAL",3)~ 
== TAMOKO ~萨——~
== CUTSAR ~我知道。时间宝贵，我们的计划才刚开始。速战速决。~
== CUTGOR ~随你便，但你赢不了。那孩子很强……总有一天，<PRO_HISHER>会达到你永远企及不了的高度。~
== CUTSAR ~是吗？好，我接受挑战。我很期待接下来的好戏……可惜你活不到见证的那天了。~
== CUTGOR ~够了，别冷嘲热讽了。我们之间的账拖得太久了……也该做个了断了。~
DO ~ClearAllActions() StartCutSceneMode() StartCutScene("C0CR#C04")~ EXIT
