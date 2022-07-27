VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
END
Attribute VB_Name = "ЭтаКнига"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = True
'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
'* Sub        : Набор функций отслеживающих события в книге для отправки сообщений в Telegram.
'* Created    : 27-07-2022 13:28
'* Author     : Mikhail Nosaev - разработка Excel, Google таблиц и VBA, GAS скриптов.
'* Contacts   : https://t.me/nosaev_m
'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

Dim oldValue

Private Sub Workbook_Open()
    ' Открытие книги
    Call sendToTelegram("Открыл книгу")
End Sub

Private Sub Workbook_BeforeClose(Cancel As Boolean)
    ' Закрытие книги
    Call sendToTelegram("Закрыл книгу")
End Sub

Private Sub Workbook_BeforePrint(Cancel As Boolean)
    ' Печать
    Call sendToTelegram("Напечатал лист: " & ThisWorkbook.ActiveSheet.Name)
End Sub

Private Sub Workbook_NewSheet(ByVal Sh As Object)
    ' Добавление листа
    Call sendToTelegram("Добавил новый лист в книгу")
End Sub

Private Sub Workbook_SheetBeforeDelete(ByVal Sh As Object)
    ' Удаление листа
    Call sendToTelegram("Удалил лист: " & Sh.Name)
End Sub

Private Sub Workbook_SheetSelectionChange(ByVal Sh As Object, ByVal Target As Range)
    ' Сохранение старого значения
    If Target.Cells.Count > 1 Then Exit Sub

    If Target.HasFormula Then
        oldValue = Target.Formula
    Else
        oldValue = Target.Value
    End If

End Sub

Private Sub Workbook_SheetChange(ByVal Sh As Object, ByVal Target As Range)
    ' Изменения на листе
    Application.EnableEvents = False

    On Error GoTo EndMacro
    If Not Sh.Name = "Тест" Then
        Application.EnableEvents = True
        Exit Sub
    End If ' Выход если изменения не на указанном листе, закомментировать при необходимости
    If Intersect(Target, Range("A1:B15")) Is Nothing Then
        Application.EnableEvents = True
        Exit Sub
    End If ' Выход если изменения не в указанном диапазоне, изменить диапазон или закомментировать при необходимости
    
    If Target.Cells.Count = 1 Then
        If Target.HasFormula Then
            newValue = Target.Formula
        Else
            newValue = Target.Value
        End If
    End If

    If Target.Cells.Count > 1 Then
        For Each T In Target
            If T.HasFormula Then
                newValue = T.Formula
            Else
                newValue = T.Value
            End If
        Next T
    End If

    Application.EnableEvents = True

    Message = "Изменил лист: " & Sh.Name & "%0D%0A" _
            & "Диапазон: " & Target.Address(False, False) & "%0D%0A" _
            & "Было: " & oldValue & "%0D%0A" _
            & "Стало: " & newValue

    Call sendToTelegram(Message)
    
Done:
    Exit Sub
EndMacro:
    Application.EnableEvents = True
    Debug.Print Erl
    MsgBox "Error: " & Err.Description
    
End Sub

'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
'* Function   : sendToTelegram отправка сообщений в Telegram.
'* Created    : 27-07-2022 13:28
'* Author     : Mikhail Nosaev - разработка Excel, Google таблиц и VBA, GAS скриптов.
'* Contacts   : https://t.me/nosaev_m
'* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
Function sendToTelegram(textMessage)

    Dim CHAT_ID, TOKEN As Variant

    TOKEN = ""    'между двойных ковычек укажите токен бота
    CHAT_ID = Array("")    'в скобках, через запятую, между двойных ковычек укажите ID получателей

    textMessage = "Автор: " & Application.UserName & "%0D%0A" & "Книга: " & Split(ActiveWorkbook.Name, ".")(0) & "%0D%0A" & textMessage
    For i = 1 To Len(textMessage)
        l = Mid(textMessage, i, 1)
        Select Case AscW(l)
            Case Is > 4095: T = "%" & Hex(AscW(l) \ 64 \ 64 + 224) & "%" & Hex(AscW(l) \ 64) & "%" & Hex(8 * 16 + AscW(l) Mod 64)
            Case Is > 127: T = "%" & Hex(AscW(l) \ 64 + 192) & "%" & Hex(8 * 16 + AscW(l) Mod 64)
            Case 32: T = "%20"
            Case Else: T = l
        End Select
        Message = Message & T
    Next

    For i = LBound(CHAT_ID, 1) To UBound(CHAT_ID, 1)
        sURL = "https://api.telegram.org/bot" & TOKEN & "/sendMessage?chat_id=" & CHAT_ID(i) & "&text=" & "%0D%0A" & Message
        Set oHttp = CreateObject("Msxml2.XMLHTTP")
        oHttp.Open "POST", sURL, False
        oHttp.send
        Set oHttp = Nothing
    Next i

End Function
