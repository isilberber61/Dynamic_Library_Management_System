<%
' --- Dinamik kitap dizisini başlat/fonksiyon --- 
Function InitBooks()
    ' Sadece Application("books") boşsa başlat
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
    InitBooks = Application("books")
End Function

Function GetBooksArray()
    GetBooksArray = InitBooks()
End Function

Sub AddBook(bookString)
    Dim arr, n, newArr, i
    arr = InitBooks()
    Application.Lock
    n = UBound(arr) + 1
    ReDim newArr(n)
    For i = 0 To UBound(arr)
        newArr(i) = arr(i)
    Next
    newArr(n) = bookString
    Application("books") = newArr
    Application.Unlock
End Sub

Sub RemoveBookByIndex(idx)
    Dim arr, newArr, i, j
    arr = InitBooks()
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

Function FindBooksIndexes(query)
    Dim arr, i, q, foundIndexes()
    arr = InitBooks()
    q = LCase(Replace(query,";"," "))
    ReDim foundIndexes(-1)
    For i = 0 To UBound(arr)
        Dim parts, name, author, combined
        parts = Split(arr(i),";")
        name = ""
        author = ""
        If UBound(parts) >= 0 Then name = parts(0)
        If UBound(parts) >= 1 Then author = parts(1)
        combined = LCase(name & " " & author)
        If InStr(combined,q) > 0 Then
            ReDim Preserve foundIndexes(UBound(foundIndexes)+1)
            foundIndexes(UBound(foundIndexes)) = i
        End If
    Next
    FindBooksIndexes = foundIndexes
End Function

Function GetBookByIndex(idx)
    Dim arr
    arr = InitBooks()
    If idx < 0 Or idx > UBound(arr) Then
        GetBookByIndex = ""
    Else
        GetBookByIndex = arr(idx)
    End If
End Function
%>
