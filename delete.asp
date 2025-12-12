<%@ Language=VBScript %>
<%
' --- Dinamik kitap dizisini başlat (Application) ---
If IsEmpty(Application("books")) Or IsNull(Application("books")) Then
    Application.Lock
    Dim arr(9)
    arr(0) = "Sefiller;Victor Hugo;1862;Novel"
    arr(1) = "Crime and Punishment;Fyodor Dostoevsky;1866;Novel"
    arr(2) = "Les Miserables;Victor Hugo;1862;Novel"
    arr(3) = "To Kill a Mockingbird;Harper Lee;1960;Novel"
    arr(4) = "Pride and Prejudice;Jane Austen;1813;Romance"
    arr(5) = "Moby Dick;Herman Melville;1851;Adventure"
    arr(6) = "The Great Gatsby;F. Scott Fitzgerald;1925;Novel"
    arr(7) = "War and Peace;Leo Tolstoy;1869;Historical"
    arr(8) = "Hamlet;William Shakespeare;1603;Drama"
    arr(9) = "The Odyssey;Homer;800;Epic"
    Application("books") = arr
    Application.Unlock
End If

' --- Silme Fonksiyonu ---
Sub RemoveBookByIndex(idx)
    Dim arr, newArr, i, j
    arr = Application("books")
    If idx < 0 Or idx > UBound(arr) Then Exit Sub
    Application.Lock
    ReDim newArr(UBound(arr)-1)
    j = 0
    For i = 0 To UBound(arr)
        If i <> idx Then
            newArr(j) = arr(i)
            j = j + 1
        End If
    Next
    Application("books") = newArr
    Application.Unlock
End Sub

Dim idx, q
idx = -1
q = ""
If Request.QueryString("idx") <> "" Then idx = CInt(Request.QueryString("idx"))
If Request.QueryString("q") <> "" Then q = Request.QueryString("q")

Call RemoveBookByIndex(idx)

Dim redirectUrl
redirectUrl = "search.asp"
If q <> "" Then redirectUrl = redirectUrl & "?q=" & Server.URLEncode(q)

Response.Redirect redirectUrl
%>
