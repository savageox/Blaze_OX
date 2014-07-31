

error(str, var1="", var2="")
{
    global h_Stdout
    DebugConsoleInitialize()  ; start console window if not yet started
    ;str+=var1
    str=%str%%var1%%var2%
    ;str+=var2
    str .= "`n" ; add line feed
    DllCall("WriteFile", "uint", h_Stdout, "uint", &str, "uint", StrLen(str), "uint*", BytesWritten, "uint", NULL) ; write into the console
    WinSet, Bottom,, ahk_id %h_Stdout%  ; keep console on bottom

    ;FormatTime, Time ;,, MM/DD/YYYY h:mm tt
    ;FormatTime, Time ,, yyyy년MM월dd일-HH:mm ==
    FormatTime, Time ,, MM월dd일 ttH:mm : 



    str=%Time% %str%
    FileAppend, %str%, %A_ScriptDir%\error_report.txt

    sleep, 100
    return
}

DebugConsoleInitialize(winname="OX Debug Console")
{
    ;msgbox %isDebug%
    if isDebug = 0
    {
    
    return
    }
    ;return
    global h_Stdout     ; Handle for console
    static is_open = 0  ; toogle whether opened before
    if (is_open = 1)     ; yes, so don't open again
        return
    is_open := 1    
    ; two calls to open, no error check (it's debug, so you know what you are doing)
    DllCall("AttachConsole", int, -1, int)
    DllCall("AllocConsole", int)

    ;dllcall("SetConsoleTitle", "str","뽀롱 디버그 콘솔")    ; Set the name. Example. Probably could use a_scriptname here 
    dllcall("SetConsoleTitle", "str", winname)    ; Set the name. Example. Probably could use a_scriptname here 
    h_Stdout := DllCall("GetStdHandle", "int", -11) ; get the handle
    ;;WinMove, A, ,0,0, 400, 600
    
    ;WinSet, Bottom,, ahk_id %h_Stdout%      ; make sure it's on the bottom
    ;WinSet, Bottom,,A


    WinActivate,Lightroom   ; Application specific; I need to make sure this application is running in the foreground. YMMV
    ;MsgBox, !!!The active window's ID is "%h_stdout%".
    ;MsgBox, !!!The active window's ID is "%h_Stdout%".

    ;WinMaximize, ahk_id %h_Stdout%
;    WinSet, Bottom,, ahk_id %h_stdout%      ; make sure it's on the bottom

;   WinSet, AlwaysOnTop,ON, A

;msgbox aa
;   send {Alt Down}
;   send {ESC}
;   send {Alt Up}

;;msgbox 11
    return
}


ResizeWin(Width = 0,Height = 0)
{
/*
;    static isExcute=0   
;    static winX=0
;    static winY=0
;    static winSizeX=0
;    static winSizeY=0

;    if (isExcute = 1)
    {
        WinMove, , , winX, winY, 1346,838
        msgbox 윈도우 사이즈 변경!
        return
    }
    */
    WinGetPos,X,Y,W,H,A
    If %Width% = 0
    Width := W

    If %Height% = 0
    Height := H

    ;msgbox aaa

    SysGet,wFrame,32 ; 현재 시스템의 Border값 (창 테두리 두께)
    SysGet,wCaption,4 ; 현재 시스템의 Caption값 (제목 표시줄 높이)


    Width:=w-wFrame*2
    Height:=h-wCaption-wFrame*2

    ;========전역변수 선언으로 여기저기 사용
    ;global FullX:=WIdth
    ;global FullY:=Height
    ;global HalfX:=Width/2 
    ;global HalfY:=Height/2 
    FullX:=WIdth
    FullY:=Height
    HalfX:=Width/2 
    HalfY:=Height/2    

    ;msgbox %w%  %h%

/*
    isExcute=1
    winX:=X
    winY:=Y
    winSizeX:=w
    winSizeY:=h
    ;msgbox %winX% %winY% %winSizeX%, %winSizeY%
*/
    
    ;msgbox %w%  %h% 1346 838  이다 지니모션 1280 800 해상도 기준 
    ; 노트북은 1348 847
    return
}


SetGenySize()
{
    ;WinMove, %WinTitle% , ,0,0 1346,838
    ;WinMove, Genymotion for personal use - Dragon_Blaze_2 (1280x800, 160dpi) - 192.168.56.101, , 0, 0 , 1346, 838
;    WinMove, A, , ,  , 1346, 838
}

OnInit()
{
    ;//Area Code
    IniRead, AreaCode, %A_ScriptDir%\settings.ini, Area, AreaCode
    IniRead, R_AreaCode, %A_ScriptDir%\settings.ini, Area, R_AreaCode
    ;//DungeonNum
    IniRead, DungeonNum, %A_ScriptDir%\settings.ini, Dungeon, DungeonNum

    ;//RaidNum  
    IniRead, RaidNum, %A_ScriptDir%\settings.ini, Raid, RaidNum

    ;//ETC 
    IniRead, isBuyShoes , %A_ScriptDir%\settings.ini, ETC, isBuyShoes
    IniRead, isDebug    , %A_ScriptDir%\settings.ini, ETC, isDebug
    IniRead, BuyOption  , %A_ScriptDir%\settings.ini, ETC, BuyOption 
    IniRead, isInfinity , %A_ScriptDir%\settings.ini, ETC, isInfinity


    DungeonFile=%AreaCode%_%DungeonNum%.bmp
    RaidFile=Raid_%R_AreaCode%_%RaidNum%.bmp 
}


OnInit2()
{
    ;//Area Code
    IniRead, AreaCode, %A_ScriptDir%\settings.ini, Area, AreaCode
    IniRead, R_AreaCode, %A_ScriptDir%\settings.ini, Area, R_AreaCode
    ;//DungeonNum
    IniRead, DungeonNum, %A_ScriptDir%\settings.ini, Dungeon, DungeonNum

    ;//RaidNum  
    IniRead, RaidNum, %A_ScriptDir%\settings.ini, Raid, RaidNum

    ;//ETC 
    IniRead, isBuyShoes , %A_ScriptDir%\settings.ini, ETC, isBuyShoes
    IniRead, isDebug    , %A_ScriptDir%\settings.ini, ETC, isDebug
    IniRead, BuyOption  , %A_ScriptDir%\settings.ini, ETC, BuyOption 
    IniRead, isInfinity , %A_ScriptDir%\settings.ini, ETC, isInfinity


    DungeonFile=%AreaCode%_%DungeonNum%.bmp
    RaidFile=Raid_%R_AreaCode%_%RaidNum%.bmp 
}
