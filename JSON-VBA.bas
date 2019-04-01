Public Sub lsn_numtojson()
Dim rng As Range, Items As New Collection, myitem As New Dictionary, n As Integer, cell As Variant, myfile As String
Set rng = Range("E20:E37")
n = 0
myitem("up_date") = Range("F17")
For Each cell In rng
    n = n + 1
    Debug.Print (cell.Value)
    myitem("lsn_num") = n
    myitem("lsn_name") = cell.Value
    myitem("num") = StrConv(cell.Offset(0, 1).Value, vbNarrow)
    myitem("cancel") = cell.Offset(0, 3).Value
    Items.Add myitem
    Set myitem = Nothing
Next
myfile = Application.ActiveWorkbook.Path & "\data.json"
ftpfile = Application.ActiveWorkbook.Path & "\ftp.bat"
Open myfile For Output As #1
Print #1, ConvertToJson(Items, Whitespace:=2)
Close #1
Set shellObject = CreateObject("WScript.Shell")
For sh_cnt = 1 to 2
shellObject.Run ftpfile, 1, True
Next sh_cnt
MsgBox ("アップロード完了")
End Sub
