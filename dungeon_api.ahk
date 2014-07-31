

던젼최종선택()
{
    msgbox %DungeonFile%
    Loop, 10
    {
        ;msgbox !!!
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\이미지\맵\%DungeonFile%
        if errorlevel=0
        {
           msgbox %PosX% %PosY%
            error(DungeonFile, " 선택")

            MouseClick, left, %PosX%, %PosY%
            ;msgbox %PosX% %PosY%
            Sleep, 3000
            return
        }

        else if errorlevel=2
        {
            ;msgbox 234234
            error(DungeonFile, "  이미지가 없어요")
        ;   return
        }   
        


        else
        {
            ;msgbox 111
            error(DungeonFile, " 안보여요")


        ;   return
        }
         Sleep, 1000
    }

    error("심각한 에러임")
}

미궁함수()
{
    gosub 메인창
    gosub 모험하기
    ;gosub 선택
    미궁선택()
    Sleep, 2000
    gosub 미궁
    return
}

던젼함수()
{
    error("던젼 매크로 함수  도착")
    ;error("던젼 검색 시작 합니다")
    gosub 메인창
    gosub 모험하기
    error("메인화면에서 모험하기 버튼 누루고 맵선택 화면")
    지역이동("dungeon")
    error("맵 지역이동 종료")
    던젼맵선택()
    error("맵 지역 이동 종료하고 던젼 선택 종료")
    gosub 보스방 
    return
}





레이드함수()
{
    ;while isRaidFinished = 0
    ;loop, 50
    ;{
        SLEEP, 100
        error("레이드 매크로 함수  도착")
        error("레이드 검색 시작 합니다")
        


        gosub 메인창 ;//업적창 등등 날리기 위해서
        gosub 모험하기 ; //모험버튼 클릭 
        지역이동("raid") ; //내가 원하는 지역 이동
        레이드맵선택() ;// 맵.BMP 선택
        if isRaidFinished = 1
        {
        ;    msgbox 레이드 함수 후 %isRaidFinished%
            error("레이드 종료 되어서 끝났습니다")
            ;isRaidFinished=0
        ;    msgbox %RaidFinished%
     ; 
        }
        Sleep, 2000 ; // 여기서 랙때문에 버튼 못찾을수도 있음
        ;msgbox before raid ss
        레이드도전() ; //입장 및 티켓 체크
        레이드진행상황체크() ; // 실패인지 아닌지 확인
        ;msgbox %isRaidFinished% whiel

    ;}

    isRaidFinished=0

    ;msgbox 레이드 루프 빠져나옴 %isRaidFinished%
   
    return
}


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


미궁선택()
{
    Loop, 10
    {
        ;msgbox !!!
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *30 %A_ScriptDir%\이미지\미궁버튼.bmp
        if errorlevel=0
        {
        ;   msgbox %PosX% %PosY%
            error("끝없는 미궁 클릭(월드맵)")

            MouseClick, left, %PosX%, %PosY%
            ;msgbox %PosX% %PosY%
            Sleep, 3000
            break
        }

        else if errorlevel=2
        {
            error("미궁버튼.bmp 없음")
        ;   return
        }   
        


        else
        {
            error("월드맵미궁버튼 위치 안보임")


        ;   return
        }
         Sleep, 300
    }
    error("미궁종료")
    error("심각한 에러임")


}


던젼맵선택()
{
    ;msgbox %DungeonFile%
    Loop, 30
    {
        ;msgbox !!!
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *100 %A_ScriptDir%\이미지\맵\%DungeonFile%
        if errorlevel=0
        {
           ;msgbox %PosX% %PosY%
            error(DungeonFile, " 선택")

            MouseClick, left, %PosX%, %PosY%
            ;msgbox %PosX% %PosY%
            Sleep, 3000
            ;return
            return
        }

        else if errorlevel=2
        {
            ;msgbox 234234
            error(DungeonFile, "  이미지가 없어요")
        ;   return
        }   
        


        else
        {
            ;msgbox 111
            error(DungeonFile, " 안보여요")


        ;   return
        }
        ;errorlevel=""
         Sleep, 300
    }
    error("던젼맵선택 Loop 종료 ")
    error("심각한 에러임")
}



레이드맵선택()
{
    ;msgbox %DungeonFile%
    loop, 6
    {
        ;msgbox !!!
        ImageSearch,PosX,PosY,1,1,FullX,FullY, *100 %A_ScriptDir%\이미지\맵\%RaidFile%
        if errorlevel=0
        {
           ;msgbox %PosX% %PosY%
            error(RaidFile " 레이드 맵 클릭 합니다")
            MouseClick, left, %PosX%, %PosY%

            Sleep, 2000
            ;/////////////////여기에 레이드 티켓 부족 확인해야 합니다.
            error(Ticket Check)
            isTicket=0
            티켓확인(isTicket)  ;//6818 이라면 무한모드이다.  isInfinity=1 일때임
            if isTicket=6818 
            {
                error("레이드 티켓 다 쓰고 isInfinity=1 이다")
                ;msgbox %isRaidFinished% before change
                isRaidFinished=1   
                gosub 보스방나가기
                ;gosub 메인창
                던젼함수()      
                ;break
                return
                ;gosub 메인창
                ;던젼함수()  ;; // 메인창으로 나간후에 그냥        

                ;msgbox 던젼함수호출
                ;Return
            }
            Else
            {
                
            }
            return
           
        }

        else if errorlevel=2
        {
            ;msgbox 234234
            error(RaidFile, "  이미지가 없어요")
        ;   return
        }   
        


        else
        {
            ;msgbox 111
            error(RaidFile, " 안보여요")


        ;   return
        }
         Sleep, 500
    }
    ;msgbox 레이드 맵 선택 못해서 에러
    error("레이드맵 루프 종료")
    error("심각한 에러임")
}

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

            MouseClick, left, %PosX%, %PosY%-100
            ;레이드함수()
            ;return
            레이드함수()
            return
            ;break

        }

        ImageSearch,PosX,PosY,HalfX/2, HalfY/2 ,FullX,FullY, *20 %A_ScriptDir%\이미지\레이드_물음표.bmp ;; 레이드 성공
        if errorlevel=0
        {
            error("레이드 성공함")
            ;;MouseClick, left, %PosX%, %PosY%
            Sleep, 17000

            ;//// 던전 보상 누르고 일반 화면 으로 넘어가는 시간 체크하자 
            ;           MouseClick, left, HalfX, HalfY
            ;               Sleep, 4000
            레이드함수()   ;//모든 상황 종료되었으니 메인창으로 
            return
            ;break

        }

    }  
}

테스트()
{
    ;msgbox 테스트
    
    테스트2("1_1.bmp")
    sleep, 100      
    테스트2("1_2.bmp")
    sleep, 100    
    테스트2("1_3.bmp")
    sleep, 100    
    
    테스트2("2_1.bmp")
    sleep, 100  
    테스트2("2_2.bmp")
    sleep, 100    
    테스트2("2_3.bmp")
    sleep, 100   
    테스트2("2_4.bmp")
    sleep, 100   
    테스트2("3_1.bmp")
    sleep, 100  
    테스트2("3_2.bmp")
    sleep, 100    
    테스트2("3_3.bmp")
    sleep, 100   
    테스트2("3_4.bmp")
    sleep, 100   
    테스트2("3_5.bmp")
    sleep, 100   
    테스트2("4_1.bmp")
    sleep, 100  
    테스트2("4_2.bmp")
    sleep, 100    
    테스트2("4_3.bmp")
    sleep, 100   
    테스트2("4_4.bmp")
    sleep, 100   
    테스트2("4_5.bmp")
    sleep, 100   
    테스트2("5_1.bmp")
    sleep, 100  
    테스트2("5_2.bmp")
    sleep, 100    
    테스트2("5_3.bmp")
    sleep, 100   
    테스트2("5_4.bmp")
    sleep, 100   
    테스트2("5_5.bmp")

    sleep, 100   
    msgbox aaa             

}

테스트2(dungeon="5_2.bmp")
{
 
    ;msgbox %DungeonFile%
    Loop
    {
        ;msgbox !!!
        ImageSearch,PosX,PosY,1,1,A_ScreenWidth,A_ScreenHeight, *100 %A_ScriptDir%\이미지\맵\%dungeon%
        if errorlevel=0
        {
           ;msgbox %PosX% %PosY%
            error(dungeon, " 찾음")

            ;MouseClick, left, %PosX%, %PosY%
            ;msgbox %PosX% %PosY%
            Sleep, 200
            ;return
            ;msgbox %dungeon%
            return
        }

        else if errorlevel=2
        {
            ;msgbox 234234
            error(DungeonFile, "  이미지가 없어요")
        ;   return
        }   
        


        else
        {
            ;msgbox 111
            ;error(DungeonFile, " 안보여요")


        ;   return
        }
        ;errorlevel=""
         Sleep, 100
    }
    error("던젼맵선택 Loop 종료 ")
    error("심각한 에러임")
}

CheckDungeonFinish()
{
    error("던젼이 정상적으로 끝났는지 체크한다")
    ImageSearch,PosX,PosY, FullX/3 * 2= , 10 , FullX,FullY, *60 %A_ScriptDir%\이미지\보스방_아이콘.bmp
    if errorlevel=0
    {
        error("던젼 완료후 보스방 아이콘 확인함-던젼 종료 확인") 
        DungeonFinish=1
    }

    else
    {

    }


}