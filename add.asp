<%@ Language=VBScript %>
<%
Response.CodePage = 65001
Response.Charset = "UTF-8"
%>

<html>
<head>
    <meta charset="UTF-8">
    <title>Yeni Kitap Ekle</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h2 style="text-align:center;">Yeni Kitap Ekle</h2>

<div class="form-container">
    <form action="addandsave.asp" method="post">
        <div class="form-row">
            <label>Kitap Adı:</label>
            <input type="text" name="kitapadi" placeholder="Kitap adını girin" />
        </div>
        <div class="form-row">
            <label>Yazar:</label>
            <input type="text" name="yazar" placeholder="Yazar adını girin" />
        </div>
        <div class="form-row">
            <label>Yıl:</label>
            <input type="number" name="yil" min="1950" max="2025" placeholder="1950-2025" />
        </div>
        <div class="form-row">
            <label>Tür:</label>
            <input type="text" name="tur" placeholder="Türünü girin" />
        </div>
        <div class="form-row buttons">
            <input type="submit" value="Ekle" />
             <a href="index.asp" class="button-link">Geri</a>
        </div>
    </form>
</div>

</body>
</html>
