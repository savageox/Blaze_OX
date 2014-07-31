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

global DungeonFinish=0   ;// 던젼이 정상적으로 끝났는지 체크한다  1이 완료,  던젼진행사항체크 함수에서 무한루프로 확인

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
;goto 미궁
미궁함수()
return

F2::
;SetGenySize()
;등급판매("흰색_아이템.bmp")
;goto 던젼진행사항체크
goto 모험하기
return

F3::
;업적창날림()
;티켓확인(12)
레이드함수()
;레이드맵선택()

return

F4::
;ResizeWin(0,0)
;error("F4 Test")


error("보스방 뺑뺑이 갑니다")
;goto 던젼함수

;테스트()
던젼함수() ;//이름 좀 바꿔야할듯 
;goto 친구선택

return

F5::
ResizeWin(0,0)

;error("신발 구입 테스트")


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


지역이동(maptype="dungeon")  
{
    error("지역이동 함수로 진입 완료", %maptype%)
    Sleep, 1000
    if(maptype = "raid")
    {
        if(R_AreaCode=1)
        {
            error("골렘언덕  이동")
            ;MouseClickDrag, left, 1070, 210, 20,700
            좌표이동("NE")
            Sleep,100
        }

        else if(R_AreaCode=2)
        {
            error("추락자의 사막 이동")
            ;MouseClickDrag, left, 450, 360, 690,260
            좌표이동("SW")
            Sleep,100
            MouseClickDrag, left, 200,480, 200, 360



        }

        else if(R_AreaCode=3)
        {
            error("잊혀진숲으로 이동")
            ;MouseClickDrag, left, 1086, 483, 644, 141
            좌표이동("SE")
            Sleep,100
            MouseClickDrag, left, 792,330, 1100, 270


        }

        else if(R_AreaCode=4)
        {
            error("검은바위산 지역으로 이동")
            ;MouseClickDrag, left, 200,300, 200, 650
            좌표이동("NW")
            Sleep,100
            MouseClickDrag, left, 270,140, 145, 120


        }

        else if(AreaCode=5)
        {
            error("성채지역으로 이동") ;// 사실 이동은 없어두 댐
            ;MouseClickDrag, left, 200,300, 200, 650
            좌표이동("NW")
            Sleep,100
            MouseClickDrag, left, 600, 600, 210, 270

        }
    }


    else if(maptype = "dungeon")
    {
        sleep, 500
        error("던젼지역이동 ")
        if(AreaCode=1)
        {
            error("골렘언덕  이동")
            ;MouseClickDrag, left, 1070, 210, 20,700
            좌표이동("NE")
            Sleep,100
        }

        else if(AreaCode=2)
        {
            error("추락자의 사막 이동")
            ;MouseClickDrag, left, 450, 360, 690,260
            좌표이동("SW")
            Sleep,100
            MouseClickDrag, left, 200,480, 200, 360



        }

        else if(AreaCode=3)
        {
            error("잊혀진숲으로 이동")
            ;MouseClickDrag, left, 1086, 483, 644, 141
            좌표이동("SE")
            Sleep,100
            MouseClickDrag, left, 792,330, 1100, 270


        }

        else if(AreaCode=4)
        {
            error("검은바위산 지역으로 이동")
            ;MouseClickDrag, left, 200,300, 200, 650
            좌표이동("NW")
            Sleep,100
            MouseClickDrag, left, 270,140, 145, 120


        }

        else if(AreaCode=5)
        {
            error("성채지역으로 이동") ;// 사실 이동은 없어두 댐
            ;MouseClickDrag, left, 200,300, 200, 650
            좌표이동("NW")
            Sleep,100
            MouseClickDrag, left, 600, 600, 210, 270

        }
    }

}
return


좌표이동(coordinate="NW")
{
    if(coordinate= "NW")
    {
        ;msgbox 111
        MouseClickDrag, left, 620,420, 1280, 750, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 1280, 750, 2

    }
    else if(coordinate="NE")
    {
        MouseClickDrag, left, 600,400, 0, 750, 2
        Sleep, 500
        MouseClickDrag, left, 600,400, 0, 750, 2
        
    }
    else if(coordinate="SW")
    {
        MouseClickDrag, left, 620,420, 1230, 20, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 1230, 20, 2
        
    }
    else if(coordinate="SE")
    {
        MouseClickDrag, left, 620,420, 20, 20, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 20, 20, 2    
    }
    Else
        error(coordinate)
    return
}

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
;            reload  ; 티켓부족 확인하고 종료한다
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
Loop, 50
{
    ;
    ;ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\이미지\모험하기_버튼.bmp ;//원래 쓰던거 0729
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *80 %A_ScriptDir%\이미지\모험하기_버튼.bmp
    ;ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\이미지\모험하기_버튼.bmp
    if errorlevel=0
    {
       ;msgbox %PosX% %PosY%
        MouseClick, left, %PosX%, %PosY%
        error("모험하기 버튼 클릭 했습니다. 3초후 함수 종료")
        Sleep, 3000
        break
    }

    else if errorlevel=2
    {
        error("모험 하기 버튼.bmp 없네요 없어용")
    ;   return
    }   



    else
    {
    error("모험 하기 버튼 위치 못찾구 있음")

    ;   return
    }
    Sleep, 300

}
;ㅠerror("모험하기 클릭 못하고 종료")
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
    ImageSearch,PosX,PosY, FullX/3 * 2= , 10 , FullX,FullY, *60 %A_ScriptDir%\이미지\보스방_아이콘.bmp
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
        Count+=1
        error("보스방에서 문제 있는듯 해 보임 Count ", %Count%)
        if (Count0 = 20)
        {
            error("보스방에서 문제 있는듯 해 보임 Count ", %Count%)
           Count=0
        ;           MouseClick, left, FullX/2 ,HalfY/4
        }

        else
        {
        }


    }
    업적창날림()
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
error("던젼 보스방 아이콘 못찾고 루프문 무한 반복")
gosub 보스방나가기
던젼함수()
;
;gosub 보스방
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
         return

        }
        else if errorlevel=2
        {
            error("친구선택_입장 확인 이미지 없어용")
            return ;Break
        }
        else
        { 
            error("친구선택_입장 확인 버튼 못찾음")
            return ;reak
        }   

    }

    else if errorlevel=2
    {
        error("친구선택_입장하기 이미지 없어용")
        ;msgbox 친구선택 이미지 없음
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

    if( DungeonFinish=1) ;/ 던젼 종료인것 체크 했을때
    {
        error("던젼 종료된 DungeonFinish Tru 확인되어 보스방 재 진입")
        DungeonFinish=0
        Sleep, 6000
        goto 보스방
        return
    }
    Else{}

    
    Sleep,300


    if( DungeonFinish=1) ;/ 던젼 종료인것 체크 했을때
    {
        error("던젼 종료된 DungeonFinish Tru 확인되어 보스방 재 진입")
        DungeonFinish=0
        Sleep, 6000
        goto 보스방
        return
    }
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
        CheckDungeonFinish()
        ;Sleep, 6000
        ;gosub 보스방
        ;goto 보스방
	
        

       

    }


;/////////던전실패시체크도 필요함

       ImageSearch,PosX,PosY,HalfX/3, 50 ,FullX,FullY, *30 %A_ScriptDir%\이미지\던젼탐험_실패.bmp
       if errorlevel=0
       {
            error("던젼 실패하였습니다.")
            MouseClick, left, %PosX%, %PosY% - 100
            Sleep, 6000

;//// 던전 보상 누르고 일반 화면 으로 넘어가는 시간 체크하자 
            ;MouseClick, left, HalfX, HalfY%PosX%, %PosY%
            ;Sleep, 4000
            loop, 20 
            {
                버튼클릭("던젼탐험실패_확인.bmp", HalfX/3)
                버튼클릭("던전_모험보상_확인.bmp" HalfX/3)
                error("던젼 실패 후보스방 함수 호출")
                Sleep, 500
                ;break
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
    loop, 4
    {
        error("이벤트 페이지 있는지 확인 ")


        ;큰확인버튼클릭()
        버튼클릭("이벤트페이지_확인.bmp")
    }

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


레이드초대창날림()  ;;; //
{
    error("레이드 재도전창 있는지 확인 ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *70 %A_ScriptDir%\이미지\레이드_재도전.bmp
    if errorlevel=0
    {
        error("레이드 재도전 화면 찾음")
        ;     MouseClick, left, %PosX%, %PosY%

        gosub, 취소버튼클릭
        ;gosub, 확인버튼클릭
        ;버튼클릭("확인버튼.bmp")

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
    레이드초대창날림()
    ;gosub, 레이드재도전창날림
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
                    break

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

            error(str) ;, % PosX, % PosY )
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





;;;;;;18





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



















;http://www.autohotkey.com/board/topic/25446-consolesend/
;http://www.autohotkey.com/board/topic/96895-libcon-autohotkey-library-for-console-support/
;http://v1.autohotkey.co.kr/
Gui,color,0x112233
Gui, Font, cWhite S11 w580      
Gui, Add, GroupBox, x12 y10 w280 h250 , »ç¿ë ¹æ¹ý
Gui, Add, Text, x22 y40 w250 h30 , F1: ¹Ì±Ã µ¹¸®±â
Gui, Add, Text, x22 y90 w250 h30 , F2: °¢Áö¿ª ¸¶Áö¸· º¸½º
Gui, Add, Text, x22 y140 w250 h30 , F3: ÀåºñÃ¢ Á¤¸® ** ½ºÅ©·Ñ »©³õÀ¸¼¼¿ä**
Gui, Font, cRed S11 w700
Gui, Add, Text, x22 y190 w250 h30 , **¸ÅÅ©·Î Á¾·á´Â F6ÀÔ´Ï´Ù**

Gui, Add, Picture, x12 y280 w280 h190 , %A_ScriptDir%\ÀÌ¹ÌÁö\\Ç±.jpg

; Generated using SmartGUI Creator 4.0
;Gui, Show, x127 y87 h482 w309, New GUI Windowd
;===================================GUI====================================


;===========================ÀÚÀßÇÑ ¼³Á¤µé===========================
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
;1:ÄÚ¸ðµµ, 2:½ºÅè 3:Ç»¸® 4:ºí·¢¸¶¿îÆ¾ 5:µ¥½ºÅ©¶ó¿î
;°ñ·½¾ð´ö, ÀØÇôÁø½£, Ãß¶ôÀÚÀÇ»ç¸·, °ËÀº¹ÙÀ§»ê, °ñ·½¾ð´ö

;=====Dungeon=====
;ÇØ´ç Áö¿ª¿¡¼­ ¿ÞÂÊ ±âÁØÀ¸·Î 1¹øÀ¸·Î ½ÃÀÛÇÕ´Ï´Ù. ½ÇÁ¦ ³­ÀÌµµ »ó°ü ¾øÀÌ ÆíÀÇ»ó
;¿¹·Î 4¹ø Áö¿ªÀÎ °ËÀº ¹ÙÀ§»êÀÇ ¿ÞÂÊ¿¡¼­ 5¹øÂ° ´øÁ¯Àº °ËÀº ¼ºÃ¤ ÀÔ´Ï´Ù.

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

global isRaidFinished=0  ;//·¹ÀÌµå ÁøÇà Ã¼Å© 1Àº ³¡³ª¼­ ÁøÀÔÇÏ¸é ¾ÈµÇ´Â »óÈ² 0Àº ÁøÇà °¡´ÉÇÑ »óÈ²

global DungeonFinish=0   ;// ´øÁ¯ÀÌ Á¤»óÀûÀ¸·Î ³¡³µ´ÂÁö Ã¼Å©ÇÑ´Ù  1ÀÌ ¿Ï·á,  ´øÁ¯ÁøÇà»çÇ×Ã¼Å© ÇÔ¼ö¿¡¼­ ¹«ÇÑ·çÇÁ·Î È®ÀÎ

;global FullX, FullY, HalfX, HalfY:=0


;; ½ÇÁ¦ À©µµ¿ì »çÀÌÁî ÃøÁ¤





ResizeWin()
OnInit()

error("¿¡·¯ ³¯¶§ ", "ÀÌÃ¢À» ½º¼¦ ÇØÁÖ¼¼¿ä")


error("´øÁ¯·Îµù ÀÌ¹ÌÁöÀÌ¸§")
error(DungeonFile)

error("·¹ÀÌµå·Îµù ÀÌ¹ÌÁöÀÌ¸§")
error(RaidFile)


F1::
ResizeWin(0,0)
;¹Ì±ÃÇÔ¼ö()
;goto ¹Ì±Ã
¹Ì±ÃÇÔ¼ö()
return

F2::
;SetGenySize()
;µî±ÞÆÇ¸Å("Èò»ö_¾ÆÀÌÅÛ.bmp")
;goto ´øÁ¯ÁøÇà»çÇ×Ã¼Å©
;goto ¸ðÇèÇÏ±â
return

F3::
;¾÷ÀûÃ¢³¯¸²()
;Æ¼ÄÏÈ®ÀÎ(12)
·¹ÀÌµåÇÔ¼ö()
;·¹ÀÌµå¸Ê¼±ÅÃ()

return

F4::
;ResizeWin(0,0)
;error("F4 Test")


error("º¸½º¹æ »±»±ÀÌ °©´Ï´Ù")
;goto ´øÁ¯ÇÔ¼ö

;Å×½ºÆ®()
´øÁ¯ÇÔ¼ö() ;//ÀÌ¸§ Á» ¹Ù²ã¾ßÇÒµí 
;goto Ä£±¸¼±ÅÃ

return

F5::
ResizeWin(0,0)

;error("½Å¹ß ±¸ÀÔ Å×½ºÆ®")


;RaidNum=1  
;AreaCode=4
;DungeonNum=5
;DungeonFile="4_5.bmp"
;goto ´øÁ¯ÇÔ¼ö
;´øÁ¯ÃÖÁ¾¼±ÅÃ()
;goto ½Å¹ßºÎÁ·
;¹öÆ°Å¬¸¯("º¸½º¹æ_¾ÆÀÌÄÜ.bmp")
;¹öÆ°Å¬¸¯("ÀÌº¥Æ®ÆäÀÌÁö_È®ÀÎ.bmp")
;¹öÆ°Å¬¸¯("¼­¹ö¿¬°áÁ¾·á_È®ÀÎ.bmp")
;¹öÆ°Å¬¸¯("µ¿·áÈ¹µæ_È®ÀÎ¹öÆ°.bmp")
;¹öÆ°Å¬¸¯("Æ÷¼ÇÆÇ¸ÅÃ¢_È®ÀÎ.bmp")
;¹öÆ°Å¬¸¯("½Å¹ßºÎÁ·_È®ÀÎ.bmp");
;¹öÆ°Å¬¸¯("½Å¹ß±¸ÀÔ_È®ÀÎ.bmp");
;¹öÆ°Å¬¸¯("´øÀü_¸ðÇèº¸»ó_È®ÀÎ.bmp")
;¹öÆ°Å¬¸¯("Ä£±¸¼±ÅÃ_¹öÆ°.bmp")
;¹öÆ°Å¬¸¯("Ä£±¸¼±ÅÃ_ÀÔÀåÇÏ±â.bmp")
;Æ¼ÄÏÈ®ÀÎ(tempval)
;msgbox Æ¼ÄÏÈ®ÀÎ ·¹ÆÛÆÝ½º %tempval%



return


F6::
reload
ResizeWin(0,0)

return

error("¹Ì±Ã ¿ÀÅä ¸ÅÅ©·Î Á¤ÁöÇÕ´Ï´Ù")
msgbox "ÀÚµ¿ »ç³É ¸ÅÅ©·Î Á¤Áö ÇÕ´Ï´Ù"
return



F7::
ResizeWin(0,0)

error("F7 º¸½º¹æ ¸ÅÅ©·Î ½ÃÀÛÇÕ´Ï´Ù")

goto º¸½º¹æ
return

F8::
ResizeWin(0,0)
;msgbox %FullX% %FullY%
error("F8 ÀåºñÃ¢Á¤¸® ¸ÅÅ©·Î ½ÃÀÛÇÕ´Ï´Ù")
;goto ÀåºñÁ¤¸®
ÀåºñÁ¤¸®()
return


F9::
reload
return

F10::
suspend
return


F11::
return
error ("½Å¹ß±¸ÀÔ")
gosub ¸ÞÀÎÃ¢
gosub »óÁ¡
gosub ½Å¹ß±¸ÀÔ
return

F12::
error("Debug Console Start")
return


;=====AreaCode
;1:ÄÚ¸ðµµ, 2:½ºÅè 3:Ç»¸® 4:ºí·¢¸¶¿îÆ¾ 5:µ¥½ºÅ©¶ó¿î
;°ñ·½¾ð´ö, ÀØÇôÁø½£, Ãß¶ôÀÚÀÇ»ç¸·, °ËÀº¹ÙÀ§»ê, °ñ·½¾ð´ö

;=====RaidNum
;  ÇØ´ç Áö¿ª ·¹ÀÌµåÀÔ´Ï´Ù. ¹¹ °á·ÐÀº Áö±ÝÀº 1¹ø¹Û¿¡ ¾øÀ½



;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:ÄÚ¸ðµµ, 2:½ºÅè 3:Ç»¸® 4:ºí·¢¸¶¿îÆ¾ 5:µ¥½ºÅ©¶ó¿î
;°ñ·½¾ð´ö, ÀØÇôÁø½£, Ãß¶ôÀÚÀÇ»ç¸·, °ËÀº¹ÙÀ§»ê, °ñ·½¾ð´ö

;=====RaidNum
;  ÇØ´ç Áö¿ª ·¹ÀÌµåÀÔ´Ï´Ù. ¹¹ °á·ÐÀº Áö±ÝÀº 1¹ø¹Û¿¡ ¾øÀ½


;// ¸ÊÅ¸ÀÔ Raid dungeon ÀÖ´Ù.


Áö¿ªÀÌµ¿(maptype="dungeon")  
{
    error("Áö¿ªÀÌµ¿ ÇÔ¼ö·Î ÁøÀÔ ¿Ï·á", %maptype%)
    Sleep, 1000
    if(maptype = "raid")
    {
        if(R_AreaCode=1)
        {
            error("°ñ·½¾ð´ö  ÀÌµ¿")
            ;MouseClickDrag, left, 1070, 210, 20,700
            ÁÂÇ¥ÀÌµ¿("NE")
            Sleep,100
        }

        else if(R_AreaCode=2)
        {
            error("Ãß¶ôÀÚÀÇ »ç¸· ÀÌµ¿")
            ;MouseClickDrag, left, 450, 360, 690,260
            ÁÂÇ¥ÀÌµ¿("SW")
            Sleep,100
            MouseClickDrag, left, 200,480, 200, 360



        }

        else if(R_AreaCode=3)
        {
            error("ÀØÇôÁø½£À¸·Î ÀÌµ¿")
            ;MouseClickDrag, left, 1086, 483, 644, 141
            ÁÂÇ¥ÀÌµ¿("SE")
            Sleep,100
            MouseClickDrag, left, 792,330, 1100, 270


        }

        else if(R_AreaCode=4)
        {
            error("°ËÀº¹ÙÀ§»ê Áö¿ªÀ¸·Î ÀÌµ¿")
            ;MouseClickDrag, left, 200,300, 200, 650
            ÁÂÇ¥ÀÌµ¿("NW")
            Sleep,100
            MouseClickDrag, left, 270,140, 145, 120


        }

        else if(AreaCode=5)
        {
            error("¼ºÃ¤Áö¿ªÀ¸·Î ÀÌµ¿") ;// »ç½Ç ÀÌµ¿Àº ¾ø¾îµÎ ´ï
            ;MouseClickDrag, left, 200,300, 200, 650
            ÁÂÇ¥ÀÌµ¿("NW")
            Sleep,100
            MouseClickDrag, left, 600, 600, 210, 270

        }
    }


    else if(maptype = "dungeon")
    {
        sleep, 500
        error("´øÁ¯Áö¿ªÀÌµ¿ ")
        if(AreaCode=1)
        {
            error("°ñ·½¾ð´ö  ÀÌµ¿")
            ;MouseClickDrag, left, 1070, 210, 20,700
            ÁÂÇ¥ÀÌµ¿("NE")
            Sleep,100
        }

        else if(AreaCode=2)
        {
            error("Ãß¶ôÀÚÀÇ »ç¸· ÀÌµ¿")
            ;MouseClickDrag, left, 450, 360, 690,260
            ÁÂÇ¥ÀÌµ¿("SW")
            Sleep,100
            MouseClickDrag, left, 200,480, 200, 360



        }

        else if(AreaCode=3)
        {
            error("ÀØÇôÁø½£À¸·Î ÀÌµ¿")
            ;MouseClickDrag, left, 1086, 483, 644, 141
            ÁÂÇ¥ÀÌµ¿("SE")
            Sleep,100
            MouseClickDrag, left, 792,330, 1100, 270


        }

        else if(AreaCode=4)
        {
            error("°ËÀº¹ÙÀ§»ê Áö¿ªÀ¸·Î ÀÌµ¿")
            ;MouseClickDrag, left, 200,300, 200, 650
            ÁÂÇ¥ÀÌµ¿("NW")
            Sleep,100
            MouseClickDrag, left, 270,140, 145, 120


        }

        else if(AreaCode=5)
        {
            error("¼ºÃ¤Áö¿ªÀ¸·Î ÀÌµ¿") ;// »ç½Ç ÀÌµ¿Àº ¾ø¾îµÎ ´ï
            ;MouseClickDrag, left, 200,300, 200, 650
            ÁÂÇ¥ÀÌµ¿("NW")
            Sleep,100
            MouseClickDrag, left, 600, 600, 210, 270

        }
    }

}
return


ÁÂÇ¥ÀÌµ¿(coordinate="NW")
{
    if(coordinate= "NW")
    {
        ;msgbox 111
        MouseClickDrag, left, 620,420, 1280, 750, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 1280, 750, 2

    }
    else if(coordinate="NE")
    {
        MouseClickDrag, left, 600,400, 0, 750, 2
        Sleep, 500
        MouseClickDrag, left, 600,400, 0, 750, 2
        
    }
    else if(coordinate="SW")
    {
        MouseClickDrag, left, 620,420, 1230, 20, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 1230, 20, 2
        
    }
    else if(coordinate="SE")
    {
        MouseClickDrag, left, 620,420, 20, 20, 2
        Sleep, 500
        MouseClickDrag, left, 620,420, 20, 20, 2    
    }
    Else
        error(coordinate)
    return
}

Æ¼ÄÏÈ®ÀÎ(ByRef value)
{
    ImageSearch,PosX,PosY, 1, 1,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\·¹ÀÌµå_Æ¼ÄÏºÎÁ·.bmp
    if ErrorLevel=0
    {

        if (isInfinity = 1)  ;; ¹«ÇÑ¹Ýº¹½ÃÅ°±â
        {  
            ;msgbox Æ¼ÄÏºÎÁ· È®ÀÎ ´­·¯¾ß ÇÑ´Ù
            error("¹«ÇÑ¸ðµå¶ó Æ¼ÄÏ ¾ø´Ù¸é return°ª 6818 µ¹·ÁÁÝ´Ï´Ù")
            error("Æ¼ÄÏ ºÎÁ· Å¬¸¯ ÇÕ´Ï´Ù")
            ¹öÆ°Å¬¸¯("Æ¼ÄÏºÎÁ·_È®ÀÎ.bmp")
            ;msgbox Æ¼ÄÏºÎÁ·
            value:=6818
            return %value%
        }

    ;///Å×½ºÆ® ÄÚµå ÀÚ±â Àü¿¡ Áö¿ì°í ÀÚÀÚ Æ¼ÄÏ ºÎÁ·½Ã¿¡ 
        else
        {
            error("Æ¼ÄÏ ºÎÁ·ÇÏÁö¸¸ ¹«ÇÑ¸ðµå°¡ ¾Æ´Ï¶ó ±×³É Á¾·á")
            ¹öÆ°Å¬¸¯("Æ¼ÄÏºÎÁ·_È®ÀÎ.bmp") 
;            reload  ; Æ¼ÄÏºÎÁ· È®ÀÎÇÏ°í Á¾·áÇÑ´Ù
            ;reload
            return 0

        }
    }
    Else
    {
        
        error("Æ¼ÄÏ ºÎÁ·ÇÏÁö ¾ÊÀ½")
    }
    return 0
}


¹Ì±Ã:

;msgbox %isInfinity% ID
Count=0
error("¹Ì±Ã ¸ÅÅ©·Î ½ÃÀÛÇÕ´Ï´Ù")
Loop
{
; ÁÖÀÇ»çÇ× ** ¹Ì±Ã µµÀü È­¸é¿¡¼­ ½ÃÀÛÇØ¾ß ÇÑ´Ù µµ¿ì¹Ì ¼³Á¤µî ³¡³ª°í ÇØµµ µÈ´Ù
; ¾Ë°í¸®Áò ¼³¸í
; ¹Ì±ÃµµÀü ¹öÆ° ÀÌ¹ÌÁö ¼­Ä¡ ÈÄ, ÇØ´ç ÁÂÇ¥ Å¬¸¯À¸·Î È®ÀÎ Ã¢ 2ÃÊ°£ µô·¹ÀÌ ÁØÈÄ ¹Ì±Ã ½ÃÀÛÇÔ.
; ¿¡·¯ ¹ß»ý½Ã ÅØ½ºÆ® Ãâ·Â
; ÀÓ½Ã    Sleep, 5000
Sleep, 1000

    ImageSearch,PosX,PosY, HalfX , HalfY,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¹Ì±ÃµµÀü_¹öÆ°.bmp
    if errorlevel=0
    {
;//½º¤ÌÁ¤ÇØ¶ó
        MouseClick, left, %PosX%, %PosY%
        error("¹Ì±Ã µµÀü ¹öÆ° Ã£À½")

        ;msgbox %isTicket%

        ;if (isInfinity = 1)  ;; ¹«ÇÑ¹Ýº¹½ÃÅ°±â
        ;{  
         ;   error("¹«ÇÑ¸ðµå¶ó Æ¼ÄÏ ¾È»ç°í ´øÁ¯À¸·Î °¨")
          ;  Å«È®ÀÎ¹öÆ°Å¬¸¯()
          ;  gosub º¸½º¹æ³ª°¡±â
          ;  gosub ¸ÞÀÎÃ¢
          ;  ´øÁ¯ÇÔ¼ö()  ;; // ¸ÞÀÎÃ¢À¸·Î ³ª°£ÈÄ¿¡ ±×³É 
          ;  return
        ;}

;///Å×½ºÆ® ÄÚµå ÀÚ±â Àü¿¡ Áö¿ì°í ÀÚÀÚ Æ¼ÄÏ ºÎÁ·½Ã¿¡ 
        ;else
        ;{

        ;}
        Sleep, 1000
        ImageSearch,PosX,PosY,(HalfX/2), HalfY ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¹Ì±Ã½ÃÀÛÈ®ÀÎ_¹öÆ°.bmp
        if errorlevel=0
        {

            MouseClick, left, %PosX%, %PosY%
            error("¹Ì±Ã ½ÃÀÛ È®ÀÎ ¹öÆ° ´©¸§")
            Sleep, 2000
            isTicket=0
            error("Æ¼ÄÏ È®ÀÎ")
            Æ¼ÄÏÈ®ÀÎ(isTicket)
            if isTicket=6818
            {
            ;    msgbox Æ¼ÄÏ 6818
                error("¹«ÇÑ ¸ðµå¶ó Æ¼ÄÏ ¾øÀ¸´Ï ´øÁ¯ÇÔ¼ö·Î µÇµ¹¾Æ°£´Ù")
                gosub º¸½º¹æ³ª°¡±â
                ;gosub ¸ÞÀÎÃ¢
                ´øÁ¯ÇÔ¼ö()  ;; // ¸ÞÀÎÃ¢À¸·Î ³ª°£ÈÄ¿¡ ±×³É 
            
                return
            }
            Else
            {
                
            }
            
            Sleep, 10000   ;¹Ì±Ã ½ÃÀÛÈÄ µô·¹ÀÌ Áà¾ß°ÚÁö
            error("¹Ì±Ã ÁøÀÔÇÕ´Ï´Ù~~")
            goto, ¹Ì±ÃÁøÇàÃ¼Å©    
            ;return          
            return 
        }
        else if errorlevel=2
        {
            error("¹Ì±Ã ½ÃÀÛ È®ÀÎ ¹öÆ° ÀÌ¹ÌÁö¾øÀ½")
        }
        else 
        { 
            error("¹Ì±Ã ½ÃÀÛ È®ÀÎ ¹öÆ° ¸øÃ£À½")
        }

    }

    else if errorlevel=2
    {
      error("¹Ì±Ã µµÀü ¹öÆ° ÀÌ¹ÌÁö¾øÀ½")
    }


    else
    {
    ;       error("****¹Ì±Ã µµÀü ¹öÆ° ¸ø Ã£À½ ¹Ì±Ã ¸ÅÅ©·Î Á¤Áö ÇÕ´Ï´Ù `*****F5·Î Àç½ÇÇà ÇÏ¼¼¿ä")
    ;       return

    }



  
    ;============¾÷Àû º¸»óÃ¢ ¶°ÀÖ´Â°Ç ¾Æ´ÑÁö È®ÀÎÇØº»´Ù

    ;gosub, ¾÷ÀûÃ¢³¯¸²

    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¾÷Àû_º¸»ó.bmp
    if errorlevel=0
    {
        error("¾÷Àû È­¸é Ã£À½")
        MouseClick, left, %PosX%, %PosY%
    }   
    else if errorlevel=2
    {
        error("¾÷Àû º¸»ó ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
        if(Count = 10)
        {
            error("¾÷Àûº¸»ó ¾ÆÀÌÄÜ ¸øÃ£À½")
        Count=0
        }
        else
        {
            Count+=1
        }
    }

}



¹Ì±ÃÁøÇàÃ¼Å©:

; ¾Ë°í¸®Áò -> ¹Ì±Ã ÁøÇà Á¾·á½Ã ÀÌ¹ÌÁö "µµÀü Á¾·á" ÀÌ¹ÌÁö ÇÈ¼¿ Ã¼Å©ÈÄ, errorlevel=0 (È®ÀÎ½Ã) Á¾·á¹öÆ° Å¬¸¯ ÈÄ
; 3ÃÊ ½® ÈÄ¿¡ È®ÀÎ ¹öÆ° Å¬¸¯À¸·Î ·çÇÁ¹® Á¾·á 
; ÀÌÈÄ ´Ù½Ã ¹Ì±Ã µµÀü ½ÃÀÛ È­¸éÀ¸·Î µ¹¾Æ¿Â´Ù
Count=0
Loop
{
    Sleep, 1000

    ;//ÀÌ¹ÌÁö µ¿ÀÏÇÏ¿© ´øÁ¯ Å½Çè ¼º°ø ÀÌ¹ÌÁö Â÷¿ë
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Å½Çè¼º°ø_¼º°ø_È¨¹öÆ°.bmp
    if errorlevel=0
    {
    error(" ¹Ì±Ã Å½Çè Á¾·á È¨¹öÆ° ÀÌ¹ÌÁö È®ÀÎÇÔ")
    Sleep,4000
    ;¹Ì±Ã ÁøÇà Á¾·á È®ÀÎ¿¡ 0.5ÃÊ È®ÀÎ ¹öÆ°¿¡ 3ÃÊ µô·¹ÀÌ µÒ
    MouseClick, left, HalfX, HalfY

    Sleep,4000
        ImageSearch,PosX,PosY, (HalfX/3) *2, (HalfY/3) * 4,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¹Ì±Ã_Á¾·á_È®ÀÎ.bmp
        if errorlevel=0
        {
        ;             error %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%,3
        error("¹Ì±Ã Á¾·á È®ÀÎ ¹öÆ° ÆË¾÷")
        Sleep, 1500
        MouseClick, left, %PosX%, %PosY%
        error("¹Ì±Ã Á¾·á È®ÀÎ ¹öÆ° ´©¸§")
        Sleep, 5000
        goto ¹Ì±Ã
        Break           

        }
        else if errorlevel=2
        {
        error("¹Ì±Ã Á¾·á È®ÀÎ ÀÌ¹ÌÁö ¾ø¾î¿ë")
        ;           Break
        }
        else
        { 
        error("¹Ì±Ã ÁøÇà Á¾·á È®ÀÎ ¹öÆ° ¸øÃ£À½")
        ;                   Break

        }   

    }
    else if errorlevel=2
    {
    error("¹Ì±Ã Á¾·á È®ÀÎ ÀÌ¹ÌÁö ¾ø¾î¿ë")
    ;       Break
    }
    else 
    { 

    }

    if ( Count= 10)
    {
    gosub Ä£±¸¼ÒÈ¯
    error ("¹Ì±Ã ÁøÇà 10ÃÊ ÈÄ Ä£±¸ ¼ÒÈ¯")
    Count+=1
    gosub, ÀÚµ¿ÀüÅõÃ¼Å©

    }
    else if ( Count = 300 )
    {
    gosub Ä£±¸¼ÒÈ¯
    error ("ÃÖÃÊ ¼ÒÈ¯ ÈÄ 5ºÐ¸¶´Ù Ä£±¸ ¼ÒÈ¯")
    Count = 11
    }

    else
    {
    Count+=1

    }

}
return





¸ðÇèÇÏ±â:
Loop, 50
{
    ;
    ;ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ðÇèÇÏ±â_¹öÆ°.bmp ;//¿ø·¡ ¾²´ø°Å 0729
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *80 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ðÇèÇÏ±â_¹öÆ°.bmp
    ;ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ðÇèÇÏ±â_¹öÆ°.bmp
    if errorlevel=0
    {
       ;msgbox %PosX% %PosY%
        MouseClick, left, %PosX%, %PosY%
        error("¸ðÇèÇÏ±â ¹öÆ° Å¬¸¯ Çß½À´Ï´Ù. 3ÃÊÈÄ ÇÔ¼ö Á¾·á")
        Sleep, 3000
        break
    }

    else if errorlevel=2
    {
        error("¸ðÇè ÇÏ±â ¹öÆ°.bmp ¾ø³×¿ä ¾ø¾î¿ë")
    ;   return
    }   



    else
    {
    error("¸ðÇè ÇÏ±â ¹öÆ° À§Ä¡ ¸øÃ£±¸ ÀÖÀ½")

    ;   return
    }
    Sleep, 300

}
;¤Ðerror("¸ðÇèÇÏ±â Å¬¸¯ ¸øÇÏ°í Á¾·á")
return




;===============¿©±â¼­ºÎÅÍ Á¦´ë·Î ¼öÁ¤ÀÌ´Ù 0723¿ÀÈÄ ¹öÁ¯ÀÓ

º¸½º¹æ:   ;;0723 ¿Ï·á
Count=0
aCount=0
Loop, 50
{
;;;; ¼öÁ¤ÇÏ°í Sleep ÇÊ¼ö
;»ó±æ Sleep, 5000
;Sleep, 3000

;msgbox º¸½º¹æ
    ;====================================¼öÁ¤ ¼Ò½º  ÀÌÇÏ =============================
    ¾÷ÀûÃ¢³¯¸²()

    
    ;     ImageSearch,PosX,PosY, 1 , 100 , FullX,FullY, *40 %A_ScriptDir%\ÀÌ¹ÌÁö\º¸½º¹æ_¾ÆÀÌÄÜ.bmp
    ImageSearch,PosX,PosY, FullX/3 * 2= , 10 , FullX,FullY, *60 %A_ScriptDir%\ÀÌ¹ÌÁö\º¸½º¹æ_¾ÆÀÌÄÜ.bmp
    if errorlevel=0
    {
        ;if (isInfinity = 1)  ;; ¹«ÇÑ¹Ýº¹½ÃÅ°±â
        ;{  
        ;    error("¹«ÇÑ¸ðµå¶ó ½Å¹ß »çÁö ¾Ê°í ³ª¿È")
        ;    Å«È®ÀÎ¹öÆ°Å¬¸¯()
        ;    gosub º¸½º¹æ³ª°¡±â
        ;    gosub ¸ÞÀÎÃ¢
        ;    ¹Ì±ÃÇÔ¼ö()  ;; // ¸ÞÀÎÃ¢À¸·Î ³ª°£ÈÄ¿¡ ±×³É 
        ;    return
        ;}

        ;msgbox %PosX% %PosY%
        MouseClick, left, PosX+5, PosY+5
        Sleep, 1000
        ;;»ó±æ²Àº¸ÀÚ   goto ÀåºñÈ®ÀÎÃ¢
        error("½Å¹ß ºÎÁ·ÇÑÁö Ã¼Å©ÇÔ¼ö ÀÌµ¿")
        gosub ½Å¹ßºÎÁ·
        ;/////////0725¿¡ ¼öÁ¤ ÇÑ°Å ½Å¹ß ºÎÁ·ÇÏ¸é ½Å¹ß »ç¿À°í ¿ø·¡ ÇÁ·Î¼¼½º´ë·Î °£´Ù
        gosub ÀåºñÈ®ÀÎÃ¢

        ;return
        break
    }

    else if errorlevel=2
    {
    ;       error("º¸½º¹æ ¾ÆÀÌÄÜ ÀÌ¹ÌÁö ¾øÀ½")
    ;msgbox "º¸½º¹æ"
    }

    else 
    {
    ;       error("º¸½º¹æ ¾ÆÀÌÄÜ ¸øÃ£À½")
    ;msgbox º¸½º¹æ ¾ÆÀÌÄÜ ¸øÃ£¾î 
        Count+=1
        error("º¸½º¹æ¿¡¼­ ¹®Á¦ ÀÖ´Âµí ÇØ º¸ÀÓ Count ", %Count%)
        if (Count0 = 20)
        {
            error("º¸½º¹æ¿¡¼­ ¹®Á¦ ÀÖ´Âµí ÇØ º¸ÀÓ Count ", %Count%)
           Count=0
        ;           MouseClick, left, FullX/2 ,HalfY/4
        }

        else
        {
        }


    }
    ¾÷ÀûÃ¢³¯¸²()
    ;============¾÷Àû º¸»óÃ¢ ¶°ÀÖ´Â°Ç ¾Æ´ÑÁö È®ÀÎÇØº»´Ù

/*
    ImageSearch,PosX,PosY, 1 , HalfY/2,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¾÷Àû_º¸»ó.bmp
    if errorlevel=0
    {
      error("¾÷Àû È­¸é Ã£À½")
      ;       msgbox %PosX% %PosY%
       MouseClick, left, %PosX%, %PosY%

    }   
    else if errorlevel=2
    {
       error("¾÷Àû º¸»ó ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
        if(aCount = 10)
        {
         error("´øÁ¯ ¾÷Àûº¸»ó ¾ÆÀÌÄÜ ¸øÃ£À½")
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
error("!!!!!!!!!!!!!!!½É°¢!!!!!!!!!")
error("´øÁ¯ º¸½º¹æ ¾ÆÀÌÄÜ ¸øÃ£°í ·çÇÁ¹® ¹«ÇÑ ¹Ýº¹")
gosub º¸½º¹æ³ª°¡±â
´øÁ¯ÇÔ¼ö()
;
;gosub º¸½º¹æ
return



;;¹Ì±Ã ÀÌ¹ÌÁö ¸ø Ã£À»½Ã ¾÷Àû È­¸éÀº ¾Æ´ÑÁö È®ÀÎÇØº¸ÀÚ





;==========ÀåºñÃ¢À¸·Î °¡¶ó´Â ¸Þ½ÃÁö°¡ ¶¸´ÂÁö ¾È¶¸´ÂÁö È®ÀÎºÎÅÍ ÇÏ´Â °ÍÀÌ¶ó ´ëºÎºÐ ¹öÆ° ¸øÃ£´Â ¸®ÅÏ°ª µ¹·ÁÁÙ °Å´Ù 
ÀåºñÈ®ÀÎÃ¢:   ;;0723 ¿Ï·á
Loop, 5
{

    ImageSearch,PosX,PosY,HalfX/3,HalfY,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\´øÁ¯_ÁøÀÔÀü_ÀåºñÃ¢_Ç®.bmp
    if errorlevel=0
    {
        error("ÀåºñÃ¢ Ç®ÀÌ¶ó Àåºñ ÆÇ¸ÅÇÏ·¯ °©´Ï´Ù")
        ;       error("ÀåºñÈ®ÀÎÃ¢ %PosX% %PosY%")
        MouseClick, left, %PosX%, %PosY%
        error("ÀåºñÈ®ÀÎÃ¢ Å¬¸¯ ¿Ï·á") ; ==%PosX% %PosY%")
        Sleep, 5000

        ÀåºñÁ¤¸®()
        ;;//////Àåºñ Á¤¸® ³¡³­ÈÄ ESC·Î ÀåºñÃ¢´Ý±â
        Send {Esc}
        Sleep, 2500
        gosub º¸½º¹æ       
        ;Return
        break
    }

    else if errorlevel=2
    {
        error("ÀåºñÃ¢ ÀÌ¹ÌÁö ¾ø¾î¿ë")
        Break
    }

    else        
    {
    ; 
    ;       error("ÀåºñÃ¢ °¡±â ¹öÆ° ¸øÃ£À½")
    }
    Sleep, 500
}
goto Ä£±¸¼±ÅÃ
return






Ä£±¸¼±ÅÃ:    ;;0723 ¿Ï·á
isFriendEmpty=0
aCount=0
Loop
{
;     ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ_»ç¿ë¿Ï·á.bmp
    ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ_¹öÆ°.bmp
    if (errorlevel=0) || (isFriendEmpty = 1)
    {

        MouseClick, left, %PosX%, %PosY%
        ;         Sleep, 500
        error("Ä£±¸¼±ÅÃ Ã¢ -> ÀÔÀå ÇÁ·Î¼¼½º ")



        ImageSearch,PosX,PosY, HalfX/3 * 2  , HalfY/3 * 5 + 20, FullX, FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ_ÀÔÀåÇÏ±â.bmp
        if (errorlevel=0) || (isFriendEmpty = 1)
        {

        ;=======Ä£±¸¼±ÅÃÈÄ ´øÁ¯ ÀÔÀå¹öÆ° ´©¸¥ ÈÄ


         Loop , 6  ;// ¿äÁþ²¨¸® ÇÏ´Â ÀÌÀ¯°¡ Ä£±¸ ÀÔÀå½Ã ¹öÆ° ¿©·¯¹ø ¿¬Å¸ÇÏ¸é ¿ìÁ¤ 2¹è·Î ÁÖ´Â ¹ö±× ÀÖ¾úÀ½
         {
                MouseClick, left, %PosX%, %PosY%
                Sleep, 500
         }
         error("Ä£±¸¼±ÅÃ-> ÀÔÀå ÇÁ·Î¼¼½º -> ÀÔÀå¹öÆ° ±îÁö Å¬¸¯ ¿Ï·á")


           ;                  Sleep, 6000  ;·Îµù ½Ã°£ °¨¾ÈÇØ¼­

         gosub Ä£±¸È®ÀÎÃ¢
          ;             gosub ´øÁ¯ÁøÇà»çÇ×Ã¼Å©
         ;return          
         return

        }
        else if errorlevel=2
        {
            error("Ä£±¸¼±ÅÃ_ÀÔÀå È®ÀÎ ÀÌ¹ÌÁö ¾ø¾î¿ë")
            return ;Break
        }
        else
        { 
            error("Ä£±¸¼±ÅÃ_ÀÔÀå È®ÀÎ ¹öÆ° ¸øÃ£À½")
            return ;reak
        }   

    }

    else if errorlevel=2
    {
        error("Ä£±¸¼±ÅÃ_ÀÔÀåÇÏ±â ÀÌ¹ÌÁö ¾ø¾î¿ë")
        ;msgbox Ä£±¸¼±ÅÃ ÀÌ¹ÌÁö ¾øÀ½
        Break
    }
    else 
    {


        ;========= Ä£±¸´Â ´Ù ¾´°Ç ¾Æ´ÑÁö È®ÀÎÇØ º»´Ù
        ImageSearch,PosX,PosY, 1 ,80 ,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ_»ç¿ë¿Ï·á.bmp
        if errorlevel=0
        {
            error("!!!!Ä£±¸ ¸ðµÎ »ç¿ë ÇÑ µí!!!!!")
            ;             MouseClick, left, %PosX%, %PosY%
            isFriendEmpty=1
            error("Ä£±¸ ¼±ÅÃ ¾øÀÌ ´øÁ¯ µé¾î°£´Ù")
        }   
        else if errorlevel=2
        {
            error("Ä£±¸¼±ÅÃ_»ç¿ë¿Ï·á ÀÌ¹ÌÁö¾øÀ½")  
        }
        else 
        { 
           if(aCount = 10)
            {
                error("Ä£±¸¼±ÅÃ_»ç¿ë¿Ï·á ¾ÆÀÌÄÜ ¸øÃ£À½")
                aCount=0
            }
            else
            {
                aCount+=1
            }
          
        }


        ;==========
        error("Ä£±¸¼±ÅÃ ¹öÆ° ¸ø Ã£À½")
    }         


}
return



´øÁ¯ÁøÇà»çÇ×Ã¼Å©:   ;;0723 ¿Ï·á
Count=0
Loop
{

    Sleep,300

    if( DungeonFinish=1) ;/ ´øÁ¯ Á¾·áÀÎ°Í Ã¼Å© ÇßÀ»¶§
    {
        error("´øÁ¯ Á¾·áµÈ DungeonFinish Tru È®ÀÎµÇ¾î º¸½º¹æ Àç ÁøÀÔ")
        DungeonFinish=0
        Sleep, 6000
        goto º¸½º¹æ
        return
    }

    ;   ImageSearch,PosX,PosY,1,1 ,FullX,FullY, %A_ScriptDir%\ÀÌ¹ÌÁö\Å½Çè¼º°ø_¼º°ø_ÅØ½ºÆ®.bmp
    ImageSearch,PosX,PosY,1,1  ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Å½Çè¼º°ø_¼º°ø_È¨¹öÆ°.bmp
    if errorlevel=0
    {

        error("Å½Çè ¼º°ø Ã¼Å© ¿Ï·á ")
        Sleep,300
        ;Å½Çè ¼º°øÈÄ¿¡ º¸»óÃ¢ ³ª¿Àµµ·Ï µô·¹ÀÌ °É¾îµÒ
        MouseClick, left, %PosX%, PosY-100
	    Sleep, 2000

       
    	Sleep, 2000

        error("´øÀü ¸ðÇè º¸»ó È®ÀÎ")
        ¹öÆ°Å¬¸¯("´øÀü_¸ðÇèº¸»ó_È®ÀÎ.bmp")
        CheckDungeonFinish()
        ;Sleep, 6000
        ;gosub º¸½º¹æ
        ;goto º¸½º¹æ
	
        

       

    }


;/////////´øÀü½ÇÆÐ½ÃÃ¼Å©µµ ÇÊ¿äÇÔ

       ImageSearch,PosX,PosY,HalfX/3, 50 ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\´øÁ¯Å½Çè_½ÇÆÐ.bmp
       if errorlevel=0
       {
            error("´øÁ¯ ½ÇÆÐÇÏ¿´½À´Ï´Ù.")
            MouseClick, left, %PosX%, %PosY% - 100
            Sleep, 6000

;//// ´øÀü º¸»ó ´©¸£°í ÀÏ¹Ý È­¸é À¸·Î ³Ñ¾î°¡´Â ½Ã°£ Ã¼Å©ÇÏÀÚ 
            ;MouseClick, left, HalfX, HalfY%PosX%, %PosY%
            ;Sleep, 4000
            loop, 20 
            {
                ¹öÆ°Å¬¸¯("´øÁ¯Å½Çè½ÇÆÐ_È®ÀÎ.bmp", HalfX/3)
                ¹öÆ°Å¬¸¯("´øÀü_¸ðÇèº¸»ó_È®ÀÎ.bmp" HalfX/3)
                error("´øÁ¯ ½ÇÆÐ ÈÄº¸½º¹æ ÇÔ¼ö È£Ãâ")
                Sleep, 500
                ;break
            }
            goto º¸½º¹æ
            return
        }

       else if errorlevel=2
        {
           error("´øÁ¯½ÇÆÐ È®ÀÎ È¨ ÀÌ¹ÌÁö ¾ø¾î¿ë")
           Break
        }

        else
        {
            ;error("´øÁ¯ ½ÇÆÐ È®ÀÎ ¹öÆ°À» ¸øÃ£¾Æ¿ä")
        }

;===========================µ¿·á È¹µæ½Ã È®ÀÎ Ã¢=============================

    ImageSearch,PosX,PosY,1, 1 ,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\µ¿·áÈ¹µæ_½À´Ï´Ù.bmp
    if errorlevel=0
    {
        error("µ¿·áÈ¹µæÇß½À´Ï´Ù ÅØ½ºÆ® Ã¼Å©")
        Sleep, 2000
        ImageSearch,PosX,PosY,HalfX/2, (HalfY/3) *4 ,FullX,FullY, *20 %A_ScriptDir%\ÀÌ¹ÌÁö\µ¿·áÈ¹µæ_È®ÀÎ¹öÆ°.bmp
        if errorlevel=0
        {
            error("µ¿·áÈ¹µæ ÇÏ¿´½À´Ï´Ù")
            MouseClick, left, %PosX%, %PosY%
            ;           Sleep, 6000   



        }  

        else if errorlevel=2
        {
          error("µ¿·á È®ÀÎ È¨ ÀÌ¹ÌÁö ¾ø¾î¿ë")
        ;       Break
        }
        else 
        { 

            error(À½ ¿©±â ¿Ã¼ö°¡ ¾ø¾î µ¿·áÈ¹µæ½Ã Ã³¸® ¹®Á¦ÀÓ ½É°¢ÇÑ ¹®Á¦ÀÓ!)
            ImageSearch,PosX,PosY,HalfX/2,HalfY ,FullX,FullY, *20 %A_ScriptDir%\ÀÌ¹ÌÁö\µ¿·á_È®ÀÎ_¹öÆ°_small.bmp      
            if errorlevel=0
            {
            error("!!!!!!!!!!!µ¿·áÈ¹µæÈ®ÀÎ %PosX% %PosY%")  ;»ó±æ¾Æ
            MouseClick, left, %PosX%, %PosY%
            Sleep, 6000

            MouseClick, left, HalfX, HalfY
            Sleep, 3000

            }
            else if errorlevel=2
            {
            error("µ¿·á È®ÀÎ ¹öÆ° ¾ø¾î¿°")
            }
            else 
            { 
            }

    ;       error(À½ ¾Æ¹«°Íµµ ¸øÃ£³×   ; µ¿·á È¹µæ ¸Þ½ÃÁö º¸°í ¸øÃ£À¸¸é ¹®Á¦ ÀÖ´Â °ÅÀÓ)
       }

    }

    else if errorlevel=2 ;; ¹¹ ÀÌ°Íµµ ÀÌº¥Æ®¶ó ¾øÀ»°¡´É¼ºÀÌ ÀÕ¾î¼­ ·Î±× ³²±â±â Èûµë
    {
        error("µ¿·á_½À´Ï´Ù ÀÌ¹ÌÁö ¾ø³×¿ä")
    }

    else  ;; ¹¹ ÀÌ°Íµµ ÀÌº¥Æ®¶ó ¾øÀ»°¡´É¼ºÀÌ ÀÕ¾î¼­ ·Î±× ³²±â±â Èûµë
    {
    ;       error(µ¿·á_½À´Ï´Ù ¸øÃ£À½)
    }


    if ( Count = 10 )
    {
        gosub Ä£±¸¼ÒÈ¯
        Count+=1
        gosub, ÀÚµ¿ÀüÅõÃ¼Å©
        ;count=0
    }

    else if ( Count = 301 )
    {
        gosub Ä£±¸¼ÒÈ¯
        error ("ÃÖÃÊ ¼ÒÈ¯ ÈÄ 5ºÐ¸¶´Ù Ä£±¸ ¼ÒÈ¯")
        Count = 11
    }
    else
    {
        Count+=1
    }
;==========================´øÁ¯ Á¾·á È®ÀÎ=====================
}
error("!!!¿ÏÀü ¹®Á¦ÀÓ!!´øÀüÁ¾·á return") ; ===========ÀÌ¸®·Î ¿À°Ô µÇ´Â »óÈ²ÀÌ ¸»ÀÌ ¾È´ë´Â°ÅÀÓ
return


=-=============================================Ã¼Å©


Ä£±¸È®ÀÎÃ¢: ;0723È®ÀÎ
error("Ä£±¸ È®ÀÎÃ¢ ÁøÀÔ")
Loop, 8
{
    ;   Ä£±¸¼±ÅÃ¾È´ï_Ã¼Å©

    ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ¾È´ï_Ã¼Å©.bmp
    if errorlevel=0
    {
        error("Ä£±¸ ¼±ÅÃÀÌ ¾ÈµÊ")

        ImageSearch,PosX,PosY,100,100,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ä£±¸¼±ÅÃ¾È´ï_È®ÀÎ_¹öÆ°.bmp
        if errorlevel=0
        {
            ;   error %PosX%, %PosY%
            error("Ä£±¸ ¼±ÅÃ ¾ÈµÈÃ¤·Î ´øÁ¯ Ãâ¹ßÇÔ")
            MouseClick, left, %PosX%, %PosY%
            ;;gosub Ä£±¸¼ÒÈ¯
            ;error("Ä£±¸¼ÒÈ¯ ¿Ï·á Çß±¸¿ä ->´øÁ¯ÁøÇà Ã¼Å©ÇÕ´Ï´Ù")
            error("´øÁ¯ ÁøÀÔ ´Ü°è ¸ðµÎ ¿Ï·á! ->´øÁ¯ ÁøÇà Ã¼Å©ÇÕ´Ï´Ù")
            gosub ´øÁ¯ÁøÇà»çÇ×Ã¼Å©
            ;return
            break
        }
        else if errorlevel=2
        {
            error("Ä£±¸ ¼±ÅÃ ¾ÈÅÛ È®ÀÎ ÀÌ¹ÌÁö ¾ø¾î¿ë")
        ;       Break
        }

    }

    else if errorlevel=2
    {
        error("Ä£±¸¼±ÅÃ¾È´ï_Ã¼Å© ÀÌ¹ÌÁö ¾ø¾î¿ë")
        ;       Break
    }

    else        
    {

    }

    Sleep, 500

}
error("Ä£±¸ ¾øÀ»½Ã È®ÀÎÃ¢ ¾øÀÌ Á¤»óÀûÀ¸·Î Ä£±¸¼ÒÈ¯->´øÁ¯Ã¼Å© ÁøÀÔ")
;gosub Ä£±¸¼ÒÈ¯
gosub ´øÁ¯ÁøÇà»çÇ×Ã¼Å©
error ("´øÁ¯ ÁøÀÔÇÕ´Ï´Ù")
return



Ä£±¸¼ÒÈ¯: ;0723
{

    ;Sleep, 10000

    PosX=0
    PosY=0

    PosX:= HalfX + ( HalfX / 30 ) * 3
    PosY:= HalfY / 4


    MouseClick, left, %PosX%, %PosY%

    error("Ä£±¸ ¼ÒÈ¯ ¿Ï·áÀÔ´Ï´Ù!! ")


    Sleep, 1000

    return
}


ÀÚµ¿ÀüÅõÃ¼Å©:
{
    ImageSearch,PosX,PosY,1,(HalfY/2) *3,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\auto_off.bmp
    if errorlevel=0
    {
        error("ÀÚµ¿ ÀüÅõ ²¨Á® ÀÖÀ½")
        MouseClick, left,  %PosX%, %PosY%

        error("ÀÚµ¿ ÀüÅõ Å¬¸¯ ¿Ï·á")
        return

    }

    else if errorlevel=2
    {
    error("auto_off.bmp ¾ø¾î¿ä")
    return
    }

    else        
    {
    return

    }
}


½Å¹ßºÎÁ·:
Loop, 10
{

    ImageSearch,PosX,PosY,HalfX/2,(HalfY/3) ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\½Å¹ßºÎÁ·.bmp

    ;//ÀÚ±âÀü¿¡ Áö¿ìÀÚ 
    ;errorlevel=0
    if errorlevel=0
    {
        error("½Å¹ß ´Ù½è³×¿ä.")
        MouseClick, left,  %PosX%, %PosY%
        if (isInfinity = 1)  ;; ¹«ÇÑ¹Ýº¹½ÃÅ°±â
        {  
            ;Sleep, 
            ;loop ,3
            ;{  
                error("½Å¹ß ¾ø°í isInfinity=1 ÀÔ´Ï´Ù")
                error("¹«ÇÑ¸ðµå¶ó ½Å¹ß »çÁö ¾Ê°í ³ª¿È")
                ¹öÆ°Å¬¸¯("½Å¹ßºÎÁ·_È®ÀÎ.bmp")
                gosub º¸½º¹æ³ª°¡±â
                ;gosub ¸ÞÀÎÃ¢
                ¹Ì±ÃÇÔ¼ö()  ;; // ¸ÞÀÎÃ¢À¸·Î ³ª°£ÈÄ¿¡ ±×³É 
                ;·¹ÀÌµåÇÔ¼ö()
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
            error("½Å¹ß ±¸ÀÔÇÏ·¯ °©´Ï´Ù")


            ImageSearch,PosX,PosY,HalfX/2,HalfY, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\½Å¹ßºÎÁ·_È®ÀÎ.bmp
            if errorlevel=0
            {
                error("½Å¹ßºÎÁ· È®ÀÎÃ¢ Å¬¸¯")
                MouseClick, left,  %PosX%, %PosY%
                gosub º¸½º¹æ³ª°¡±â
                gosub ¸ÞÀÎÃ¢
                ;             MainScreen()
                ;             »óÁ¡()
                gosub, »óÁ¡
                ;gosub, ½Å¹ß±¸ÀÔ
                ;;;;;;;;;;;;;»ó±æ¼öÁ¤ ½Å¹ß±¸ÀÔ »óÁ¡
                ;;            gosub ³»´øÁ¯
                ;;ÀÌ¹Ì¿©±â¼­ È¨È­¸é ÀÓ
                
                ´øÁ¯ÇÔ¼ö()  ;//´øÁ¯ ÇÔ¼ö´Â ¸ÞÀÎÈ­¸é¿¡¼­ ´øÁ¯±îÁö ¾Ë¾Æ¼­ ÁøÀÔÀÌ´Ù
                return
                ;break
            }
            else if errorlevel=2
            {
                error("½Å¹ßºÎÁ·È®ÀÎ.bmp ¾ø¾î¿ë")
            }
            else
            {
            }

        }


        else ; isBuyShoes ½Å¹ß ±¸ÀÔ ¾ÈÇÑ´Ù
        {
            error("½Å¹ß ±¸ÀÔ ¾øÀÌ ´øÁ¯ Á¾·á ÇÕ´Ï´Ù")
            return
            ;break
        }

    }


    else if errorlevel=2
    {
        error("½Å¹ßºÎÁ·.bmp ¾ø¾î¿ä")
        return
        ;break
    }

    else        
    {
        error("½Å¹ß ¾ÆÁ÷ ¿©À¯ ÀÖ¾î¼­ ½Å¹ß Ã¼Å© ³Ñ¾î¼­->>Àåºñ È®ÀÎ")
        ;goto ÀåºñÈ®ÀÎÃ¢
        return
        ;break

    }
    Sleep, 300
}
return

º¸½º¹æ³ª°¡±â:
{
    Loop,10
    {

        ImageSearch,PosX,PosY,1 ,(HalfY/3) * 4 ,FullX,FullY,  *30 %A_ScriptDir%\ÀÌ¹ÌÁö\³ª°¡±â_¹öÆ°.bmp
        if errorlevel=0
        {
            ;msgbox %PosX% %PosY%
            error("º¸½º¹æ-> ¸Ê ³ª°¡±â ¹öÆ°Ã£¾Ò±¸¿ä.")
            MouseClick, left,  %PosX%, %PosY%
            error("³ª°¡±â ¹öÆ° Å¬¸¯ ")

        }

        else if errorlevel=2
        {

          error("³ª°¡±â_¹öÆ°.bmp ¾ø¾î¿ä")
        ;       return
        }

        else        
        {
           error("³ª°¡±â ¹öÆ° ¾ÆÀÌÄÜ Ã£À» ¼ö ¾øÀ¸´Ï return½ÃÅ´")
        ;       return

        }

        ImageSearch,PosX,PosY,HalfX,HalfY,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ðÇèÇÏ±â_¹öÆ°.bmp
        if errorlevel=0
        {
           error("¸ðÇèÇÏ±â ¹öÆ° ÀÖ´Â°ÍÀ» º¸¾ÆÇÏ´Ï ¸ÞÀÎÈ­¸éÀÔ´Ï´Ù")
        ;     MouseClick, left, %PosX%, %PosY%
        ;
            ;return
            break
        }   
    Sleep, 1000
    }

}
;MainScreen()
error("º¸½º¹æ ³ª°¡±â ½ÇÆÐ ")
;goto, ¸ÞÀÎÃ¢
return





¾÷ÀûÃ¢³¯¸²()  
{

    ImageSearch,PosX,PosY, 1 , 1,FullX,FullY, *50 %A_ScriptDir%\ÀÌ¹ÌÁö\¾÷Àû_º¸»ó.bmp
    if errorlevel=0
    {
        error("¾÷Àû È­¸é Ã£À½")

        ;msgbox %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        error("¾÷Àû È­¸é ³¯¸²")
        return
    }   
    else if errorlevel=2
    {
        error("¾÷Àû º¸»ó ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
        ;if(Count = 10)
        ;{
            error("¾÷Àûº¸»ó ¾ÆÀÌÄÜ ¸øÃ£À½ Count ", %Count%)
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
¾÷ÀûÃ¢³¯¸²:  ;;;
{

    error("¾÷ÀûÃ¢ ¶°  ÀÖ´ÂÁö È®ÀÎ ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¾÷Àû_º¸»ó.bmp
    if errorlevel=0
    {
        error("¾÷Àû È­¸é Ã£À½")
        MouseClick, left, %PosX%, %PosY%
        error("¾÷Àû È­¸é ³¯¸²")
        return
    }   
    else if errorlevel=2
    {
        error("¾÷Àûº¸»ó º¸»ó ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("¾÷Àûº¸»ó ¾ÆÀÌÄÜ ¸øÃ£À½")
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

ÀÌº¥Æ®ÆäÀÌÁö³¯¸²:
{
    loop, 4
    {
        error("ÀÌº¥Æ® ÆäÀÌÁö ÀÖ´ÂÁö È®ÀÎ ")


        ;Å«È®ÀÎ¹öÆ°Å¬¸¯()
        ¹öÆ°Å¬¸¯("ÀÌº¥Æ®ÆäÀÌÁö_È®ÀÎ.bmp")
    }

    return
    ;
    ;ImageSearch,PosX,PosY, 1, HalfY/3, FullX,(FullY/5) * 7, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Å«È®ÀÎ¹öÆ°.bmp
    if errorlevel=0
    {
        error("ÀÌº¥Æ® È­¸é Ã£À½")
        MouseClick, left, %PosX%, %PosY%
        error("ÀÌº¥Æ® È­¸é ³¯¸²")
        return
    }   
    else if errorlevel=2
    {
        error("È®ÀÎ¹öÆ°.bmp ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
         error("ÀÌº¥Æ® ÆäÀÌÁö ¸øÃ£À½")
        if(Count = 10)
        {
        ;        error("¾÷Àûº¸»ó ¾ÆÀÌÄÜ ¸øÃ£À½")
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


·¹ÀÌµåÃÊ´ëÃ¢³¯¸²()  ;;; //
{
    error("·¹ÀÌµå ÀçµµÀüÃ¢ ÀÖ´ÂÁö È®ÀÎ ")
    ImageSearch,PosX,PosY, 1, HalfY/3, FullX,FullY, *70 %A_ScriptDir%\ÀÌ¹ÌÁö\·¹ÀÌµå_ÀçµµÀü.bmp
    if errorlevel=0
    {
        error("·¹ÀÌµå ÀçµµÀü È­¸é Ã£À½")
        ;     MouseClick, left, %PosX%, %PosY%

        gosub, Ãë¼Ò¹öÆ°Å¬¸¯
        ;gosub, È®ÀÎ¹öÆ°Å¬¸¯
        ;¹öÆ°Å¬¸¯("È®ÀÎ¹öÆ°.bmp")

        ;;»ó±æ ¿©±â º¸ÀÚ Ãë¼Ò È®ÀÎ ¿Ö µÎ°³ÀÖÁö?? Å×½ºÆ®¿ëÀÎ°¡
        ;;È®ÀÎÇØº¸´Ï  ¸ð¸£°Ú³ß ¤¾

        error("·¹ÀÌµå ÀçµµÀü È­¸é ³¯¸²")
        return
    }   
    else if errorlevel=2
    {
     error("·¹ÀÌµå_ÀçµµÀü.bmp ÀÌ¹ÌÁö¾øÀ½")  
    }
    else 
    { 
        if(Count = 10)
        {
        ;        error("·¹ÀÌµå_ÀçµµÀü.bmp ¾ÆÀÌÄÜ ¸øÃ£À½")
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





;============ ¸ÞÀÎÃ¢À¸·Î ÀÌµ¿ÇÏ´Â ¿ëµµÀÌ´Ù. »ó±æ¼öÁ¤ÇÒ°Ç ·¹ÀÌµå ¿Ï·á½Ã¿¡ Ãë¼Ò, È®ÀÎÃ³¸® =======
;============ ±âº»ÀûÀ¸·Î Æ¯º° ±¸¸Å Ã¢ Á¦°ÅÇÏ´Â°ÍÀÌ ¸ñÀûÀÌ´Ù=================
;MainScreen(1)
¸ÞÀÎÃ¢:
Loop, 3
{
;msgbox aaa
    ;   ¾÷ÀûÃ¢³¯¸²()
    ;gosub, ¾÷ÀûÃ¢³¯¸²
    ¾÷ÀûÃ¢³¯¸²()
    ·¹ÀÌµåÃÊ´ëÃ¢³¯¸²()
    ;gosub, ·¹ÀÌµåÀçµµÀüÃ¢³¯¸²
    gosub, ÀÌº¥Æ®ÆäÀÌÁö³¯¸²
    

    ImageSearch,PosX,PosY,Half/3  ,(HalfY/3) * 4 ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Æ¯º°±¸¸ÅÃ¢_Ãë¼Ò_±¸¸Å.bmp
    if errorlevel=0
    {
        error("!!!!!!!!!!Æ¯º°±¸¸ÅÃ¢ÀÌ ¶¹½À´Ï´Ù~~!!!!!!!!!!!")

        ImageSearch,PosX,PosY,HalfX/3,(HalfY/3) * 4, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Æ¯º°±¸¸Å_Ãë¼Ò.bmp
        if errorlevel=0
        {
            ;error("Æ¯º°±¸¸ÅÃ¢ Ãë¼Ò Ã£¾Ò½À´Ï´Ù")
            MouseClick, left,  %PosX%, %PosY%
            error("Æ¯º°±¸¸ÅÃ¢ Ãë¼Ò ¹öÆ° Å¬¸¯ ¿Ï·á")
            ;         Sleep, 2000 ;///Æ¯º°±¸¸Å Ãë¼Ò¹öÆ° ´©¸£°í Ã¢ ¶ß´Â ½Ã°£ ´ë±â


            sleep, 2000
            ;;///////Æ¯º° ±¸¸Å Ãë¼Ò -> È®ÀÎ±îÁö

            Loop
            {   

                ImageSearch,PosX,PosY,HalfX/3,HalfY, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Æ¯º°±¸¸Å_¸¶Áö¸·Ã¼Å©.bmp
                if errorlevel=0
                {
                    error("Æ¯º°±¸¸ÅÃ¢ ¸¶Áö¸· È®ÀÎ ¸Þ½ÃÁö ¶¹³×¿ä~ `n `3'±¸¸Å ¾ÈÇØ¿ä~~½Å¹ß»ç·¯ °¥²¨¾ß!")
                    MouseClick, left,  %PosX%, %PosY%
                    error("Æ¯º°±¸¸ÅÃ¢ ¸¶Áö¸· ±¸¸Å ¾ÈÇÔ(Ãë¼Ò) Å¬¸¯ ¿Ï·á")
                    ;return
                    break

                }
                else if errorlevel=2
                {
                    error("Æ¯º°±¸¸Å_¸¶Áö¸·Ã¼Å©.bmp ¾ø¾î¿ë")
                }

                else
                {
                    error("Æ¯º°±¸¸ÅÃ¢ ¹öÆ° ¸ÂÃ£À½")
                    error("!!!!!!!!!!!!!·çÇÁ¹®¿¡ ºüÁ³½À´Ï´Ù")
                    break
                }

          }   

        }

        else if errorlevel=2
        {
            error("Æ¯º°±¸¸Å_Ãë¼Ò.bmp ¾ø¾î¿ë")
        }

        else
        {   

        }


        Count+=1

        if(Count > 200)
        {
           error("Ã¢ ¸øÃ£°í ³­¸®´Ù Á¤¸» ±¸¸Å ¾ÈÇÏ°í ½ÍÀºµ¥")

        }   
        Sleep,100
    ;////Æ¯º° ±¸¸Å Ãë¼Ò Á¾·á
    }


    else if errorlevel=2
    {

      error("Æ¯º°±¸¸ÅÃ¢_Ãë¼Ò_±¸¸Å.bmp ¾ø¾î¿ä")
    ;       return
    }

    else        
    {
    ;       error("Æ¯º°±¸¸ÅÃ¢ ¾È¶áµí")

    }   


    ;   error("º¸½º¹æ-> ¸Ê ³ª°¡±â ¹öÆ°Ã£¾Ò±¸¿ä.")
    ;   MouseClick, left,  %PosX%, %PosY%
    ;   error("³ª°¡±â ¹öÆ° Å¬¸¯ ")


    Sleep, 200

}
return





»óÁ¡:
{

    Loop,10
    {
    ;   error("»óÁ¡ÁøÀÔ  ")

        ImageSearch,PosX,PosY,HalfX ,HalfY ,FullX,FullY,  *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ÞÀÎ_»óÁ¡¹öÆ°.bmp
        ;   ImageSearch,PosX,PosY,1 ,1 ,FullX,FullY,  *30 %A_ScriptDir%\ÀÌ¹ÌÁö\¸ÞÀÎ_»óÁ¡¹öÆ°.bmp
        if errorlevel=0
        {
            error("¸ÞÀÎÈ­¸é_»óÁ¡ ¹öÆ° Ã£¾Ò½À´Ï´Ù.")
            MouseClick, left,  %PosX%, %PosY%
            error("»óÁ¡ ¹öÆ° Å¬¸¯ ")

            ;»óÁ¡ Å¬¸¯ÈÄ ÃÖÃÊ ÆË¾÷ ÀÌº¥Æ®¿ëÀ¸·Î ´ë±âÇØ¾ßÇÔ
            Sleep , 2000  
            ;/////////////////////



            ;////////ÃÖÃÊ ±¸¸Å ÆË¾÷ ·çÇÁ µ¹·Á¼­ È®ÀÎÇÑ´Ù
            Loop, 5
            {
            ;;»ó±æ ÇÊ¼ö ========¾÷µ¥ÀÌÆ®,ÆÐÄ¡ ÈÄ ÀÌ¹ÌÁö º¯°æ ²À ÇÊ¿äÇÔ ==============
                error("»óÁ¡ ¼±ÅÃÈÄ ÆË¾÷Ã¢ ´ë±âÇÔ")

                ImageSearch,PosX,PosY,1,1, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\ÃÖÃÊ±¸¸ÅÆË¾÷_0729.bmp
                if errorlevel=0
                {
                    error("!!!!!!!!!ÃÖÃÊ±¸¸ÅÃ¢ ÆË¾÷ÀÔ´Ï´Ù ¹«½ÃÇÕ´Ï´Ù!!!!!!")
                    ;             MouseClick, left,  %PosX%, %PosY%
                    error("Æ¯º°±¸¸ÅÃ¢ ¸¶Áö¸· ±¸¸Å ¾ÈÇÔ(Ãë¼Ò) Å¬¸¯ ¿Ï·á")

                    ;=====================ÃÖÃÊ±¸¸Å È®ÀÎ Ã¢ Å¬¸¯

                    ImageSearch,PosX,PosY,1,HalfY, FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\ÃÖÃÊ±¸¸ÅÃ¢È®ÀÎ.bmp
                    if errorlevel=0
                    {
                        error("!!!!!!!!!ÃÖÃÊ±¸¸ÅÃ¢ È®ÀÎÇÏ°í ³ª°©´Ï´Ù!!!!!!")
                        MouseClick, left,  %PosX%, %PosY%
                     error("ÃÖÃÊ±¸¸ÅÃ¢ È®ÀÎ Å¬¸¯ ¿Ï·á`n Ã¢»ç¶óÁü")


                        ;///»ó±æ ¿©±âµµ ¼öÁ¤ÇÏÀÚ ÇÊ¼ö
                        error("ÃÖÃÊ±¸¸ÅÃ¢ ¾øÀÌ ¿©±â ¿À¸é ¾ÈÁÁÀº°ÅÀÓ!!!!!!!!")
                        ;             gosub ½Å¹ß±¸ÀÔ
                        ;return
                        break

                    }
                    else if errorlevel=2
                    {
                    error("ÃÖÃÊ±¸¸ÅÃ¢È®ÀÎ bmp ¾ø¾î¿ë")
                    }

                    else
                    {
                    error("ÃÖÃÊ±¸¸ÅÃ¢È®ÀÎ bmp À§Ä¡¸¦ Ã£À»¼ö°¡ ¾ø¾î¿ë")
                    }

       ;=====================ÃÖÃÊ±¸¸ÅÃ¢ ´Ý±â




                }
                else if errorlevel=2
                {
                    error("ÃÖÃÊ±¸¸ÅÆË¾÷_0729 bmp ¾ø¾î¿ë")
                }

                else
                {
                    error("ÃÖÃÊ±¸¸ÅÆË¾÷ÀÌ ¾ø´Â µí ÇÏ´Ï ½Å¹ß ±¸ÀÔ ÇØ¾ßÁÒ")
                    if(BuyOption=1)
                    {
                        error("½Å¹ß ±¸ÀÔ ¿É¼ÇÀÖ³×¿ä")
                        gosub ½Å¹ß±¸ÀÔ
                    }
                    else if (BuyOption=2)
                    {
                        error("±¸ÀÔ ¿É¼Ç ¹»±î¿ä~")

                    }
                    ;return
                    break
                }

    ;=========ÆË¾÷ ÀÌ¹ÌÁö  Á¾·á ÇÔ

            Sleep, 1000
            }



         }

        else if errorlevel=2
        {

        error("¸ÞÀÎ_»óÁ¡¹öÆ°.bmp ¾ø³×¿ä")
        ;       return
        }

        else        
        {
        error("¸ÞÀÎ_»óÁ¡¹öÆ°.bmp ¾ÆÀÌÄÜ Ã£À» ¼ö ¾øÀ¸´Ï return½ÃÅ´")
        ;       return

        }   

    sleep,1000
    }
    ;msgbox "»óÁ¡ÁøÀÔ ½ÇÆÐ ¤Ð¤Ð"
return
}


½Å¹ß±¸ÀÔ:
Loop, 5
{
    error("½Å¹ß ±¸ÀÔÃ¢ ÁøÀÔ")
    ImageSearch,PosX,PosY,HalfX/3 ,1 ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\½Å¹ß°úÆ¼ÄÏ_»óÁ¡.bmp
    if errorlevel=0
    {
    ;msgbox %PosX% %PosY%
        error("½Å¹ß°ú Æ¼ÄÏ ±¸ÀÔÃ¢ Ã£À½")
        MouseClick, left,  %PosX%, %PosY%
        error("½Å¹ß°ú Æ¼ÄÏ ±¸ÀÔÃ¢ Å¬¸¯ ")
    ;½Å¹ß 20°³ ±¸ÀÔ  ÇÒ°Å¾ß===========½ÃÀÛ
    ;½Å¹ß 20°³±¸ÀÌ ¿Ï·á
    }

    else if errorlevel=2
    {

        error("½Å¹ß°úÆ¼ÄÏ_»óÁ¡.bmp ¾ø¾î¿ä")
    ;       return
    }

    else        
    {
    ;       error("½Å¹ß°úÆ¼ÄÏ_»óÁ¡.bmp À§Ä¡ È®ÀÎ ºÒ°¡")
    ;       return

    }    ;//////////½Å¹ßÆ¼ÄÏ  ¹öÆ° ´©¸§


;//////////////////½Å¹ß 20°³ È­¸éÀÌ¸é ±¸ÀÔÇÑ´Ù

    ImageSearch,PosX,PosY,HalfX ,1 ,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\½Å¹ß°úÆ¼ÄÏ_½Å¹ß20°³.bmp
    if errorlevel=0
    {
        error("½Å¹ß 20°³ bmp À§Ä¡Ã£¾Ò¾î¿ä")
        MouseClick, left,  %PosX%, %PosY%
        error("±¸ÀÔ ¹öÆ° ´©¸§ ")

        Sleep, 2000
        error("È®ÀÎ¹öÆ° Å¬¸¯")
        ¹öÆ°Å¬¸¯("È®ÀÎ¹öÆ°.bmp")
        ;
        ;gosub, Ãë¼Ò¹öÆ°Å¬¸¯

        error("ESCµÎ¹ø ´­·¯¼­ ¸ÞÀÎ È­¸éÀ¸·Î ³ª¿Ã²¨¿¡¿ä")
        Loop, 2
        {
            Sleep, 1000
            Send {ESC}
        }
        error("½Å¹ß 20°³ ±¸ÀÔ¿Ï·á")
        return

    }

    else if errorlevel=2
    {

      error("½Å¹ß°úÆ¼ÄÏ_½Å¹ß20°³.bmp ¾ø¾î¿ä")
    ;       return
    }

    else        
    {
    ;       error("½Å¹ß°úÆ¼ÄÏ_½Å¹ß20°³.bmp À§Ä¡ Ã£À» ¼ö ¾øÀ½")
    ;       return

    }   
    Sleep, 500
}
return

Ãë¼Ò¹öÆ°Å¬¸¯:
Loop, 10
{
    ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\Ãë¼Ò¹öÆ°.bmp
    if errorlevel=0
    {
        error("Ãë¼Ò ¹öÆ°Ã£¾Ò±¸¿ä.")
        MouseClick, left,  %PosX%, %PosY%

        error("Ãë¼Ò ¹öÆ° Å¬¸¯ ")
        ;return
        break

    }

    else if errorlevel=2
    {
        error("Ãë¼Ò¹öÆ°.bmp ¾ø¾î¿ä")
        ;return
        break
    }

    else        
    {
        error("Ãë¼Ò¹öÆ°.bmp À§Ä¡ Ã£À» ¼ö ¾øÀ½")
        ;       return

    }
    Sleep, 1000
}
return


¹öÆ°Å¬¸¯(str,StartX=1, StartY=1)
{
    Loop, 2
    {
    ;   ImageSearch,PosX,PosY,1,(HalfY/3),FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\È®ÀÎ¹öÆ°.bmp
        ImageSearch,PosX,PosY,StartX,StartY,FullX,FullY, *30 %A_ScriptDir%\ÀÌ¹ÌÁö\%str%
        if errorlevel=0
        {

            error(str) ;, % PosX, % PosY )
            MouseClick, left,  %PosX%, %PosY%

            error(str, " ¹öÆ° Å¬¸¯ ")
            ;msgbox ¹öÆ° Ã£°í È®ÀÎ´©¸§
            ;msgbox %str%
        ;   msgbox %PosX% %PosY%
            ;return
            break

        }

        else if errorlevel=2
        {
            error(str, "  ¾ø¾î¿ä")
            ;return
            break
        }

        else        
        {
            error(str, " Ã£À»¼ö ¾ø¾î¿ä")
        ;       return

        }
        Sleep, 500
    }
}




;===========================´øÁ¯Áö¿ª ³ª¿­


;RaidNum=1  
;AreaCode=4
;DungeonNum=2
;=====AreaCode
;1:ÄÚ¸ðµµ, 2:½ºÅè 3:Ç»¸® 4:ºí·¢¸¶¿îÆ¾ 5:µ¥½ºÅ©¶ó¿î
;°ñ·½¾ð´ö, ÀØÇôÁø½£, Ãß¶ôÀÚÀÇ»ç¸·, °ËÀº¹ÙÀ§»ê, °ñ·½¾ð´ö


;;·£µù°¡µç 5-2  °ËÀº¼ºÃ¤ 4-5
;=====RaidNum
;  ÇØ´ç Áö¿ª ·¹ÀÌµåÀÔ´Ï´Ù. ¹¹ °á·ÐÀº Áö±ÝÀº 1¹ø¹Û¿¡ ¾øÀ½





;;;;;;18





;RGB
;0x9E37FF º¸¶ó»ö
;0x1A91FF ÆÄ¶õ»ö
;0x24D25D ³ì»ö
;0xFFFFFF Èò»ö

;BGR

;0xFF379E º¸¶ó»ö
;0xFF911A ÆÄ¶õ»ö
;0x5DD224 ³ì»ö
;0xFFFFFF Èò»ö


;Button¹Ì±Ãµ¹¸®±â:
;Sleep, 5000
;goto ¹Ì±Ã
;return

;Buttonº¸½º¹æ»±»±:
;Sleep, 5000
;goto º¸½º¹æ
;return

;ButtonÀåºñÃ¢Á¤¸®:
;Sleep, 5000
;goto ÀåºñÁ¤¸®
;return


;GuiClose:
;ExitApp
;return



















