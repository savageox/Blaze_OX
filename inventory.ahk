�����������Ǹ�üũ()
{
    ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *50 %A_ScriptDir%\�̹���\����_������_�����.bmp
    if errorlevel=0
    {
        error("���â �Ȱ� ����!!!!!! ��ģ ����~ ���� �����մϴ�")
        msgbox "���� ��� �Ȱ� ���� ��� �����մϴ�"
        reload

    }       
    else
    {

    }
}


����Ǹ�(str)
{
    Loop, 2
    {
    
        error(str, "  ������ �Ǹ� �Լ� ����")
        isItem=0
        ImageSearch,PosX,PosY,HalfX,100,FullX,FullY, *50 %A_ScriptDir%\�̹���\%str%
        if (errorlevel=0)  || ( isItem = 1)
        {
            isItem=1
            isSoldButton=0
            MouseClick, left, PosX+10, PosY
            Sleep, 2000

            Loop, 3
            { 
              

        ;;;������ ��� �ʼ�
                error(str, "  ������ �Ǹ� �Լ� Loop3 ����", %A_Index%)
                �����������Ǹ�üũ()
                
                ImageSearch,PosX2,PosY2,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\�̹���\�Ǹ�_��ư.bmp
                if (errorlevel=0) || ( isSoldButton = 1 )
                {
                    isSoldButton=1
                    MouseClick, left, %PosX2%, %PosY2%
                    Sleep, 2000       
                    
                    Loop, 3
                    {
                        error(str, "  ������ �Ǹ� �Լ� Loop 3 ����", %A_Index%)
                        ImageSearch,PosX2,PosY2,HalfX/2, HalfY ,FullX,FullY, *50 %A_ScriptDir%\�̹���\����Ǹ�_��ư.bmp
                        if errorlevel=0
                        {
                            error(str, " ����Ǹ�")
                            MouseClick, left, %PosX2%, %PosY2%
                            Sleep 7000
                            ;gosub ���â�ݱ�
                            ;return 
                            error(str, " ����Ǹ� ����")
                            return
                        }
                        sleep, 500

                    }                
                }
                else if errorlevel = 2
                {
                    error("�Ǹ�.bmp �̹��� ������ ")
                    ;break
                }
                Else
                {
                    error("�Ǹ� ��ư ��ġ ��ã��")
                    ;break
                }
                Sleep, 200
            }

        }
        error(str, "  ��� ��ã��")
        Sleep, 500
        ;gosub ���â�ݱ�
        ���â�ݱ�()

    ;   return  

    }
    return
}

�������Ǹ�_����(str)
{

    isItemFound=0 ;//���� Ȯ���ߴ��� 
    error(str, "  �Ǹ� üũ��")
    ;gosub �������1��
    
    ImageSearch,PosX,PosY,HalfX,100,FullX, FullY , *20 %A_ScriptDir%\�̹���\%str%
    if (errorlevel=0 ) || (isLargePotion = 1)
    {
        isItemFound=1
        MouseClick, left, PosX+10, PosY+10
        ;   error "%PosX% %PosY% %HalfX%  %HalfY%"
        ;Sleep, 1000

        Sleep, 2000

        Loop, 2
        {
            �����������Ǹ�üũ()
           
            isSoldButton=0
            error("���������� üũ �Ϸ�")

            ImageSearch,PosX2,PosY2,HalfX,HalfY,FullX,FullY, *50 %A_ScriptDir%\�̹���\�Ǹ�_��ư.bmp
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
                    ImageSearch,PosX2,PosY2,HalfX/2, HalfY ,FullX,FullY, *50 %A_ScriptDir%\�̹���\�����Ǹ�â_Ȯ��_��ư.bmp
                    if errorlevel=0
                    {
                        ;        error("�����Ǹ�")
                        MouseClick, left, %PosX2%, %PosY2%
                        Sleep 2000
                        ;gosub ���â�ݱ�
                        error(str, "  �Ǹ� �Ϸ�")
                        return
                    }
                    else if errorlevel=0
                    {
                        error(str, "�Ǹ� Ȯ�� ��ư�� �Ⱥ�����")

                    }
                }
            }
            else if errorlevel = 2
            {
                error(str, "�Ǹ� �̹��� ������ ")
            }
            Else
            {
                error(str, "�Ǹ� ��ư ��ġ ��ã��")
            }
            Sleep, 200
        }

    }
    ;gosub ���â�ݱ� ;//���� �Ǹ������� â �ݾƾ���
    ���â�ݱ�()
    ;==========�Ǹ��Ŀ��� ���â�� ���ִ� ���¶� X��ư ������� �Ѵ�    

    ;gosub �������1��


    Sleep, 500
}



���â�ݱ�()
{
    Loop, 10
    {

        ImageSearch,PosX,PosY,HalfX,1,FullX, FullY , *20 %A_ScriptDir%\�̹���\���â_X��ư.bmp
        if errorlevel=0
        {
            error("���â �����־ X��ư ������ �ݾҽ��ϴ�")

            MouseClick, left, %PosX%, %PosY%
            return
            ;   error "%PosX% %PosY% %HalfX%  %HalfY%"

        }
        else if errorlevel=2
        {
          ;error("���âx��ư �̹��� �����")
        }

        else
        {
        }
        Sleep, 100
    }
}


�������() ;//0723 �Ϸ�()
{
;=====������ �׽�Ʈ ��

    �������()    

    ;gosub, �����Ǹ�
    �����Ǹ�()
    sleep, 1000
    
    error("������� ������")
    ;gosub, �����������
    ����Ǹ�("����_������.bmp")

    sleep, 1000

    �������()
    error("�Ķ���� ������")
    ;gosub, �Ķ��������
    ����Ǹ�("�Ķ�_������.bmp")
    sleep, 1000


    �������()
    error("������ ������")
    ;gosub, ����������
    ����Ǹ�("���_������.bmp")
    sleep, 1000

    �������()
    error("������ ������")
    ;gosub, ����������
    ����Ǹ�("���_������.bmp")
    



    ;   Send {Esc}

    ;   Sleep, 2500

    ;   goto ������

    return
}



�������()
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX, FullY , *40 %A_ScriptDir%\�̹���\����_��ư.bmp
    if errorlevel=0
    {
    ;error  %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        Sleep, 100
        MouseClick, left, %PosX%, %PosY%
    }
    error("��� 2�� ���� �Ϸ�")
    return  
}

�������1��() ;;0723 �Ϸ� ���� �Ǹſ��̴�
{
    ImageSearch,PosX,PosY,HalfX,HalfY,FullX, FullY , *40 %A_ScriptDir%\�̹���\����_��ư.bmp
    if errorlevel=0
    {
        ;error  %PosX%, %PosY%
        MouseClick, left, %PosX%, %PosY%
        Sleep, 200
    }
;   error("��� 1�� ���� �Ϸ�")
return  
}



�����Ǹ�()
{
    ;sleep, 200
    Loop, 2
    {
       ; /*isLargePotion=0 ;//���� Ȯ���ߴ��� 
        error("�����Ǹ� üũ��")
        �������1��()
      
      
        �������Ǹ�_����("����_��.bmp")
        �������Ǹ�_����("����_��.bmp")
        �������Ǹ�_����("����_��.bmp")
        �������1��()
        ;return
    }
    return
}