;http://www.autohotkey.com/board/topic/25446-consolesend/
;http://www.autohotkey.com/board/topic/96895-libcon-autohotkey-library-for-console-support/
;http://v1.autohotkey.co.kr/
Gui,color,0x112233
Gui, Font, cWhite S11 w580      
Gui, Add, GroupBox, x12 y10 w280 h250 , ��� ���
Gui, Add, Text, x22 y40 w250 h30 , F1: �̱� ������
Gui, Add, Text, x22 y90 w250 h30 , F2: ������ ������ ����
Gui, Add, Text, x22 y140 w250 h30 , F3: ���â ���� ** ��ũ�� ����������**
Gui, Font, cRed S11 w700
Gui, Add, Text, x22 y190 w250 h30 , **��ũ�� ����� F6�Դϴ�**

Gui, Add, Picture, x12 y280 w280 h190 , %A_ScriptDir%\�̹���\\Ǳ.jpg

; Generated using SmartGUI Creator 4.0
;Gui, Show, x127 y87 h482 w309, New GUI Windowd
;===================================GUI====================================


;===========================������ ������===========================
#SingleInstance force
#include system.ahk
#include dungeon_api.ahk
#include inventory.ahk

;SetCapsLockState, off
;SetScrollLockState, off

;#NoTrayIcon ;Suggested
SetBatchLines,-1 ;suggested
;SetBatchLines,20 ;suggested
;==============================================================


;=====AreaCode=====
;1:�ڸ�, 2:���� 3:ǻ�� 4:������ƾ 5:����ũ���
;�񷽾��, ��������, �߶����ǻ縷, ����������, �񷽾��

;=====Dungeon=====
;�ش� �������� ���� �������� 1������ �����մϴ�. ���� ���̵� ��� ���� ���ǻ�
;���� 4�� ������ ���� �������� ���ʿ��� 5��° ������ ���� ��ä �Դϴ�.

;[Area]
global AreaCode=5
global R_AreaCode=4

;[Dungeon]
global DungeonNum=2

;[Raid]
global RaidNum=1

;[ETC]
global isBuyShoes=1
global isDebug=1
global BuyOption=1
global isInfinity=1

global FullX=0
global FullY=0
global HalfX=0
global HalfY=0

global DungeonFile=""
global RaidFile=""

global isRaidFinished=0  ;//���̵� ���� üũ 1�� ������ �����ϸ� �ȵǴ� ��Ȳ 0�� ���� ������ ��Ȳ

;global FullX, FullY, HalfX, HalfY:=0


;; ���� ������ ������ ����





ResizeWin()
OnInit()

error("���� ���� ", "��â�� ���� ���ּ���")


error("�����ε� �̹����̸�")
error(DungeonFile)

error("���̵�ε� �̹����̸�")
error(RaidFile)


F1::
ResizeWin(0,0)
;�̱��Լ�()
goto �̱�
return

F2::
;SetGenySize()
;����Ǹ�("���_������.bmp")
goto �����������üũ
return

F3::
����â����()
;Ƽ��Ȯ��(12)
;���̵��Լ�()
;���̵�ʼ���()

return

F4::
;ResizeWin(0,0)
;error("F4 Test")


error("������ ������ ���ϴ�")
;goto �����Լ�
�����Լ�() ;//�̸� �� �ٲ���ҵ� 
;goto ģ������

return

F5::
ResizeWin(0,0)

error("�Ź� ���� �׽�Ʈ")
;RaidNum=1  
;AreaCode=4
;DungeonNum=5
;DungeonFile="4_5.bmp"
;goto �����Լ�
;������������()
;goto �Źߺ���
;��ưŬ��("������_������.bmp")
;��ưŬ��("�̺�Ʈ������_Ȯ��.bmp")
;��ưŬ��("������������_Ȯ��.bmp")
;��ưŬ��("����ȹ��_Ȯ�ι�ư.bmp")
;��ưŬ��("�����Ǹ�â_Ȯ��.bmp")
;��ưŬ��("�Źߺ���_Ȯ��.bmp");
;��ưŬ��("�Ź߱���_Ȯ��.bmp");
;��ưŬ��("����_���躸��_Ȯ��.bmp")
;��ưŬ��("ģ������_��ư.bmp")
;��ưŬ��("ģ������_�����ϱ�.bmp")
;Ƽ��Ȯ��(tempval)
;msgbox Ƽ��Ȯ�� �����ݽ� %tempval%



return


F6::
reload
ResizeWin(0,0)

return

error("�̱� ���� ��ũ�� �����մϴ�")
msgbox "�ڵ� ��� ��ũ�� ���� �մϴ�"
return



F7::
ResizeWin(0,0)

error("F7 ������ ��ũ�� �����մϴ�")

goto ������
return

F8::
ResizeWin(0,0)
;msgbox %FullX% %FullY%
error("F8 ���â���� ��ũ�� �����մϴ�")
;goto �������
�������()
return


F9::
reload
return

F10::
suspend
return


F11::
return
error ("�Ź߱���")
gosub ����â
gosub ����
gosub �Ź߱���
return

F12::
error("Debug Console Start")
return


;=====AreaCode
;1:�ڸ�, 2:���� 3:ǻ�� 4:������ƾ 5:����ũ���
;�񷽾��, ��������, �߶����ǻ縷, ����������, �񷽾��

;=====RaidNum
;  �ش� ���� ���̵��Դϴ�. �� ����� ������ 1���ۿ� ����



;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:�ڸ�, 2:���� 3:ǻ�� 4:������ƾ 5:����ũ���
;�񷽾��, ��������, �߶����ǻ縷, ����������, �񷽾��

;=====RaidNum
;  �ش� ���� ���̵��Դϴ�. �� ����� ������ 1���ۿ� ����


;// ��Ÿ�� Raid dungeon �ִ�.


�����̵�(maptype)  
{
    error("�����̵� �Լ��� ���� �Ϸ�", %maptype%)
    Sleep, 1000
    if(maptype = "raid")
    {
        error("���̵������̵� ")
        if(R_AreaCode=1)
        {
            error("�񷽾��  �̵�")
            MouseClickDrag, left, 1070, 210, 20,700
        }

        else if(R_AreaCode=2)
        {
            error("�߶����� �縷 �̵�")
            MouseClickDrag, left, 450, 360, 690,260
            
        }

        else if(R_AreaCode=3)
        {
            error("������������ �̵�")
            MouseClickDrag, left, 1086, 483, 644, 141


        }

        else if(R_AreaCode=4)
        {
            error("���������� �������� �̵�")
            MouseClickDrag, left, 200,300, 200, 650

        }

        else if(R_AreaCode=5)
        {
               error("��ä�������� �̵�") ;// ��� �̵��� ����� ��
               ;MouseClickDrag, left, 200,300, 200, 650
        }
    }


    else if(maptype = "dungeon")
    {
        error("���������̵� ")
        if(AreaCode=1)
        {
            error("�񷽾��  �̵�")
            MouseClickDrag, left, 1070, 210, 20,700
        }

        else if(AreaCode=2)
        {
            error("�߶����� �縷 �̵�")
            MouseClickDrag, left, 450, 360, 690,260

        }

        else if(AreaCode=3)
        {
            error("������������ �̵�")
            MouseClickDrag, left, 1086, 483, 644, 141


        }

        else if(AreaCode=4)
        {
            error("���������� �������� �̵�")
            MouseClickDrag, left, 200,300, 200, 650

        }

        else if(AreaCode=5)
        {
               error("��ä�������� �̵�") ;// ��� �̵��� ����� ��
               ;MouseClickDrag, left, 200,300, 200, 650
        }
    }

}
return



Ƽ��Ȯ��(ByRef value)
{
    ImageSearch,PosX,PosY, 1, 1,FullX,FullY, *50 %A_ScriptDir%\�̹���\���̵�_Ƽ�Ϻ���.bmp
    if ErrorLevel=0
    {

        if (isInfinity = 1)  ;; ���ѹݺ���Ű��
        {  
            ;msgbox Ƽ�Ϻ��� Ȯ�� ������ �Ѵ�
            error("���Ѹ��� Ƽ�� ���ٸ� return�� 6818 �����ݴϴ�")
            error("Ƽ�� ���� Ŭ�� �մϴ�")
            ��ưŬ��("Ƽ�Ϻ���_Ȯ��.bmp")
            ;msgbox Ƽ�Ϻ���
            value:=6818
            return %value%
        }

    ;///�׽�Ʈ �ڵ� �ڱ� ���� ����� ���� Ƽ�� �����ÿ� 
        else
        {
            error("Ƽ�� ���������� ���Ѹ�尡 �ƴ϶� �׳� ����")
            ��ưŬ��("Ƽ�Ϻ���_Ȯ��.bmp") 
            reload  ; Ƽ�Ϻ��� Ȯ���ϰ� �����Ѵ�
            ;reload
            return 0

        }
    }
    Else
    {
        
        error("Ƽ�� �������� ����")
    }
    return 0
}


�̱�:

;msgbox %isInfinity% ID
Count=0
error("�̱� ��ũ�� �����մϴ�")
Loop
{
; ���ǻ��� ** �̱� ���� ȭ�鿡�� �����ؾ� �Ѵ� ����� ������ ������ �ص� �ȴ�
; �˰��� ����
; �̱õ��� ��ư �̹��� ��ġ ��, �ش� ��ǥ Ŭ������ Ȯ�� â 2�ʰ� ������ ���� �̱� ������.
; ���� �߻��� �ؽ�Ʈ ���
; �ӽ�    Sleep, 5000
Sleep, 1000

    ImageSearch,PosX,PosY, HalfX , HalfY,FullX,FullY, *50 %A_ScriptDir%\�̹���\�̱õ���_��ư.bmp
    if errorlevel=0
    {
;//�������ض�
        MouseClick, left, %PosX%, %PosY%
        error("�̱� ���� ��ư ã��")

        ;msgbox %isTicket%

        ;if (isInfinity = 1)  ;; ���ѹݺ���Ű��
        ;{  
         ;   error("���Ѹ��� Ƽ�� �Ȼ�� �������� ��")
          ;  ūȮ�ι�ưŬ��()
          ;  gosub �����泪����
          ;  gosub ����â
          ;  �����Լ�()  ;; // ����â���� �����Ŀ� �׳� 
          ;  return
        ;}

;///�׽�Ʈ �ڵ� �ڱ� ���� ����� ���� Ƽ�� �����ÿ� 
        ;else
        ;{

        ;}
        Sleep, 1000
        ImageSearch,PosX,PosY,(HalfX/2), HalfY ,FullX,FullY, *30 %A_ScriptDir%\�̹���\�̱ý���Ȯ��_��ư.bmp
        if errorlevel=0
        {

            MouseClick, left, %PosX%, %PosY%
            error("�̱� ���� Ȯ�� ��ư ����")
            Sleep, 2000
            isTicket=0
            error("Ƽ�� Ȯ��")
            Ƽ��Ȯ��(isTicket)
            if isTicket=6818
            {
            ;    msgbox Ƽ�� 6818
                error("���� ���� Ƽ�� ������ �����Լ��� �ǵ��ư���")
                gosub �����泪����
                ;gosub ����â
                �����Լ�()  ;; // ����â���� �����Ŀ� �׳� 
            
                return
            }
            Else
            {
                
            }
            
            Sleep, 10000   ;�̱� ������ ������ ��߰���
            error("�̱� �����մϴ�~~")
            goto, �̱�����üũ    
            ;return          
            return 
        }
        else if errorlevel=2
        {
            error("�̱� ���� Ȯ�� ��ư �̹�������")
        }
        else 
        { 
            error("�̱� ���� Ȯ�� ��ư ��ã��")
        }

    }

    else if errorlevel=2
    {
      error("�̱� ���� ��ư �̹�������")
    }


    else
    {
    ;       error("****�̱� ���� ��ư �� ã�� �̱� ��ũ�� ���� �մϴ� `*****F5�� ����� �ϼ���")
    ;       return

    }



  
    ;============���� ����â ���ִ°� �ƴ��� Ȯ���غ���

    ;gosub, ����â����

    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\�̹���\����_����.bmp
    if errorlevel=0
    {
        error("���� ȭ�� ã��")
        MouseClick, left, %PosX%, %PosY%
    }   
    else if errorlevel=2
    {
        error("���� ���� �̹�������")  
    }
    else 
    { 
        if(Count = 10)
        {
            error("�������� ������ ��ã��")
        Count=0
        }
        else
        {
            Count+=1
        }
    }

}



�̱�����üũ:

; �˰��� -> �̱� ���� ����� �̹��� "���� ����" �̹��� �ȼ� üũ��, errorlevel=0 (Ȯ�ν�) �����ư Ŭ�� ��
; 3�� �� �Ŀ� Ȯ�� ��ư Ŭ������ ������ ���� 
; ���� �ٽ� �̱� ���� ���� ȭ������ ���ƿ´�
Count=0
Loop
{
    Sleep, 1000

    ;//�̹��� �����Ͽ� ���� Ž�� ���� �̹��� ����
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\�̹���\Ž�輺��_����_Ȩ��ư.bmp
    if errorlevel=0
    {
    error(" �̱� Ž�� ���� Ȩ��ư �̹��� Ȯ����")
    Sleep,4000
    ;�̱� ���� ���� Ȯ�ο� 0.5�� Ȯ�� ��ư�� 3�� ������ ��
    MouseClick, left, HalfX, HalfY

    Sleep,4000
        ImageSearch,PosX,PosY, (HalfX/3) *2, (HalfY/3) * 4,FullX,FullY, *50 %A_ScriptDir%\�̹���\�̱�_����_Ȯ��.bmp
        if errorlevel=0
        {
        ;             error %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%,3
        error("�̱� ���� Ȯ�� ��ư �˾�")
        Sleep, 1500
        MouseClick, left, %PosX%, %PosY%
        error("�̱� ���� Ȯ�� ��ư ����")
        Sleep, 5000
        goto �̱�
        Break           

        }
        else if errorlevel=2
        {
        error("�̱� ���� Ȯ�� �̹��� �����")
        ;           Break
        }
        else
        { 
        error("�̱� ���� ���� Ȯ�� ��ư ��ã��")
        ;                   Break

        }   

    }
    else if errorlevel=2
    {
    error("�̱� ���� Ȯ�� �̹��� �����")
    ;       Break
    }
    else 
    { 

    }

    if ( Count= 10)
    {
    gosub ģ����ȯ
    error ("�̱� ���� 10�� �� ģ�� ��ȯ")
    Count+=1
    gosub, �ڵ�����üũ

    }
    else if ( Count = 300 )
    {
    gosub ģ����ȯ
    error ("���� ��ȯ �� 5�и��� ģ�� ��ȯ")
    Count = 11
    }

    else
    {
    Count+=1

    }

}
return





�����ϱ�:
Loop, 10
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *30 %A_ScriptDir%\�̹���\�����ϱ�_��ư.bmp
    if errorlevel=0
    {
    ;   msgbox %PosX% %PosY%
    MouseClick, left, %PosX%, %PosY%
    error("�����ϱ� ��ư Ŭ�� �߽��ϴ�. 3���� �Լ� ����")
    Sleep, 3000
    break
    }

    else if errorlevel=2
    {
    error("�����ư.bmp ���׿� �����")
    ;   return
    }   



    else
    {
    error("���� ��ư ��ġ ��ã�� ����")

    ;   return
    }
    Sleep, 1000
}
return




;===============���⼭���� ����� �����̴� 0723���� ������

������:   ;;0723 �Ϸ�
Count=0
aCount=0
Loop, 50
{
;;;; �����ϰ� Sleep �ʼ�
;��� Sleep, 5000
;Sleep, 3000

;msgbox ������
    ;====================================���� �ҽ�  ���� =============================
    ����â����()

    
    ;     ImageSearch,PosX,PosY, 1 , 100 , FullX,FullY, *40 %A_ScriptDir%\�̹���\������_������.bmp
    ImageSearch,PosX,PosY, FullX/3 * 2= , 10 , FullX,FullY, *50 %A_ScriptDir%\�̹���\������_������.bmp
    if errorlevel=0
    {
        ;if (isInfinity = 1)  ;; ���ѹݺ���Ű��
        ;{  
        ;    error("���Ѹ��� �Ź� ���� �ʰ� ����")
        ;    ūȮ�ι�ưŬ��()
        ;    gosub �����泪����
        ;    gosub ����â
        ;    �̱��Լ�()  ;; // ����â���� �����Ŀ� �׳� 
        ;    return
        ;}

        ;msgbox %PosX% %PosY%
        MouseClick, left, PosX+5, PosY+5
        Sleep, 1000
        ;;��������   goto ���Ȯ��â
        error("�Ź� �������� üũ�Լ� �̵�")
        gosub �Źߺ���
        ;/////////0725�� ���� �Ѱ� �Ź� �����ϸ� �Ź� ����� ���� ���μ������ ����
        gosub ���Ȯ��â

        ;return
        break
    }

    else if errorlevel=2
    {
    ;       error("������ ������ �̹��� ����")
    ;msgbox "������"
    }

    else 
    {
    ;       error("������ ������ ��ã��")
    ;msgbox ������ ������ ��ã�� 
        ;Count+=1
        error("�����濡�� ���� �ִµ� �� ���� Count " %Count%)
        if (Count0 = 20)
        {
            error("�����濡�� ���� �ִµ� �� ���� Count " %Count%)
           Count=0
        ;           MouseClick, left, FullX/2 ,HalfY/4
        }

        else
        {
        }


    }

    ;============���� ����â ���ִ°� �ƴ��� Ȯ���غ���

/*
    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\�̹���\����_����.bmp
    if errorlevel=0
    {
      error("���� ȭ�� ã��")
      ;       msgbox %PosX% %PosY%
       MouseClick, left, %PosX%, %PosY%

    }   
    else if errorlevel=2
    {
       error("���� ���� �̹�������")  
    }
    else 
    { 
        if(aCount = 10)
        {
         error("���� �������� ������ ��ã��")
        ;   msgbox %PosX% %PosY% %FullX% %FullY%
        aCount=0
        }
        else
        {
        aCount+=1
        }

    }
*/

    Sleep, 300
}
error("!!!!!!!!!!!!!!!�ɰ�!!!!!!!!!")
error("���� ������ ������ ��ã�� ������ �߷�")
;�����泪����()
;�����Լ�()
;
gosub ������
return



;;�̱� �̹��� �� ã���� ���� ȭ���� �ƴ��� Ȯ���غ���





;==========���â���� ����� �޽����� ������ �ȶ����� Ȯ�κ��� �ϴ� ���̶� ��κ� ��ư ��ã�� ���ϰ� ������ �Ŵ� 
���Ȯ��â:   ;;0723 �Ϸ�
Loop, 5
{

    ImageSearch,PosX,PosY,HalfX/3,HalfY,FullX,FullY, *30 %A_ScriptDir%\�̹���\����_������_���â_Ǯ.bmp
    if errorlevel=0
    {
        error("���â Ǯ�̶� ��� �Ǹ��Ϸ� ���ϴ�")
        ;       error("���Ȯ��â %PosX% %PosY%")
        MouseClick, left, %PosX%, %PosY%
        error("���Ȯ��â Ŭ�� �Ϸ�") ; ==%PosX% %PosY%")
        Sleep, 5000

        �������()
        ;;//////��� ���� ������ ESC�� ���â�ݱ�
        Send {Esc}
        Sleep, 2500
        gosub ������       
        ;Return
        break
    }

    else if errorlevel=2
    {
        error("���â �̹��� �����")
        Break
    }

    else        
    {
    ; 
    ;       error("���â ���� ��ư ��ã��")
    }
    Sleep, 500
}
goto ģ������
return






ģ������:    ;;0723 �Ϸ�
isFriendEmpty=0
aCount=0
Loop
{
;     ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\�̹���\ģ������_���Ϸ�.bmp
    ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\�̹���\ģ������_��ư.bmp
    if (errorlevel=0) || (isFriendEmpty = 1)
    {

        MouseClick, left, %PosX%, %PosY%
        ;         Sleep, 500
        error("ģ������ â -> ���� ���μ��� ")



        ImageSearch,PosX,PosY, HalfX/3 * 2  , HalfY/3 * 5 + 20, FullX, FullY, *30 %A_ScriptDir%\�̹���\ģ������_�����ϱ�.bmp
        if (errorlevel=0) || (isFriendEmpty = 1)
        {

        ;=======ģ�������� ���� �����ư ���� ��


         Loop , 6  ;// �������� �ϴ� ������ ģ�� ����� ��ư ������ ��Ÿ�ϸ� ���� 2��� �ִ� ���� �־���
         {
                MouseClick, left, %PosX%, %PosY%
                Sleep, 500
         }
         error("ģ������-> ���� ���μ��� -> �����ư ���� Ŭ�� �Ϸ�")


           ;                  Sleep, 6000  ;�ε� �ð� �����ؼ�

         gosub ģ��Ȯ��â
          ;             gosub �����������üũ
         ;return          
         break

        }
        else if errorlevel=2
        {
            error("ģ������_���� Ȯ�� �̹��� �����")
            Break
        }
        else
        { 
            error("ģ������_���� Ȯ�� ��ư ��ã��")
            Break
        }   

    }

    else if errorlevel=2
    {
        error("ģ������_�����ϱ� �̹��� �����")
        Break
    }
    else 
    {


        ;========= ģ���� �� ���� �ƴ��� Ȯ���� ����
        ImageSearch,PosX,PosY, 1 ,80 ,FullX,FullY, *50 %A_ScriptDir%\�̹���\ģ������_���Ϸ�.bmp
        if errorlevel=0
        {
            error("!!!!ģ�� ��� ��� �� ��!!!!!")
            ;             MouseClick, left, %PosX%, %PosY%
            isFriendEmpty=1
            error("ģ�� ���� ���� ���� ����")
        }   
        else if errorlevel=2
        {
            error("ģ������_���Ϸ� �̹�������")  
        }
        else 
        { 
           if(aCount = 10)
            {
                error("ģ������_���Ϸ� ������ ��ã��")
                aCount=0
            }
            else
            {
                aCount+=1
            }
          
        }


        ;==========
        error("ģ������ ��ư �� ã��")
    }         


}
return



�����������üũ:   ;;0723 �Ϸ�
Count=0
Loop
{

    Sleep,300

    ;   ImageSearch,PosX,PosY,1,1 ,FullX,FullY, %A_ScriptDir%\�̹���\Ž�輺��_����_�ؽ�Ʈ.bmp
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\�̹���\Ž�輺��_����_Ȩ��ư.bmp
    if errorlevel=0
    {

        error("Ž�� ���� üũ �Ϸ� ")
        Sleep,300
        ;Ž�� �����Ŀ� ����â �������� ������ �ɾ��

        MouseClick, left, %PosX%, PosY-100
        Sleep, 2000

        error("���� ���� ���� Ȯ��")
        ��ưŬ��("����_���躸��_Ȯ��.bmp")
        Sleep, 6000
        gosub ������
        

    }


;/////////�������н�üũ�� �ʿ���

       ImageSearch,PosX,PosY,HalfX/3, 50 ,FullX,FullY, *30 %A_ScriptDir%\�̹���\����Ž��_����.bmp
       if errorlevel=0
       {
            error("���� �����Ͽ����ϴ�.")
            MouseClick, left, %PosX%, %PosY%
            Sleep, 6000

;//// ���� ���� ������ �Ϲ� ȭ�� ���� �Ѿ�� �ð� üũ���� 
            ;MouseClick, left, HalfX, HalfY%PosX%, %PosY%
            ;Sleep, 4000
            loop 
            {
                ��ưŬ��("����Ž�����_Ȯ��.bmp", HalfX/3)
                ��ưŬ��("����_���躸��_Ȯ��.bmp" HalfX/3)
                error("���� ���� �ĺ����� �Լ� ȣ��")
                Sleep, 500
            }
            goto ������
            return
        }

       else if errorlevel=2
        {
           error("�������� Ȯ�� Ȩ �̹��� �����")
           Break
        }

        else
        {
            ;error("���� ���� Ȯ�� ��ư�� ��ã�ƿ�")
        }

;===========================���� ȹ��� Ȯ�� â=============================

    ImageSearch,PosX,PosY,1, 1 ,FullX,FullY, *50 %A_ScriptDir%\�̹���\����ȹ��_���ϴ�.bmp
    if errorlevel=0
    {
        error("����ȹ���߽��ϴ� �ؽ�Ʈ üũ")
        Sleep, 2000
        ImageSearch,PosX,PosY,HalfX/2, (HalfY/3) *4 ,FullX,FullY, *20 %A_ScriptDir%\�̹���\����ȹ��_Ȯ�ι�ư.bmp
        if errorlevel=0
        {
            error("����ȹ�� �Ͽ����ϴ�")
            MouseClick, left, %PosX%, %PosY%
            ;           Sleep, 6000   



        }  

        else if errorlevel=2
        {
          error("���� Ȯ�� Ȩ �̹��� �����")
        ;       Break
        }
        else 
        { 

            error(�� ���� �ü��� ���� ����ȹ��� ó�� ������ �ɰ��� ������!)
            ImageSearch,PosX,PosY,HalfX/2,HalfY ,FullX,FullY, *20 %A_ScriptDir%\�̹���\����_Ȯ��_��ư_small.bmp      
            if errorlevel=0
            {
            error("!!!!!!!!!!!����ȹ��Ȯ�� %PosX% %PosY%")  ;����
            MouseClick, left, %PosX%, %PosY%
            Sleep, 6000

            MouseClick, left, HalfX, HalfY
            Sleep, 3000

            }
            else if errorlevel=2
            {
            error("���� Ȯ�� ��ư ���")
            }
            else 
            { 
            }

    ;       error(�� �ƹ��͵� ��ã��   ; ���� ȹ�� �޽��� ���� ��ã���� ���� �ִ� ����)
       }

    }

    else if errorlevel=2 ;; �� �̰͵� �̺�Ʈ�� �������ɼ��� �վ �α� ����� ����
    {
        error("����_���ϴ� �̹��� ���׿�")
    }

    else  ;; �� �̰͵� �̺�Ʈ�� �������ɼ��� �վ �α� ����� ����
    {
    ;       error(����_���ϴ� ��ã��)
    }


    if ( Count = 10 )
    {
        gosub ģ����ȯ
        Count+=1
        gosub, �ڵ�����üũ
        ;count=0
    }

    else if ( Count = 301 )
    {
        gosub ģ����ȯ
        error ("���� ��ȯ �� 5�и��� ģ�� ��ȯ")
        Count = 11
    }
    else
    {
        Count+=1
    }
;==========================���� ���� Ȯ��=====================
}
error("!!!���� ������!!�������� return") ; ===========�̸��� ���� �Ǵ� ��Ȳ�� ���� �ȴ�°���
return


=-=============================================üũ


ģ��Ȯ��â: ;0723Ȯ��
error("ģ�� Ȯ��â ����")
Loop, 8
{
    ;   ģ�����þȴ�_üũ

    ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\�̹���\ģ�����þȴ�_üũ.bmp
    if errorlevel=0
    {
        error("ģ�� ������ �ȵ�")

        ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\�̹���\ģ�����þȴ�_Ȯ��_��ư.bmp
        if errorlevel=0
        {
            ;   error %PosX%, %PosY%
            error("ģ�� ���� �ȵ�ä�� ���� �����")
            MouseClick, left, %PosX%, %PosY%
            ;;gosub ģ����ȯ
            ;error("ģ����ȯ �Ϸ� �߱��� ->�������� üũ�մϴ�")
            error("���� ���� �ܰ� ��� �Ϸ�! ->���� ���� üũ�մϴ�")
            gosub �����������üũ
            ;return
            break
        }
        else if errorlevel=2
        {
            error("ģ�� ���� ���� Ȯ�� �̹��� �����")
        ;       Break
        }

    }

    else if errorlevel=2
    {
        error("ģ�����þȴ�_üũ �̹��� �����")
        ;       Break
    }

    else        
    {

    }

    Sleep, 500

}
error("ģ�� ������ Ȯ��â ���� ���������� ģ����ȯ->����üũ ����")
;gosub ģ����ȯ
gosub �����������üũ
error ("���� �����մϴ�")
return



ģ����ȯ: ;0723
{

    ;Sleep, 10000

    PosX=0
    PosY=0

    PosX:= HalfX + ( HalfX / 30 ) * 3
    PosY:= HalfY / 4


    MouseClick, left, %PosX%, %PosY%

    error("ģ�� ��ȯ �Ϸ��Դϴ�!! ")


    Sleep, 1000

    return
}


�ڵ�����üũ:
{
    ImageSearch,PosX,PosY,1,(HalfY/2) *3,FullX,FullY, *30 %A_ScriptDir%\�̹���\auto_off.bmp
    if errorlevel=0
    {
        error("�ڵ� ���� ���� ����")
        MouseClick, left,  %PosX%, %PosY%

        error("�ڵ� ���� Ŭ�� �Ϸ�")
        return

    }

    else if errorlevel=2
    {
    error("auto_off.bmp �����")
    return
    }

    else        
    {
    return

    }
}


�Źߺ���:
Loop, 10
{

    ImageSearch,PosX,PosY,HalfX/2,(HalfY/3) ,FullX,FullY, *30 %A_ScriptDir%\�̹���\�Źߺ���.bmp

    ;//�ڱ����� ������ 
    ;errorlevel=0
    if errorlevel=0
    {
        error("�Ź� �ٽ�׿�.")
        MouseClick, left,  %PosX%, %PosY%
        if (isInfinity = 1)  ;; ���ѹݺ���Ű��
        {  
            ;Sleep, 
            ;loop ,3
            ;{  
                error("�Ź� ���� isInfinity=1 �Դϴ�")
                error("���Ѹ��� �Ź� ���� �ʰ� ����")
                ��ưŬ��("�Źߺ���_Ȯ��.bmp")
                gosub �����泪����
                ;gosub ����â
                �̱��Լ�()  ;; // ����â���� �����Ŀ� �׳� 
                ;���̵��Լ�()
                ;return
                return
            ;}
            ;return  
        }
        Else
        {

        }

        if(isBuyShoes = 1)
        {
            error("�Ź� �����Ϸ� ���ϴ�")


            ImageSearch,PosX,PosY,HalfX/2,HalfY, FullX,FullY, *30 %A_ScriptDir%\�̹���\�Źߺ���_Ȯ��.bmp
            if errorlevel=0
            {
                error("�Źߺ��� Ȯ��â Ŭ��")
                MouseClick, left,  %PosX%, %PosY%
                gosub �����泪����
                gosub ����â
                ;             MainScreen()
                ;             ����()
                gosub, ����
                ;gosub, �Ź߱���
                ;;;;;;;;;;;;;������ �Ź߱��� ����
                ;;            gosub ������
                ;;�̹̿��⼭ Ȩȭ�� ��
                
                �����Լ�()  ;//���� �Լ��� ����ȭ�鿡�� �������� �˾Ƽ� �����̴�
                return
                ;break
            }
            else if errorlevel=2
            {
                error("�Źߺ���Ȯ��.bmp �����")
            }
            else
            {
            }

        }


        else ; isBuyShoes �Ź� ���� ���Ѵ�
        {
            error("�Ź� ���� ���� ���� ���� �մϴ�")
            return
            ;break
        }

    }


    else if errorlevel=2
    {
        error("�Źߺ���.bmp �����")
        return
        ;break
    }

    else        
    {
        error("�Ź� ���� ���� �־ �Ź� üũ �Ѿ->>��� Ȯ��")
        ;goto ���Ȯ��â
        return
        ;break

    }
    Sleep, 300
}
return

�����泪����:
{
    Loop,10
    {

        ImageSearch,PosX,PosY,1 ,(HalfY/3) * 4 ,FullX,FullY,  *30 %A_ScriptDir%\�̹���\������_��ư.bmp
        if errorlevel=0
        {
            ;msgbox %PosX% %PosY%
            error("������-> �� ������ ��ưã�ұ���.")
            MouseClick, left,  %PosX%, %PosY%
            error("������ ��ư Ŭ�� ")

        }

        else if errorlevel=2
        {

          error("������_��ư.bmp �����")
        ;       return
        }

        else        
        {
           error("������ ��ư ������ ã�� �� ������ return��Ŵ")
        ;       return

        }

        ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *30 %A_ScriptDir%\�̹���\�����ϱ�_��ư.bmp
        if errorlevel=0
        {
           error("�����ϱ� ��ư �ִ°��� �����ϴ� ����ȭ���Դϴ�")
        ;     MouseClick, left, %PosX%, %PosY%
        ;
            ;return
            break
        }   
    Sleep, 1000
    }

}
;MainScreen()
error("������ ������ ���� ")
;goto, ����â
return





����â����()  
{

    ImageSearch,PosX,PosY, 1 , 1,FullX,FullY, *50 %A_ScriptDir%\�̹���\����_����.bmp
    if errorlevel=0
    {
        error("���� ȭ�� ã��")

        ;msgbox %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        error("���� ȭ�� ����")
        return
    }   
    else if errorlevel=2
    {
        error("���� ���� �̹�������")  
    }
    else 
    { 
        ;if(Count = 10)
        ;{
            error("�������� ������ ��ã�� Count ", %Count%)
            Count+=1
        ;}
        ;else
        ;{
        ;   Count+=1
        ;}
    }
    ;Count+=1
}



/*
����â����:  ;;;
{

    error("����â ��  �ִ��� Ȯ�� ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *30 %A_ScriptDir%\�̹���\����_����.bmp
    if errorlevel=0
    {
        error("���� ȭ�� ã��")
        MouseClick, left, %PosX%, %PosY%
        error("���� ȭ�� ����")
        return
    }   
    else if errorlevel=2
    {
        error("�������� ���� �̹�������")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("�������� ������ ��ã��")
        Count=0
        }
        else
        {
        ;   Count+=1
        }
    }
    ;Count+=1
    return
}
return
*/

�̺�Ʈ����������:
{
    error("�̺�Ʈ ������ �ִ��� Ȯ�� ")


    ;ūȮ�ι�ưŬ��()
    ��ưŬ��("�̺�Ʈ������_Ȯ��.bmp")


    return
    ;
    ;ImageSearch,PosX,PosY, 1, HalfY/3, FullX,(FullY/5) * 7, *30 %A_ScriptDir%\�̹���\ūȮ�ι�ư.bmp
    if errorlevel=0
    {
        error("�̺�Ʈ ȭ�� ã��")
        MouseClick, left, %PosX%, %PosY%
        error("�̺�Ʈ ȭ�� ����")
        return
    }   
    else if errorlevel=2
    {
        error("Ȯ�ι�ư.bmp �̹�������")  
    }
    else 
    { 
         error("�̺�Ʈ ������ ��ã��")
        if(Count = 10)
        {
        ;        error("�������� ������ ��ã��")
            Count=0
        }
        else
        {
        ;   Count+=1
        }
    }
    ;Count+=1
    return
}


���̵��絵��â����:  ;;; //
{
    error("���̵� �絵��â �ִ��� Ȯ�� ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *30 %A_ScriptDir%\�̹���\���̵�_�絵��.bmp
    if errorlevel=0
    {
        error("���̵� �絵�� ȭ�� ã��")
        ;     MouseClick, left, %PosX%, %PosY%

        gosub, ��ҹ�ưŬ��
        ;gosub, Ȯ�ι�ưŬ��
        ��ưŬ��("Ȯ�ι�ư.bmp")

        ;;��� ���� ���� ��� Ȯ�� �� �ΰ�����?? �׽�Ʈ���ΰ�
        ;;Ȯ���غ���  �𸣰ڳ� ��

        error("���̵� �絵�� ȭ�� ����")
        return
    }   
    else if errorlevel=2
    {
     error("���̵�_�絵��.bmp �̹�������")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("���̵�_�絵��.bmp ������ ��ã��")
          Count=0
        }
        else
        {
        ;   Count+=1
        }
    }
    ;Count+=1
    return
}
return





;============ ����â���� �̵��ϴ� �뵵�̴�. �������Ұ� ���̵� �Ϸ�ÿ� ���, Ȯ��ó�� =======
;============ �⺻������ Ư�� ���� â �����ϴ°��� �����̴�=================
;MainScreen(1)
����â:
Loop, 3
{
;msgbox aaa
    ;   ����â����()
    ;gosub, ����â����
    ����â����()
    gosub, ���̵��絵��â����
    gosub, �̺�Ʈ����������

    ImageSearch,PosX,PosY,Half/3  ,(HalfY/3) * 4 ,FullX,FullY, *30 %A_ScriptDir%\�̹���\Ư������â_���_����.bmp
    if errorlevel=0
    {
        error("!!!!!!!!!!Ư������â�� �����ϴ�~~!!!!!!!!!!!")

        ImageSearch,PosX,PosY,HalfX/3,(HalfY/3) * 4, FullX,FullY, *30 %A_ScriptDir%\�̹���\Ư������_���.bmp
        if errorlevel=0
        {
            ;error("Ư������â ��� ã�ҽ��ϴ�")
            MouseClick, left,  %PosX%, %PosY%
            error("Ư������â ��� ��ư Ŭ�� �Ϸ�")
            ;         Sleep, 2000 ;///Ư������ ��ҹ�ư ������ â �ߴ� �ð� ���


            sleep, 2000
            ;;///////Ư�� ���� ��� -> Ȯ�α���

            Loop
            {   

                ImageSearch,PosX,PosY,HalfX/3,HalfY, FullX,FullY, *30 %A_ScriptDir%\�̹���\Ư������_������üũ.bmp
                if errorlevel=0
                {
                    error("Ư������â ������ Ȯ�� �޽��� ���׿�~ `n `3'���� ���ؿ�~~�Ź߻緯 ������!")
                    MouseClick, left,  %PosX%, %PosY%
                    error("Ư������â ������ ���� ����(���) Ŭ�� �Ϸ�")

                    ;return

                }
                else if errorlevel=2
                {
                    error("Ư������_������üũ.bmp �����")
                }

                else
                {
                    error("Ư������â ��ư ��ã��")
                    error("!!!!!!!!!!!!!�������� �������ϴ�")
                    break
                }

          }   

        }

        else if errorlevel=2
        {
            error("Ư������_���.bmp �����")
        }

        else
        {   

        }


        Count+=1

        if(Count > 200)
        {
           error("â ��ã�� ������ ���� ���� ���ϰ� ������")

        }   
        Sleep,100
    ;////Ư�� ���� ��� ����
    }


    else if errorlevel=2
    {

      error("Ư������â_���_����.bmp �����")
    ;       return
    }

    else        
    {
    ;       error("Ư������â �ȶ��")

    }   


    ;   error("������-> �� ������ ��ưã�ұ���.")
    ;   MouseClick, left,  %PosX%, %PosY%
    ;   error("������ ��ư Ŭ�� ")


    Sleep, 200

}
return





����:
{

    Loop,10
    {
    ;   error("��������  ")

        ImageSearch,PosX,PosY,HalfX ,HalfY ,FullX,FullY,  *30 %A_ScriptDir%\�̹���\����_������ư.bmp
        ;   ImageSearch,PosX,PosY,1 ,1 ,FullX,FullY,  *30 %A_ScriptDir%\�̹���\����_������ư.bmp
        if errorlevel=0
        {
            error("����ȭ��_���� ��ư ã�ҽ��ϴ�.")
            MouseClick, left,  %PosX%, %PosY%
            error("���� ��ư Ŭ�� ")

            ;���� Ŭ���� ���� �˾� �̺�Ʈ������ ����ؾ���
            Sleep , 2000  
            ;/////////////////////



            ;////////���� ���� �˾� ���� ������ Ȯ���Ѵ�
            Loop, 5
            {
            ;;��� �ʼ� ========������Ʈ,��ġ �� �̹��� ���� �� �ʿ��� ==============
                error("���� ������ �˾�â �����")

                ImageSearch,PosX,PosY,1,1, FullX,FullY, *30 %A_ScriptDir%\�̹���\���ʱ����˾�_0729.bmp
                if errorlevel=0
                {
                    error("!!!!!!!!!���ʱ���â �˾��Դϴ� �����մϴ�!!!!!!")
                    ;             MouseClick, left,  %PosX%, %PosY%
                    error("Ư������â ������ ���� ����(���) Ŭ�� �Ϸ�")

                    ;=====================���ʱ��� Ȯ�� â Ŭ��

                    ImageSearch,PosX,PosY,1,HalfY, FullX,FullY, *30 %A_ScriptDir%\�̹���\���ʱ���âȮ��.bmp
                    if errorlevel=0
                    {
                        error("!!!!!!!!!���ʱ���â Ȯ���ϰ� �����ϴ�!!!!!!")
                        MouseClick, left,  %PosX%, %PosY%
                     error("���ʱ���â Ȯ�� Ŭ�� �Ϸ�`n â�����")


                        ;///��� ���⵵ �������� �ʼ�
                        error("���ʱ���â ���� ���� ���� ����������!!!!!!!!")
                        ;             gosub �Ź߱���
                        ;return
                        break

                    }
                    else if errorlevel=2
                    {
                    error("���ʱ���âȮ�� bmp �����")
                    }

                    else
                    {
                    error("���ʱ���âȮ�� bmp ��ġ�� ã������ �����")
                    }

       ;=====================���ʱ���â �ݱ�




                }
                else if errorlevel=2
                {
                    error("���ʱ����˾�_0729 bmp �����")
                }

                else
                {
                    error("���ʱ����˾��� ���� �� �ϴ� �Ź� ���� �ؾ���")
                    if(BuyOption=1)
                    {
                        error("�Ź� ���� �ɼ��ֳ׿�")
                        gosub �Ź߱���
                    }
                    else if (BuyOption=2)
                    {
                        error("���� �ɼ� �����~")

                    }
                    ;return
                    break
                }

    ;=========�˾� �̹���  ���� ��

            Sleep, 1000
            }



         }

        else if errorlevel=2
        {

        error("����_������ư.bmp ���׿�")
        ;       return
        }

        else        
        {
        error("����_������ư.bmp ������ ã�� �� ������ return��Ŵ")
        ;       return

        }   

    sleep,1000
    }
    ;msgbox "�������� ���� �Ф�"
return
}


�Ź߱���:
Loop, 5
{
    error("�Ź� ����â ����")
    ImageSearch,PosX,PosY,HalfX/3 ,1 ,FullX,FullY, *30 %A_ScriptDir%\�̹���\�Ź߰�Ƽ��_����.bmp
    if errorlevel=0
    {
    ;msgbox %PosX% %PosY%
        error("�Ź߰� Ƽ�� ����â ã��")
        MouseClick, left,  %PosX%, %PosY%
        error("�Ź߰� Ƽ�� ����â Ŭ�� ")
    ;�Ź� 20�� ����  �Ұž�===========����
    ;�Ź� 20������ �Ϸ�
    }

    else if errorlevel=2
    {

        error("�Ź߰�Ƽ��_����.bmp �����")
    ;       return
    }

    else        
    {
    ;       error("�Ź߰�Ƽ��_����.bmp ��ġ Ȯ�� �Ұ�")
    ;       return

    }    ;//////////�Ź�Ƽ��  ��ư ����


;//////////////////�Ź� 20�� ȭ���̸� �����Ѵ�

    ImageSearch,PosX,PosY,HalfX ,1 ,FullX,FullY, *30 %A_ScriptDir%\�̹���\�Ź߰�Ƽ��_�Ź�20��.bmp
    if errorlevel=0
    {
        error("�Ź� 20�� bmp ��ġã�Ҿ��")
        MouseClick, left,  %PosX%, %PosY%
        error("���� ��ư ���� ")

        Sleep, 2000
        error("Ȯ�ι�ư Ŭ��")
        ��ưŬ��("Ȯ�ι�ư.bmp")
        ;
        ;gosub, ��ҹ�ưŬ��

        error("ESC�ι� ������ ���� ȭ������ ���ò�����")
        Loop, 2
        {
            Sleep, 1000
            Send {ESC}
        }
        error("�Ź� 20�� ���ԿϷ�")
        return

    }

    else if errorlevel=2
    {

      error("�Ź߰�Ƽ��_�Ź�20��.bmp �����")
    ;       return
    }

    else        
    {
    ;       error("�Ź߰�Ƽ��_�Ź�20��.bmp ��ġ ã�� �� ����")
    ;       return

    }   
    Sleep, 500
}
return

��ҹ�ưŬ��:
Loop, 10
{
    ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\�̹���\��ҹ�ư.bmp
    if errorlevel=0
    {
        error("��� ��ưã�ұ���.")
        MouseClick, left,  %PosX%, %PosY%

        error("��� ��ư Ŭ�� ")
        ;return
        break

    }

    else if errorlevel=2
    {
        error("��ҹ�ư.bmp �����")
        ;return
        break
    }

    else        
    {
        error("��ҹ�ư.bmp ��ġ ã�� �� ����")
        ;       return

    }
    Sleep, 1000
}
return


��ưŬ��(str,StartX=1, StartY=1)
{
    Loop, 2
    {
    ;   ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\�̹���\Ȯ�ι�ư.bmp
        ImageSearch,PosX,PosY,StartX,StartY,FullX,FullY, *30 %A_ScriptDir%\�̹���\%str%
        if errorlevel=0
        {

            error(str, " PosX", "  PosY")
            MouseClick, left,  %PosX%, %PosY%

            error(str, " ��ư Ŭ�� ")
            ;msgbox ��ư ã�� Ȯ�δ���
            ;msgbox %str%
        ;   msgbox %PosX% %PosY%
            ;return
            break

        }

        else if errorlevel=2
        {
            error(str, "  �����")
            ;return
            break
        }

        else        
        {
            error(str, " ã���� �����")
        ;       return

        }
        Sleep, 500
    }
}




;===========================�������� ����


;RaidNum=1  
;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:�ڸ�, 2:���� 3:ǻ�� 4:������ƾ 5:����ũ���
;�񷽾��, ��������, �߶����ǻ縷, ����������, �񷽾��


;;�������� 5-2  ������ä 4-5
;=====RaidNum
;  �ش� ���� ���̵��Դϴ�. �� ����� ������ 1���ۿ� ����


���̵嵵��()
{
    loop, 10
    {
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\�̹���\���̵��û.bmp
        if errorlevel=0
        {
        ;   msgbox %PosX% %PosY%
            error("���̵� ���� �մϴ�")

            MouseClick, left, %PosX%, %PosY%
            Sleep, 1000
            ��ưŬ��("���̵�Ȯ��_��ư.bmp")        

            ;return
            break
        }

        else if errorlevel=2
        {
            error("���̵� ��û �� Ȯ�� �̹��� �����")
        ;   return
        }   



        else
        {
           error("���̵��û �� ���� �̹���  ����")

        ;   return
        }
        Sleep, 500
    }
}


;;;;;;18

���̵������Ȳüũ()
{

    Loop
    {

        Sleep,300
        ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\�̹���\���̵�_Ž�����.bmp ;;���̵嶧�� �̰� ���о�
        if errorlevel=0
        {
            error("���̵� ������ ")
            
            Sleep, 10000

            MouseClick, left, %PosX%, PosY-100
            ;���̵��Լ�()
            ;return
            break
        }

        ImageSearch,PosX,PosY,HalfX/2, HalfY/2 ,FullX,FullY, *20 %A_ScriptDir%\�̹���\���̵�_����ǥ.bmp ;; ���̵� ����
        if errorlevel=0
        {
            error("���̵� ������")
            ;;MouseClick, left, %PosX%, %PosY%
            Sleep, 10000

            ;//// ���� ���� ������ �Ϲ� ȭ�� ���� �Ѿ�� �ð� üũ���� 
            ;           MouseClick, left, HalfX, HalfY
            ;               Sleep, 4000
            ;���̵��Լ�()   ;//��� ��Ȳ ����Ǿ����� ����â���� 
            ;return
            break

        }

    }  
}



;RGB
;0x9E37FF �����
;0x1A91FF �Ķ���
;0x24D25D ���
;0xFFFFFF ���

;BGR

;0xFF379E �����
;0xFF911A �Ķ���
;0x5DD224 ���
;0xFFFFFF ���


;Button�̱õ�����:
;Sleep, 5000
;goto �̱�
;return

;Button�����滱��:
;Sleep, 5000
;goto ������
;return

;Button���â����:
;Sleep, 5000
;goto �������
;return


;GuiClose:
;ExitApp
;return



















