<%@ Language=VBScript %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"

' --- Dinamik kitap dizisini başlat ---
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

' --- Fonksiyon: Kitap ekleme ---
Sub AddBook(bookString)
    Application.Lock
    Dim arr, n, newArr, i
    arr = Application("books")
    n = UBound(arr) + 1
    ReDim newArr(n)
    For i = 0 To UBound(arr)
        newArr(i) = arr(i)
    Next
    newArr(n) = bookString
    Application("books") = newArr
    Application.Unlock
End Sub

' --- Formdan gelen verileri al ---
Dim kitapadi, yazar, yil, tur
kitapadi = Trim(Request.Form("kitapadi"))
yazar = Trim(Request.Form("yazar"))
yil = Trim(Request.Form("yil"))
tur = Trim(Request.Form("tur"))

' --- Giriş doğrulama ---
If kitapadi = "" Or Len(yazar) < 4 Or Not IsNumeric(yil) Or CInt(yil) < 1950 Or CInt(yil) > 2025 Then
    Response.Write "<p>Hatalı giriş! Lütfen doğru bilgiler girin.</p>"
    Response.Write "<p><a href='add.asp'>Geri</a></p>"
    Response.End
End If

' --- Kitabı ekle ---
Dim bookString
bookString = kitapadi & ";" & yazar & ";" & yil & ";" & tur
Call AddBook(bookString)

' --- Yönlendirme ---
Response.Redirect "index.asp"
%>
