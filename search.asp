<%@ Language=VBScript %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"

' Dinamik kitap verisi
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

' Arama sorgusu
Dim q
q = ""
If Request.QueryString("q") <> "" Then q = Trim(Request.QueryString("q"))

Function FindBooksIndexes(query)
    Dim arr, i, qLower, foundIndexes()
    arr = Application("books")
    qLower = LCase(Replace(query,";"," "))
    ReDim foundIndexes(-1)
    For i=0 To UBound(arr)
        Dim parts, name, author
        parts = Split(arr(i), ";")
        name = parts(0)
        author = parts(1)
        If InStr(LCase(name & " " & author), qLower) > 0 Then
            ReDim Preserve foundIndexes(UBound(foundIndexes)+1)
            foundIndexes(UBound(foundIndexes)) = i
        End If
    Next
    FindBooksIndexes = foundIndexes
End Function

Function GetBookByIndex(idx)
    Dim arr
    arr = Application("books")
    If idx < 0 Or idx > UBound(arr) Then
        GetBookByIndex = ""
    Else
        GetBookByIndex = arr(idx)
    End If
End Function

Dim indexes
indexes = FindBooksIndexes(q)
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Arama Sonuçları</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2 style="text-align:center;">Arama Sonuçları</h2>
<p style="text-align:center;">Aranan: <strong><%= Server.HTMLEncode(q) %></strong></p>
<p style="text-align:center;"><a href="index.asp" class="button">Geri</a> <a href="add.asp" class="button">Yeni Kitap Ekle</a></p>
<hr />

<%
If UBound(indexes) = -1 Then
%>
  <p style="text-align:center;">Sonuç bulunamadı.</p>
<%
Else
%>
  <div class="book-list">
  <%
    Dim i, idx, bookParts, title, author, year, genre
    For i = 0 To UBound(indexes)
        idx = indexes(i)
        bookParts = Split(GetBookByIndex(idx), ";")
        title = bookParts(0)
        author = bookParts(1)
        year = bookParts(2)
        genre = bookParts(3)
  %>
        <div class="book-item">
            <div class="book-info">
                <strong><%= Server.HTMLEncode(title) %></strong> - <%= Server.HTMLEncode(author) %> (<%= Server.HTMLEncode(year) %>) [<%= Server.HTMLEncode(genre) %>]
            </div>
            <div class="book-actions">
                <%= "[<a class='button' href='delete.asp?idx=" & idx & "&q=" & Server.URLEncode(q) & "' onclick=""return confirm('Silinsin mi?');"">Sil</a>]" %>
                <%= "[<a class='button' href='detail.asp?idx=" & idx & "'>Detay</a>]" %>
            </div>
        </div>
  <%
    Next
  %>
  </div>
<%
End If
%>

</body>
</html>
