빨간아이템판매체크()
{
    ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *50 %A_ScriptDir%\이미지\빨간_아이템_비상임.bmp
    if errorlevel=0
    {
        error("장비창 팔게 생김!!!!!! 미친 에러~ 당장 종료합니다")
        msgbox "빨간 장비 팔게 생김 긴급 종료합니다"
        reload

    }       
    else
    {

    }
}


등급판매(str)
{
    Loop, 2
    {
    
        error(str, "  아이템 판매 함수 진입")
        isItem=0
        ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *50 %A_ScriptDir%\이미지\%str%
        if (errorlevel=0)  || ( isItem = 1)
        {
            isItem=1
            isSoldButton=0
            MouseClick, left, PosX+10, PosY
            Sleep, 2000

            Loop, 3
            { 
              

        ;;;빨갱이 상길 필수
                error(str, "  아이템 판매 함수 Loop3 진입", %A_Index%)
                빨간아이템판매체크()
                
                ImageSearch,PosX2,PosY2,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\이미지\판매_버튼.bmp
                if (errorlevel=0) || ( isSoldButton = 1 )
                {
                    isSoldButton=1
                    MouseClick, left, %PosX2%, %PosY2%
                    Sleep, 2000       
                    
                    Loop, 3
                    {
                        error(str, "  아이템 판매 함수 Loop 3 진입", %A_Index%)
                        ImageSearch,PosX2,PosY2,HalfX/2, HalfY ,FullX,FullY, *50 %A_ScriptDir%\이미지\등급판매_버튼.bmp
                        if errorlevel=0
                        {
                            error(str, " 등급판매")
                            MouseClick, left, %PosX2%, %PosY2%
                            Sleep 7000
                            ;gosub 장비창닫기
                            ;return 
                            error(str, " 등급판매 종료")
                            return
                        }
                        sleep, 500

                    }                
                }
                else if errorlevel = 2
                {
                    error("판매.bmp 이미지 없덴다 ")
                    ;break
                }
                Else
                {
                    error("판매 버튼 위치 못찾음")
                    ;break
                }
                Sleep, 200
            }

        }
        error(str, "  장비 못찾음")
        Sleep, 500
        ;gosub 장비창닫기
        장비창닫기()

    ;   return  

    }
    return
}

아이템판매_단일(str)
{

    isItemFound=0 ;//포션 확인했는지 
    error(str, "  판매 체크중")
    ;gosub 장비정렬1번
    
    ImageSearch,PosX,PosY,HalfX,100,FullX, FullY , *20 %A_ScriptDir%\이미지\%str%
    if (errorlevel=0 ) || (isLargePotion = 1)
    {
        isItemFound=1
        MouseClick, left, PosX+10, PosY+10
        ;   error "%PosX% %PosY% %HalfX%  %HalfY%"
        ;Sleep, 1000

        Sleep, 2000

        Loop, 2
        {
            빨간아이템판매체크()
           
            isSoldButton=0
            error("빨간아이템 체크 완료")

            ImageSearch,PosX2,PosY2,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\이미지\판매_버튼.bmp
            if (errorlevel=0) || (isSoldButton=1)
            {
                error(%A_Index%, "  Sell Item Inner Loop1")
                isSoldButton=1
                ;error "%PosX% %PosY% %HalfX%  %HalfY%"
                Sleep, 2000
                MouseClick, left, %PosX2%, %PosY2%
                loop, 3
                {
                    error(%A_Index%, "  Sell Item Inner Loop2")
                    ImageSearch,PosX2,PosY2,HalfX/2, HalfY ,FullX,FullY, *50 %A_ScriptDir%\이미지\포션판매창_확인_버튼.bmp
                    if errorlevel=0
                    {
                        ;        error("포션판매")
                        MouseClick, left, %PosX2%, %PosY2%
                        Sleep 2000
                        ;gosub 장비창닫기
                        error(str, "  판매 완료")
                        return
                    }
                    else if errorlevel=0
                    {
                        error(str, "판매 확인 버튼이 안보여여")

                    }
                }
            }
            else if errorlevel = 2
            {
                error(str, "판매 이미지 없덴다 ")
            }
            Else
            {
                error(str, "판매 버튼 위치 못찾음")
            }
            Sleep, 200
        }

    }
    ;gosub 장비창닫기 ;//포션 판매했으면 창 닫아야함
    장비창닫기()
    ;==========판매후에는 장비창이 떠있는 상태라 X버튼 눌러줘야 한다    

    ;gosub 장비정렬1번


    Sleep, 500
}



장비창닫기()
{
    Loop, 10
    {

        ImageSearch,PosX,PosY,HalfX,1,FullX, FullY , *20 %A_ScriptDir%\이미지\장비창_X버튼.bmp
        if errorlevel=0
        {
            error("장비창 열려있어서 X버튼 눌러서 닫았습니다")

            MouseClick, left, %PosX%, %PosY%
            return
            ;   error "%PosX% %PosY% %HalfX%  %HalfY%"

        }
        else if errorlevel=2
        {
          ;error("장비창x버튼 이미지 없어요")
        }

        else
        {
        }
        Sleep, 100
    }
}


장비정리() ;//0723 완료()
{
;=====지우자 테스트 후

    장비정렬()    

    ;gosub, 포션판매
    포션판매()
    sleep, 1000
    
    error("보라장비 정렬후")
    ;gosub, 보라장비정리
    등급판매("보라_아이템.bmp")

    sleep, 1000

    장비정렬()
    error("파랑장비 정렬후")
    ;gosub, 파랑장비정리
    등급판매("파랑_아이템.bmp")
    sleep, 1000


    장비정렬()
    error("녹색장비 정렬후")
    ;gosub, 녹색장비정리
    등급판매("녹색_아이템.bmp")
    sleep, 1000

    장비정렬()
    error("흰색장비 정렬후")
    ;gosub, 흰색장비정리
    등급판매("흰색_아이템.bmp")
    



    ;   Send {Esc}

    ;   Sleep, 2500

    ;   goto 보스방

    return
}



장비정렬()
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX, FullY , *40 %A_ScriptDir%\이미지\정렬_버튼.bmp
    if errorlevel=0
    {
    ;error  %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        Sleep, 100
        MouseClick, left, %PosX%, %PosY%
    }
    error("장비 2번 정렬 완료")
    return  
}

장비정렬1번() ;;0723 완료 포션 판매용이다
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX, FullY , *40 %A_ScriptDir%\이미지\정렬_버튼.bmp
    if errorlevel=0
    {
        ;error  %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        Sleep, 200
    }
;   error("장비 1번 정렬 완료")
return  
}



포션판매()
{
    ;sleep, 200
    Loop, 2
    {
       ; /*isLargePotion=0 ;//포션 확인했는지 
        error("포션판매 체크중")
        장비정렬1번()
      
      
        아이템판매_단일("포션_소.bmp")
        아이템판매_단일("포션_중.bmp")
        아이템판매_단일("포션_대.bmp")
        장비정렬1번()
        ;return
    }
    return
}