;http://www.autohotkey.com/board/topic/25446-consolesend/
;http://www.autohotkey.com/board/topic/96895-libcon-autohotkey-library-for-console-support/
;http://v1.autohotkey.co.kr/
Gui,color,0x112233
Gui, Font, cWhite S11 w580      
Gui, Add, GroupBox, x12 y10 w280 h250 , 사용 방법
Gui, Add, Text, x22 y40 w250 h30 , F1: 미궁 돌리기
Gui, Add, Text, x22 y90 w250 h30 , F2: 각지역 마지막 보스
Gui, Add, Text, x22 y140 w250 h30 , F3: 장비창 정리 ** 스크롤 빼놓으세요**
Gui, Font, cRed S11 w700
Gui, Add, Text, x22 y190 w250 h30 , **매크로 종료는 F6입니다**

Gui, Add, Picture, x12 y280 w280 h190 , %A_ScriptDir%\이미지\\풉.jpg

; Generated using SmartGUI Creator 4.0
;Gui, Show, x127 y87 h482 w309, New GUI Windowd
;===================================GUI====================================


;===========================자잘한 설정들===========================
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
;1:코모도, 2:스톰 3:퓨리 4:블랙마운틴 5:데스크라운
;골렘언덕, 잊혀진숲, 추락자의사막, 검은바위산, 골렘언덕

;=====Dungeon=====
;해당 지역에서 왼쪽 기준으로 1번으로 시작합니다. 실제 난이도 상관 없이 편의상
;예로 4번 지역인 검은 바위산의 왼쪽에서 5번째 던젼은 검은 성채 입니다.

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

global isRaidFinished=0  ;//레이드 진행 체크 1은 끝나서 진입하면 안되는 상황 0은 진행 가능한 상황

;global FullX, FullY, HalfX, HalfY:=0


;; 실제 윈도우 사이즈 측정





ResizeWin()
OnInit()

error("에러 날때 ", "이창을 스샷 해주세요")


error("던젼로딩 이미지이름")
error(DungeonFile)

error("레이드로딩 이미지이름")
error(RaidFile)


F1::
ResizeWin(0,0)
;미궁함수()
goto 미궁
return

F2::
;SetGenySize()
;등급판매("흰색_아이템.bmp")
goto 던젼진행사항체크
return

F3::
업적창날림()
;티켓확인(12)
;레이드함수()
;레이드맵선택()

return

F4::
;ResizeWin(0,0)
;error("F4 Test")


error("보스방 뺑뺑이 갑니다")
;goto 던젼함수
던젼함수() ;//이름 좀 바꿔야할듯 
;goto 친구선택

return

F5::
ResizeWin(0,0)

error("신발 구입 테스트")
;RaidNum=1  
;AreaCode=4
;DungeonNum=5
;DungeonFile="4_5.bmp"
;goto 던젼함수
;던젼최종선택()
;goto 신발부족
;버튼클릭("보스방_아이콘.bmp")
;버튼클릭("이벤트페이지_확인.bmp")
;버튼클릭("서버연결종료_확인.bmp")
;버튼클릭("동료획득_확인버튼.bmp")
;버튼클릭("포션판매창_확인.bmp")
;버튼클릭("신발부족_확인.bmp");
;버튼클릭("신발구입_확인.bmp");
;버튼클릭("던전_모험보상_확인.bmp")
;버튼클릭("친구선택_버튼.bmp")
;버튼클릭("친구선택_입장하기.bmp")
;티켓확인(tempval)
;msgbox 티켓확인 레퍼펀스 %tempval%



return


F6::
reload
ResizeWin(0,0)

return

error("미궁 오토 매크로 정지합니다")
msgbox "자동 사냥 매크로 정지 합니다"
return



F7::
ResizeWin(0,0)

error("F7 보스방 매크로 시작합니다")

goto 보스방
return

F8::
ResizeWin(0,0)
;msgbox %FullX% %FullY%
error("F8 장비창정리 매크로 시작합니다")
;goto 장비정리
장비정리()
return


F9::
reload
return

F10::
suspend
return


F11::
return
error ("신발구입")
gosub 메인창
gosub 상점
gosub 신발구입
return

F12::
error("Debug Console Start")
return


;=====AreaCode
;1:코모도, 2:스톰 3:퓨리 4:블랙마운틴 5:데스크라운
;골렘언덕, 잊혀진숲, 추락자의사막, 검은바위산, 골렘언덕

;=====RaidNum
;  해당 지역 레이드입니다. 뭐 결론은 지금은 1번밖에 없음



;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:코모도, 2:스톰 3:퓨리 4:블랙마운틴 5:데스크라운
;골렘언덕, 잊혀진숲, 추락자의사막, 검은바위산, 골렘언덕

;=====RaidNum
;  해당 지역 레이드입니다. 뭐 결론은 지금은 1번밖에 없음


;// 맵타입 Raid dungeon 있다.


지역이동(maptype)  
{
    error("지역이동 함수로 진입 완료", %maptype%)
    Sleep, 1000
    if(maptype = "raid")
    {
        error("레이드지역이동 ")
        if(R_AreaCode=1)
        {
            error("골렘언덕  이동")
            MouseClickDrag, left, 1070, 210, 20,700
        }

        else if(R_AreaCode=2)
        {
            error("추락자의 사막 이동")
            MouseClickDrag, left, 450, 360, 690,260
            
        }

        else if(R_AreaCode=3)
        {
            error("잊혀진숲으로 이동")
            MouseClickDrag, left, 1086, 483, 644, 141


        }

        else if(R_AreaCode=4)
        {
            error("검은바위산 지역으로 이동")
            MouseClickDrag, left, 200,300, 200, 650

        }

        else if(R_AreaCode=5)
        {
               error("성채지역으로 이동") ;// 사실 이동은 없어두 댐
               ;MouseClickDrag, left, 200,300, 200, 650
        }
    }


    else if(maptype = "dungeon")
    {
        error("던젼지역이동 ")
        if(AreaCode=1)
        {
            error("골렘언덕  이동")
            MouseClickDrag, left, 1070, 210, 20,700
        }

        else if(AreaCode=2)
        {
            error("추락자의 사막 이동")
            MouseClickDrag, left, 450, 360, 690,260

        }

        else if(AreaCode=3)
        {
            error("잊혀진숲으로 이동")
            MouseClickDrag, left, 1086, 483, 644, 141


        }

        else if(AreaCode=4)
        {
            error("검은바위산 지역으로 이동")
            MouseClickDrag, left, 200,300, 200, 650

        }

        else if(AreaCode=5)
        {
               error("성채지역으로 이동") ;// 사실 이동은 없어두 댐
               ;MouseClickDrag, left, 200,300, 200, 650
        }
    }

}
return



티켓확인(ByRef value)
{
    ImageSearch,PosX,PosY, 1, 1,FullX,FullY, *50 %A_ScriptDir%\이미지\레이드_티켓부족.bmp
    if ErrorLevel=0
    {

        if (isInfinity = 1)  ;; 무한반복시키기
        {  
            ;msgbox 티켓부족 확인 눌러야 한다
            error("무한모드라 티켓 없다면 return값 6818 돌려줍니다")
            error("티켓 부족 클릭 합니다")
            버튼클릭("티켓부족_확인.bmp")
            ;msgbox 티켓부족
            value:=6818
            return %value%
        }

    ;///테스트 코드 자기 전에 지우고 자자 티켓 부족시에 
        else
        {
            error("티켓 부족하지만 무한모드가 아니라 그냥 종료")
            버튼클릭("티켓부족_확인.bmp") 
            reload  ; 티켓부족 확인하고 종료한다
            ;reload
            return 0

        }
    }
    Else
    {
        
        error("티켓 부족하지 않음")
    }
    return 0
}


미궁:

;msgbox %isInfinity% ID
Count=0
error("미궁 매크로 시작합니다")
Loop
{
; 주의사항 ** 미궁 도전 화면에서 시작해야 한다 도우미 설정등 끝나고 해도 된다
; 알고리즘 설명
; 미궁도전 버튼 이미지 서치 후, 해당 좌표 클릭으로 확인 창 2초간 딜레이 준후 미궁 시작함.
; 에러 발생시 텍스트 출력
; 임시    Sleep, 5000
Sleep, 1000

    ImageSearch,PosX,PosY, HalfX , HalfY,FullX,FullY, *50 %A_ScriptDir%\이미지\미궁도전_버튼.bmp
    if errorlevel=0
    {
;//스ㅜ정해라
        MouseClick, left, %PosX%, %PosY%
        error("미궁 도전 버튼 찾음")

        ;msgbox %isTicket%

        ;if (isInfinity = 1)  ;; 무한반복시키기
        ;{  
         ;   error("무한모드라 티켓 안사고 던젼으로 감")
          ;  큰확인버튼클릭()
          ;  gosub 보스방나가기
          ;  gosub 메인창
          ;  던젼함수()  ;; // 메인창으로 나간후에 그냥 
          ;  return
        ;}

;///테스트 코드 자기 전에 지우고 자자 티켓 부족시에 
        ;else
        ;{

        ;}
        Sleep, 1000
        ImageSearch,PosX,PosY,(HalfX/2), HalfY ,FullX,FullY, *30 %A_ScriptDir%\이미지\미궁시작확인_버튼.bmp
        if errorlevel=0
        {

            MouseClick, left, %PosX%, %PosY%
            error("미궁 시작 확인 버튼 누름")
            Sleep, 2000
            isTicket=0
            error("티켓 확인")
            티켓확인(isTicket)
            if isTicket=6818
            {
            ;    msgbox 티켓 6818
                error("무한 모드라 티켓 없으니 던젼함수로 되돌아간다")
                gosub 보스방나가기
                ;gosub 메인창
                던젼함수()  ;; // 메인창으로 나간후에 그냥 
            
                return
            }
            Else
            {
                
            }
            
            Sleep, 10000   ;미궁 시작후 딜레이 줘야겠지
            error("미궁 진입합니다~~")
            goto, 미궁진행체크    
            ;return          
            return 
        }
        else if errorlevel=2
        {
            error("미궁 시작 확인 버튼 이미지없음")
        }
        else 
        { 
            error("미궁 시작 확인 버튼 못찾음")
        }

    }

    else if errorlevel=2
    {
      error("미궁 도전 버튼 이미지없음")
    }


    else
    {
    ;       error("****미궁 도전 버튼 못 찾음 미궁 매크로 정지 합니다 `*****F5로 재실행 하세요")
    ;       return

    }



  
    ;============업적 보상창 떠있는건 아닌지 확인해본다

    ;gosub, 업적창날림

    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\이미지\업적_보상.bmp
    if errorlevel=0
    {
        error("업적 화면 찾음")
        MouseClick, left, %PosX%, %PosY%
    }   
    else if errorlevel=2
    {
        error("업적 보상 이미지없음")  
    }
    else 
    { 
        if(Count = 10)
        {
            error("업적보상 아이콘 못찾음")
        Count=0
        }
        else
        {
            Count+=1
        }
    }

}



미궁진행체크:

; 알고리즘 -> 미궁 진행 종료시 이미지 "도전 종료" 이미지 픽셀 체크후, errorlevel=0 (확인시) 종료버튼 클릭 후
; 3초 쉰 후에 확인 버튼 클릭으로 루프문 종료 
; 이후 다시 미궁 도전 시작 화면으로 돌아온다
Count=0
Loop
{
    Sleep, 1000

    ;//이미지 동일하여 던젼 탐험 성공 이미지 차용
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\이미지\탐험성공_성공_홈버튼.bmp
    if errorlevel=0
    {
    error(" 미궁 탐험 종료 홈버튼 이미지 확인함")
    Sleep,4000
    ;미궁 진행 종료 확인에 0.5초 확인 버튼에 3초 딜레이 둠
    MouseClick, left, HalfX, HalfY

    Sleep,4000
        ImageSearch,PosX,PosY, (HalfX/3) *2, (HalfY/3) * 4,FullX,FullY, *50 %A_ScriptDir%\이미지\미궁_종료_확인.bmp
        if errorlevel=0
        {
        ;             error %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%,3
        error("미궁 종료 확인 버튼 팝업")
        Sleep, 1500
        MouseClick, left, %PosX%, %PosY%
        error("미궁 종료 확인 버튼 누름")
        Sleep, 5000
        goto 미궁
        Break           

        }
        else if errorlevel=2
        {
        error("미궁 종료 확인 이미지 없어용")
        ;           Break
        }
        else
        { 
        error("미궁 진행 종료 확인 버튼 못찾음")
        ;                   Break

        }   

    }
    else if errorlevel=2
    {
    error("미궁 종료 확인 이미지 없어용")
    ;       Break
    }
    else 
    { 

    }

    if ( Count= 10)
    {
    gosub 친구소환
    error ("미궁 진행 10초 후 친구 소환")
    Count+=1
    gosub, 자동전투체크

    }
    else if ( Count = 300 )
    {
    gosub 친구소환
    error ("최초 소환 후 5분마다 친구 소환")
    Count = 11
    }

    else
    {
    Count+=1

    }

}
return





모험하기:
Loop, 10
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *30 %A_ScriptDir%\이미지\모험하기_버튼.bmp
    if errorlevel=0
    {
    ;   msgbox %PosX% %PosY%
    MouseClick, left, %PosX%, %PosY%
    error("모험하기 버튼 클릭 했습니다. 3초후 함수 종료")
    Sleep, 3000
    break
    }

    else if errorlevel=2
    {
    error("모험버튼.bmp 없네요 없어용")
    ;   return
    }   



    else
    {
    error("모험 버튼 위치 못찾구 있음")

    ;   return
    }
    Sleep, 1000
}
return




;===============여기서부터 제대로 수정이다 0723오후 버젼임

보스방:   ;;0723 완료
Count=0
aCount=0
Loop, 50
{
;;;; 수정하고 Sleep 필수
;상길 Sleep, 5000
;Sleep, 3000

;msgbox 보스방
    ;====================================수정 소스  이하 =============================
    업적창날림()

    
    ;     ImageSearch,PosX,PosY, 1 , 100 , FullX,FullY, *40 %A_ScriptDir%\이미지\보스방_아이콘.bmp
    ImageSearch,PosX,PosY, FullX/3 * 2= , 10 , FullX,FullY, *50 %A_ScriptDir%\이미지\보스방_아이콘.bmp
    if errorlevel=0
    {
        ;if (isInfinity = 1)  ;; 무한반복시키기
        ;{  
        ;    error("무한모드라 신발 사지 않고 나옴")
        ;    큰확인버튼클릭()
        ;    gosub 보스방나가기
        ;    gosub 메인창
        ;    미궁함수()  ;; // 메인창으로 나간후에 그냥 
        ;    return
        ;}

        ;msgbox %PosX% %PosY%
        MouseClick, left, PosX+5, PosY+5
        Sleep, 1000
        ;;상길꼭보자   goto 장비확인창
        error("신발 부족한지 체크함수 이동")
        gosub 신발부족
        ;/////////0725에 수정 한거 신발 부족하면 신발 사오고 원래 프로세스대로 간다
        gosub 장비확인창

        ;return
        break
    }

    else if errorlevel=2
    {
    ;       error("보스방 아이콘 이미지 없음")
    ;msgbox "보스방"
    }

    else 
    {
    ;       error("보스방 아이콘 못찾음")
    ;msgbox 보스방 아이콘 못찾어 
        ;Count+=1
        error("보스방에서 문제 있는듯 해 보임 Count " %Count%)
        if (Count0 = 20)
        {
            error("보스방에서 문제 있는듯 해 보임 Count " %Count%)
           Count=0
        ;           MouseClick, left, FullX/2 ,HalfY/4
        }

        else
        {
        }


    }

    ;============업적 보상창 떠있는건 아닌지 확인해본다

/*
    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\이미지\업적_보상.bmp
    if errorlevel=0
    {
      error("업적 화면 찾음")
      ;       msgbox %PosX% %PosY%
       MouseClick, left, %PosX%, %PosY%

    }   
    else if errorlevel=2
    {
       error("업적 보상 이미지없음")  
    }
    else 
    { 
        if(aCount = 10)
        {
         error("던젼 업적보상 아이콘 못찾음")
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
error("!!!!!!!!!!!!!!!심각!!!!!!!!!")
error("던젼 보스방 아이콘 못찾고 루프문 중료")
;보스방나가기()
;던젼함수()
;
gosub 보스방
return



;;미궁 이미지 못 찾을시 업적 화면은 아닌지 확인해보자





;==========장비창으로 가라는 메시지가 떳는지 안떳는지 확인부터 하는 것이라 대부분 버튼 못찾는 리턴값 돌려줄 거다 
장비확인창:   ;;0723 완료
Loop, 5
{

    ImageSearch,PosX,PosY,HalfX/3,HalfY,FullX,FullY, *30 %A_ScriptDir%\이미지\던젼_진입전_장비창_풀.bmp
    if errorlevel=0
    {
        error("장비창 풀이라 장비 판매하러 갑니다")
        ;       error("장비확인창 %PosX% %PosY%")
        MouseClick, left, %PosX%, %PosY%
        error("장비확인창 클릭 완료") ; ==%PosX% %PosY%")
        Sleep, 5000

        장비정리()
        ;;//////장비 정리 끝난후 ESC로 장비창닫기
        Send {Esc}
        Sleep, 2500
        gosub 보스방       
        ;Return
        break
    }

    else if errorlevel=2
    {
        error("장비창 이미지 없어용")
        Break
    }

    else        
    {
    ; 
    ;       error("장비창 가기 버튼 못찾음")
    }
    Sleep, 500
}
goto 친구선택
return






친구선택:    ;;0723 완료
isFriendEmpty=0
aCount=0
Loop
{
;     ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\이미지\친구선택_사용완료.bmp
    ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\이미지\친구선택_버튼.bmp
    if (errorlevel=0) || (isFriendEmpty = 1)
    {

        MouseClick, left, %PosX%, %PosY%
        ;         Sleep, 500
        error("친구선택 창 -> 입장 프로세스 ")



        ImageSearch,PosX,PosY, HalfX/3 * 2  , HalfY/3 * 5 + 20, FullX, FullY, *30 %A_ScriptDir%\이미지\친구선택_입장하기.bmp
        if (errorlevel=0) || (isFriendEmpty = 1)
        {

        ;=======친구선택후 던젼 입장버튼 누른 후


         Loop , 6  ;// 요짓꺼리 하는 이유가 친구 입장시 버튼 여러번 연타하면 우정 2배로 주는 버그 있었음
         {
                MouseClick, left, %PosX%, %PosY%
                Sleep, 500
         }
         error("친구선택-> 입장 프로세스 -> 입장버튼 까지 클릭 완료")


           ;                  Sleep, 6000  ;로딩 시간 감안해서

         gosub 친구확인창
          ;             gosub 던젼진행사항체크
         ;return          
         break

        }
        else if errorlevel=2
        {
            error("친구선택_입장 확인 이미지 없어용")
            Break
        }
        else
        { 
            error("친구선택_입장 확인 버튼 못찾음")
            Break
        }   

    }

    else if errorlevel=2
    {
        error("친구선택_입장하기 이미지 없어용")
        Break
    }
    else 
    {


        ;========= 친구는 다 쓴건 아닌지 확인해 본다
        ImageSearch,PosX,PosY, 1 ,80 ,FullX,FullY, *50 %A_ScriptDir%\이미지\친구선택_사용완료.bmp
        if errorlevel=0
        {
            error("!!!!친구 모두 사용 한 듯!!!!!")
            ;             MouseClick, left, %PosX%, %PosY%
            isFriendEmpty=1
            error("친구 선택 없이 던젼 들어간다")
        }   
        else if errorlevel=2
        {
            error("친구선택_사용완료 이미지없음")  
        }
        else 
        { 
           if(aCount = 10)
            {
                error("친구선택_사용완료 아이콘 못찾음")
                aCount=0
            }
            else
            {
                aCount+=1
            }
          
        }


        ;==========
        error("친구선택 버튼 못 찾음")
    }         


}
return



던젼진행사항체크:   ;;0723 완료
Count=0
Loop
{

    Sleep,300

    ;   ImageSearch,PosX,PosY,1,1 ,FullX,FullY, %A_ScriptDir%\이미지\탐험성공_성공_텍스트.bmp
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\이미지\탐험성공_성공_홈버튼.bmp
    if errorlevel=0
    {

        error("탐험 성공 체크 완료 ")
        Sleep,300
        ;탐험 성공후에 보상창 나오도록 딜레이 걸어둠

        MouseClick, left, %PosX%, PosY-100
        Sleep, 2000

        error("던전 모험 보상 확인")
        버튼클릭("던전_모험보상_확인.bmp")
        Sleep, 6000
        gosub 보스방
        

    }


;/////////던전실패시체크도 필요함

       ImageSearch,PosX,PosY,HalfX/3, 50 ,FullX,FullY, *30 %A_ScriptDir%\이미지\던젼탐험_실패.bmp
       if errorlevel=0
       {
            error("던젼 실패하였습니다.")
            MouseClick, left, %PosX%, %PosY%
            Sleep, 6000

;//// 던전 보상 누르고 일반 화면 으로 넘어가는 시간 체크하자 
            ;MouseClick, left, HalfX, HalfY%PosX%, %PosY%
            ;Sleep, 4000
            loop 
            {
                버튼클릭("던젼탐험실패_확인.bmp", HalfX/3)
                버튼클릭("던전_모험보상_확인.bmp" HalfX/3)
                error("던젼 실패 후보스방 함수 호출")
                Sleep, 500
            }
            goto 보스방
            return
        }

       else if errorlevel=2
        {
           error("던젼실패 확인 홈 이미지 없어용")
           Break
        }

        else
        {
            ;error("던젼 실패 확인 버튼을 못찾아요")
        }

;===========================동료 획득시 확인 창=============================

    ImageSearch,PosX,PosY,1, 1 ,FullX,FullY, *50 %A_ScriptDir%\이미지\동료획득_습니다.bmp
    if errorlevel=0
    {
        error("동료획득했습니다 텍스트 체크")
        Sleep, 2000
        ImageSearch,PosX,PosY,HalfX/2, (HalfY/3) *4 ,FullX,FullY, *20 %A_ScriptDir%\이미지\동료획득_확인버튼.bmp
        if errorlevel=0
        {
            error("동료획득 하였습니다")
            MouseClick, left, %PosX%, %PosY%
            ;           Sleep, 6000   



        }  

        else if errorlevel=2
        {
          error("동료 확인 홈 이미지 없어용")
        ;       Break
        }
        else 
        { 

            error(음 여기 올수가 없어 동료획득시 처리 문제임 심각한 문제임!)
            ImageSearch,PosX,PosY,HalfX/2,HalfY ,FullX,FullY, *20 %A_ScriptDir%\이미지\동료_확인_버튼_small.bmp      
            if errorlevel=0
            {
            error("!!!!!!!!!!!동료획득확인 %PosX% %PosY%")  ;상길아
            MouseClick, left, %PosX%, %PosY%
            Sleep, 6000

            MouseClick, left, HalfX, HalfY
            Sleep, 3000

            }
            else if errorlevel=2
            {
            error("동료 확인 버튼 없어염")
            }
            else 
            { 
            }

    ;       error(음 아무것도 못찾네   ; 동료 획득 메시지 보고 못찾으면 문제 있는 거임)
       }

    }

    else if errorlevel=2 ;; 뭐 이것도 이벤트라 없을가능성이 잇어서 로그 남기기 힘듬
    {
        error("동료_습니다 이미지 없네요")
    }

    else  ;; 뭐 이것도 이벤트라 없을가능성이 잇어서 로그 남기기 힘듬
    {
    ;       error(동료_습니다 못찾음)
    }


    if ( Count = 10 )
    {
        gosub 친구소환
        Count+=1
        gosub, 자동전투체크
        ;count=0
    }

    else if ( Count = 301 )
    {
        gosub 친구소환
        error ("최초 소환 후 5분마다 친구 소환")
        Count = 11
    }
    else
    {
        Count+=1
    }
;==========================던젼 종료 확인=====================
}
error("!!!완전 문제임!!던전종료 return") ; ===========이리로 오게 되는 상황이 말이 안대는거임
return


=-=============================================체크


친구확인창: ;0723확인
error("친구 확인창 진입")
Loop, 8
{
    ;   친구선택안댐_체크

    ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\이미지\친구선택안댐_체크.bmp
    if errorlevel=0
    {
        error("친구 선택이 안됨")

        ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\이미지\친구선택안댐_확인_버튼.bmp
        if errorlevel=0
        {
            ;   error %PosX%, %PosY%
            error("친구 선택 안된채로 던젼 출발함")
            MouseClick, left, %PosX%, %PosY%
            ;;gosub 친구소환
            ;error("친구소환 완료 했구요 ->던젼진행 체크합니다")
            error("던젼 진입 단계 모두 완료! ->던젼 진행 체크합니다")
            gosub 던젼진행사항체크
            ;return
            break
        }
        else if errorlevel=2
        {
            error("친구 선택 안템 확인 이미지 없어용")
        ;       Break
        }

    }

    else if errorlevel=2
    {
        error("친구선택안댐_체크 이미지 없어용")
        ;       Break
    }

    else        
    {

    }

    Sleep, 500

}
error("친구 없을시 확인창 없이 정상적으로 친구소환->던젼체크 진입")
;gosub 친구소환
gosub 던젼진행사항체크
error ("던젼 진입합니다")
return



친구소환: ;0723
{

    ;Sleep, 10000

    PosX=0
    PosY=0

    PosX:= HalfX + ( HalfX / 30 ) * 3
    PosY:= HalfY / 4


    MouseClick, left, %PosX%, %PosY%

    error("친구 소환 완료입니다!! ")


    Sleep, 1000

    return
}


자동전투체크:
{
    ImageSearch,PosX,PosY,1,(HalfY/2) *3,FullX,FullY, *30 %A_ScriptDir%\이미지\auto_off.bmp
    if errorlevel=0
    {
        error("자동 전투 꺼져 있음")
        MouseClick, left,  %PosX%, %PosY%

        error("자동 전투 클릭 완료")
        return

    }

    else if errorlevel=2
    {
    error("auto_off.bmp 없어요")
    return
    }

    else        
    {
    return

    }
}


신발부족:
Loop, 10
{

    ImageSearch,PosX,PosY,HalfX/2,(HalfY/3) ,FullX,FullY, *30 %A_ScriptDir%\이미지\신발부족.bmp

    ;//자기전에 지우자 
    ;errorlevel=0
    if errorlevel=0
    {
        error("신발 다썼네요.")
        MouseClick, left,  %PosX%, %PosY%
        if (isInfinity = 1)  ;; 무한반복시키기
        {  
            ;Sleep, 
            ;loop ,3
            ;{  
                error("신발 없고 isInfinity=1 입니다")
                error("무한모드라 신발 사지 않고 나옴")
                버튼클릭("신발부족_확인.bmp")
                gosub 보스방나가기
                ;gosub 메인창
                미궁함수()  ;; // 메인창으로 나간후에 그냥 
                ;레이드함수()
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
            error("신발 구입하러 갑니다")


            ImageSearch,PosX,PosY,HalfX/2,HalfY, FullX,FullY, *30 %A_ScriptDir%\이미지\신발부족_확인.bmp
            if errorlevel=0
            {
                error("신발부족 확인창 클릭")
                MouseClick, left,  %PosX%, %PosY%
                gosub 보스방나가기
                gosub 메인창
                ;             MainScreen()
                ;             상점()
                gosub, 상점
                ;gosub, 신발구입
                ;;;;;;;;;;;;;상길수정 신발구입 상점
                ;;            gosub 내던젼
                ;;이미여기서 홈화면 임
                
                던젼함수()  ;//던젼 함수는 메인화면에서 던젼까지 알아서 진입이다
                return
                ;break
            }
            else if errorlevel=2
            {
                error("신발부족확인.bmp 없어용")
            }
            else
            {
            }

        }


        else ; isBuyShoes 신발 구입 안한다
        {
            error("신발 구입 없이 던젼 종료 합니다")
            return
            ;break
        }

    }


    else if errorlevel=2
    {
        error("신발부족.bmp 없어요")
        return
        ;break
    }

    else        
    {
        error("신발 아직 여유 있어서 신발 체크 넘어서->>장비 확인")
        ;goto 장비확인창
        return
        ;break

    }
    Sleep, 300
}
return

보스방나가기:
{
    Loop,10
    {

        ImageSearch,PosX,PosY,1 ,(HalfY/3) * 4 ,FullX,FullY,  *30 %A_ScriptDir%\이미지\나가기_버튼.bmp
        if errorlevel=0
        {
            ;msgbox %PosX% %PosY%
            error("보스방-> 맵 나가기 버튼찾았구요.")
            MouseClick, left,  %PosX%, %PosY%
            error("나가기 버튼 클릭 ")

        }

        else if errorlevel=2
        {

          error("나가기_버튼.bmp 없어요")
        ;       return
        }

        else        
        {
           error("나가기 버튼 아이콘 찾을 수 없으니 return시킴")
        ;       return

        }

        ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *30 %A_ScriptDir%\이미지\모험하기_버튼.bmp
        if errorlevel=0
        {
           error("모험하기 버튼 있는것을 보아하니 메인화면입니다")
        ;     MouseClick, left, %PosX%, %PosY%
        ;
            ;return
            break
        }   
    Sleep, 1000
    }

}
;MainScreen()
error("보스방 나가기 실패 ")
;goto, 메인창
return





업적창날림()  
{

    ImageSearch,PosX,PosY, 1 , 1,FullX,FullY, *50 %A_ScriptDir%\이미지\업적_보상.bmp
    if errorlevel=0
    {
        error("업적 화면 찾음")

        ;msgbox %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        error("업적 화면 날림")
        return
    }   
    else if errorlevel=2
    {
        error("업적 보상 이미지없음")  
    }
    else 
    { 
        ;if(Count = 10)
        ;{
            error("업적보상 아이콘 못찾음 Count ", %Count%)
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
업적창날림:  ;;;
{

    error("업적창 떠  있는지 확인 ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *30 %A_ScriptDir%\이미지\업적_보상.bmp
    if errorlevel=0
    {
        error("업적 화면 찾음")
        MouseClick, left, %PosX%, %PosY%
        error("업적 화면 날림")
        return
    }   
    else if errorlevel=2
    {
        error("업적보상 보상 이미지없음")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("업적보상 아이콘 못찾음")
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

이벤트페이지날림:
{
    error("이벤트 페이지 있는지 확인 ")


    ;큰확인버튼클릭()
    버튼클릭("이벤트페이지_확인.bmp")


    return
    ;
    ;ImageSearch,PosX,PosY, 1, HalfY/3, FullX,(FullY/5) * 7, *30 %A_ScriptDir%\이미지\큰확인버튼.bmp
    if errorlevel=0
    {
        error("이벤트 화면 찾음")
        MouseClick, left, %PosX%, %PosY%
        error("이벤트 화면 날림")
        return
    }   
    else if errorlevel=2
    {
        error("확인버튼.bmp 이미지없음")  
    }
    else 
    { 
         error("이벤트 페이지 못찾음")
        if(Count = 10)
        {
        ;        error("업적보상 아이콘 못찾음")
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


레이드재도전창날림:  ;;; //
{
    error("레이드 재도전창 있는지 확인 ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *30 %A_ScriptDir%\이미지\레이드_재도전.bmp
    if errorlevel=0
    {
        error("레이드 재도전 화면 찾음")
        ;     MouseClick, left, %PosX%, %PosY%

        gosub, 취소버튼클릭
        ;gosub, 확인버튼클릭
        버튼클릭("확인버튼.bmp")

        ;;상길 여기 보자 취소 확인 왜 두개있지?? 테스트용인가
        ;;확인해보니  모르겠넹 ㅎ

        error("레이드 재도전 화면 날림")
        return
    }   
    else if errorlevel=2
    {
     error("레이드_재도전.bmp 이미지없음")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("레이드_재도전.bmp 아이콘 못찾음")
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





;============ 메인창으로 이동하는 용도이다. 상길수정할건 레이드 완료시에 취소, 확인처리 =======
;============ 기본적으로 특별 구매 창 제거하는것이 목적이다=================
;MainScreen(1)
메인창:
Loop, 3
{
;msgbox aaa
    ;   업적창날림()
    ;gosub, 업적창날림
    업적창날림()
    gosub, 레이드재도전창날림
    gosub, 이벤트페이지날림

    ImageSearch,PosX,PosY,Half/3  ,(HalfY/3) * 4 ,FullX,FullY, *30 %A_ScriptDir%\이미지\특별구매창_취소_구매.bmp
    if errorlevel=0
    {
        error("!!!!!!!!!!특별구매창이 떴습니다~~!!!!!!!!!!!")

        ImageSearch,PosX,PosY,HalfX/3,(HalfY/3) * 4, FullX,FullY, *30 %A_ScriptDir%\이미지\특별구매_취소.bmp
        if errorlevel=0
        {
            ;error("특별구매창 취소 찾았습니다")
            MouseClick, left,  %PosX%, %PosY%
            error("특별구매창 취소 버튼 클릭 완료")
            ;         Sleep, 2000 ;///특별구매 취소버튼 누르고 창 뜨는 시간 대기


            sleep, 2000
            ;;///////특별 구매 취소 -> 확인까지

            Loop
            {   

                ImageSearch,PosX,PosY,HalfX/3,HalfY, FullX,FullY, *30 %A_ScriptDir%\이미지\특별구매_마지막체크.bmp
                if errorlevel=0
                {
                    error("특별구매창 마지막 확인 메시지 떴네요~ `n `3'구매 안해요~~신발사러 갈꺼야!")
                    MouseClick, left,  %PosX%, %PosY%
                    error("특별구매창 마지막 구매 안함(취소) 클릭 완료")

                    ;return

                }
                else if errorlevel=2
                {
                    error("특별구매_마지막체크.bmp 없어용")
                }

                else
                {
                    error("특별구매창 버튼 맞찾음")
                    error("!!!!!!!!!!!!!루프문에 빠졌습니다")
                    break
                }

          }   

        }

        else if errorlevel=2
        {
            error("특별구매_취소.bmp 없어용")
        }

        else
        {   

        }


        Count+=1

        if(Count > 200)
        {
           error("창 못찾고 난리다 정말 구매 안하고 싶은데")

        }   
        Sleep,100
    ;////특별 구매 취소 종료
    }


    else if errorlevel=2
    {

      error("특별구매창_취소_구매.bmp 없어요")
    ;       return
    }

    else        
    {
    ;       error("특별구매창 안뜬듯")

    }   


    ;   error("보스방-> 맵 나가기 버튼찾았구요.")
    ;   MouseClick, left,  %PosX%, %PosY%
    ;   error("나가기 버튼 클릭 ")


    Sleep, 200

}
return





상점:
{

    Loop,10
    {
    ;   error("상점진입  ")

        ImageSearch,PosX,PosY,HalfX ,HalfY ,FullX,FullY,  *30 %A_ScriptDir%\이미지\메인_상점버튼.bmp
        ;   ImageSearch,PosX,PosY,1 ,1 ,FullX,FullY,  *30 %A_ScriptDir%\이미지\메인_상점버튼.bmp
        if errorlevel=0
        {
            error("메인화면_상점 버튼 찾았습니다.")
            MouseClick, left,  %PosX%, %PosY%
            error("상점 버튼 클릭 ")

            ;상점 클릭후 최초 팝업 이벤트용으로 대기해야함
            Sleep , 2000  
            ;/////////////////////



            ;////////최초 구매 팝업 루프 돌려서 확인한다
            Loop, 5
            {
            ;;상길 필수 ========업데이트,패치 후 이미지 변경 꼭 필요함 ==============
                error("상점 선택후 팝업창 대기함")

                ImageSearch,PosX,PosY,1,1, FullX,FullY, *30 %A_ScriptDir%\이미지\최초구매팝업_0729.bmp
                if errorlevel=0
                {
                    error("!!!!!!!!!최초구매창 팝업입니다 무시합니다!!!!!!")
                    ;             MouseClick, left,  %PosX%, %PosY%
                    error("특별구매창 마지막 구매 안함(취소) 클릭 완료")

                    ;=====================최초구매 확인 창 클릭

                    ImageSearch,PosX,PosY,1,HalfY, FullX,FullY, *30 %A_ScriptDir%\이미지\최초구매창확인.bmp
                    if errorlevel=0
                    {
                        error("!!!!!!!!!최초구매창 확인하고 나갑니다!!!!!!")
                        MouseClick, left,  %PosX%, %PosY%
                     error("최초구매창 확인 클릭 완료`n 창사라짐")


                        ;///상길 여기도 수정하자 필수
                        error("최초구매창 없이 여기 오면 안좋은거임!!!!!!!!")
                        ;             gosub 신발구입
                        ;return
                        break

                    }
                    else if errorlevel=2
                    {
                    error("최초구매창확인 bmp 없어용")
                    }

                    else
                    {
                    error("최초구매창확인 bmp 위치를 찾을수가 없어용")
                    }

       ;=====================최초구매창 닫기




                }
                else if errorlevel=2
                {
                    error("최초구매팝업_0729 bmp 없어용")
                }

                else
                {
                    error("최초구매팝업이 없는 듯 하니 신발 구입 해야죠")
                    if(BuyOption=1)
                    {
                        error("신발 구입 옵션있네요")
                        gosub 신발구입
                    }
                    else if (BuyOption=2)
                    {
                        error("구입 옵션 뭘까요~")

                    }
                    ;return
                    break
                }

    ;=========팝업 이미지  종료 함

            Sleep, 1000
            }



         }

        else if errorlevel=2
        {

        error("메인_상점버튼.bmp 없네요")
        ;       return
        }

        else        
        {
        error("메인_상점버튼.bmp 아이콘 찾을 수 없으니 return시킴")
        ;       return

        }   

    sleep,1000
    }
    ;msgbox "상점진입 실패 ㅠㅠ"
return
}


신발구입:
Loop, 5
{
    error("신발 구입창 진입")
    ImageSearch,PosX,PosY,HalfX/3 ,1 ,FullX,FullY, *30 %A_ScriptDir%\이미지\신발과티켓_상점.bmp
    if errorlevel=0
    {
    ;msgbox %PosX% %PosY%
        error("신발과 티켓 구입창 찾음")
        MouseClick, left,  %PosX%, %PosY%
        error("신발과 티켓 구입창 클릭 ")
    ;신발 20개 구입  할거야===========시작
    ;신발 20개구이 완료
    }

    else if errorlevel=2
    {

        error("신발과티켓_상점.bmp 없어요")
    ;       return
    }

    else        
    {
    ;       error("신발과티켓_상점.bmp 위치 확인 불가")
    ;       return

    }    ;//////////신발티켓  버튼 누름


;//////////////////신발 20개 화면이면 구입한다

    ImageSearch,PosX,PosY,HalfX ,1 ,FullX,FullY, *30 %A_ScriptDir%\이미지\신발과티켓_신발20개.bmp
    if errorlevel=0
    {
        error("신발 20개 bmp 위치찾았어요")
        MouseClick, left,  %PosX%, %PosY%
        error("구입 버튼 누름 ")

        Sleep, 2000
        error("확인버튼 클릭")
        버튼클릭("확인버튼.bmp")
        ;
        ;gosub, 취소버튼클릭

        error("ESC두번 눌러서 메인 화면으로 나올꺼에요")
        Loop, 2
        {
            Sleep, 1000
            Send {ESC}
        }
        error("신발 20개 구입완료")
        return

    }

    else if errorlevel=2
    {

      error("신발과티켓_신발20개.bmp 없어요")
    ;       return
    }

    else        
    {
    ;       error("신발과티켓_신발20개.bmp 위치 찾을 수 없음")
    ;       return

    }   
    Sleep, 500
}
return

취소버튼클릭:
Loop, 10
{
    ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\이미지\취소버튼.bmp
    if errorlevel=0
    {
        error("취소 버튼찾았구요.")
        MouseClick, left,  %PosX%, %PosY%

        error("취소 버튼 클릭 ")
        ;return
        break

    }

    else if errorlevel=2
    {
        error("취소버튼.bmp 없어요")
        ;return
        break
    }

    else        
    {
        error("취소버튼.bmp 위치 찾을 수 없음")
        ;       return

    }
    Sleep, 1000
}
return


버튼클릭(str,StartX=1, StartY=1)
{
    Loop, 2
    {
    ;   ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\이미지\확인버튼.bmp
        ImageSearch,PosX,PosY,StartX,StartY,FullX,FullY, *30 %A_ScriptDir%\이미지\%str%
        if errorlevel=0
        {

            error(str, " PosX", "  PosY")
            MouseClick, left,  %PosX%, %PosY%

            error(str, " 버튼 클릭 ")
            ;msgbox 버튼 찾고 확인누름
            ;msgbox %str%
        ;   msgbox %PosX% %PosY%
            ;return
            break

        }

        else if errorlevel=2
        {
            error(str, "  없어요")
            ;return
            break
        }

        else        
        {
            error(str, " 찾을수 없어요")
        ;       return

        }
        Sleep, 500
    }
}




;===========================던젼지역 나열


;RaidNum=1  
;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:코모도, 2:스톰 3:퓨리 4:블랙마운틴 5:데스크라운
;골렘언덕, 잊혀진숲, 추락자의사막, 검은바위산, 골렘언덕


;;랜딩가든 5-2  검은성채 4-5
;=====RaidNum
;  해당 지역 레이드입니다. 뭐 결론은 지금은 1번밖에 없음


레이드도전()
{
    loop, 10
    {
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\이미지\레이드신청.bmp
        if errorlevel=0
        {
        ;   msgbox %PosX% %PosY%
            error("레이드 도전 합니다")

            MouseClick, left, %PosX%, %PosY%
            Sleep, 1000
            버튼클릭("레이드확인_버튼.bmp")        

            ;return
            break
        }

        else if errorlevel=2
        {
            error("레이드 신청 후 확인 이미지 없어용")
        ;   return
        }   



        else
        {
           error("레이드신청 후 학인 이미지  있음")

        ;   return
        }
        Sleep, 500
    }
}


;;;;;;18

레이드진행상황체크()
{

    Loop
    {

        Sleep,300
        ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\이미지\레이드_탐험실패.bmp ;;레이드때는 이건 실패야
        if errorlevel=0
        {
            error("레이드 실패함 ")
            
            Sleep, 10000

            MouseClick, left, %PosX%, PosY-100
            ;레이드함수()
            ;return
            break
        }

        ImageSearch,PosX,PosY,HalfX/2, HalfY/2 ,FullX,FullY, *20 %A_ScriptDir%\이미지\레이드_물음표.bmp ;; 레이드 성공
        if errorlevel=0
        {
            error("레이드 성공함")
            ;;MouseClick, left, %PosX%, %PosY%
            Sleep, 10000

            ;//// 던전 보상 누르고 일반 화면 으로 넘어가는 시간 체크하자 
            ;           MouseClick, left, HalfX, HalfY
            ;               Sleep, 4000
            ;레이드함수()   ;//모든 상황 종료되었으니 메인창으로 
            ;return
            break

        }

    }  
}



;RGB
;0x9E37FF 보라색
;0x1A91FF 파란색
;0x24D25D 녹색
;0xFFFFFF 흰색

;BGR

;0xFF379E 보라색
;0xFF911A 파란색
;0x5DD224 녹색
;0xFFFFFF 흰색


;Button미궁돌리기:
;Sleep, 5000
;goto 미궁
;return

;Button보스방뺑뺑:
;Sleep, 5000
;goto 보스방
;return

;Button장비창정리:
;Sleep, 5000
;goto 장비정리
;return


;GuiClose:
;ExitApp
;return



















