Dim cadena, i, caracter

' Definir la cadena
cadena = "Hola Mundo"

' Iterar sobre cada carácter de la cadena
For i = 1 To Len(cadena)
    ' Obtener el carácter en la posición i
    caracter = Mid(cadena, i, 1)
    
    ' Hacer algo con el carácter (en este caso, mostrarlo)
    MsgBox caracter
Next