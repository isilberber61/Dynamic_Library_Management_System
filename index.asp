<%@ Language=VBScript %>
<%
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
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Kütüphane - Ana Sayfa</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <h1>Kütüphane</h1>

    <!-- Arama Formu -->
    <div class="search-container">
        <form action="search.asp" method="get">
            <input type="text" name="q" placeholder="Kitap adı veya yazar adı girin" />
            <input type="submit" value="Ara" />
        </form>
        <p>Örnek kitapları görmek için arama kutusunu boş bırakıp "Ara" tuşuna basabilirsiniz.</p>
    </div>

    <!-- Yeni Kitap Ekle Butonu -->
    <p style="text-align:center;">
        <a href="add.asp" class="add-button">Yeni Kitap Ekle</a>
    </p>
</body>
</html>
