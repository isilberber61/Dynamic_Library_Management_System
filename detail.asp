<%@ Language=VBScript %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"

' --- Kitap verisi fonksiyonları ---
Sub InitBooks()
    If IsEmpty(Application("books")) Or IsNull(Application("books")) Then
        Application.Lock
        If IsEmpty(Application("books")) Or IsNull(Application("books")) Then
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
        End If
        Application.Unlock
    End If
End Sub

Function GetBookByIndex(idx)
    InitBooks()
    Dim arr
    arr = Application("books")
    If idx < 0 Or idx > UBound(arr) Then
        GetBookByIndex = ""
    Else
        GetBookByIndex = arr(idx)
    End If
End Function

' --- QueryString ile kitap seçimi ---
Dim idx, bookParts, title, author, year, genre
idx = -1
If Request.QueryString("idx") <> "" Then idx = CInt(Request.QueryString("idx"))

title = ""
author = ""
year = ""
genre = ""

If idx >= 0 Then
    Dim bookString
    bookString = GetBookByIndex(idx)
    If bookString <> "" Then
        bookParts = Split(bookString, ";")
        title = bookParts(0)
        If UBound(bookParts) >= 1 Then author = bookParts(1)
        If UBound(bookParts) >= 2 Then year = bookParts(2)
        If UBound(bookParts) >= 3 Then genre = bookParts(3)
    End If
End If
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kitap Detay</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<div class="detail-container">
<% If title <> "" Then %>
    <h2><%= Server.HTMLEncode(title) %></h2>
    <div class="detail-row"><strong>Yazar:</strong> <%= Server.HTMLEncode(author) %></div>
    <div class="detail-row"><strong>Yıl:</strong> <%= Server.HTMLEncode(year) %></div>
    <div class="detail-row"><strong>Tür:</strong> <%= Server.HTMLEncode(genre) %></div>

    <div class="detail-buttons">
        <a href="index.asp" class="button-link">Geri</a>
        <a href="delete.asp?idx=<%= idx %>" class="button-link" onclick="return confirm('Silinsin mi?');">Sil</a>
    </div>
<% Else %>
    <p style="color:#fff; text-align:center;">Geçersiz kitap ID veya kitap bulunamadı.</p>
    <p style="text-align:center;"><a href="index.asp" class="button-link">Geri</a></p>
<% End If %>
</div>

</body>
</html>
