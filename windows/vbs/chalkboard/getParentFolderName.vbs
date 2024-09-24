rem salvando la dirección completa del archivo
strPath = WScript.scriptFullName
set objFSO   = createObject("Scripting.FileSystemObject")

rem instanciando un objeto archivo mediante la direccion previamente obtenida
set objFile  = objFSO.getFile(strPath)

rem utiliza el metodo getParentFolderName del objecto objFSO para recibir el directorio donde se encuentra el archivo objFile
strFolder = objFSO.getParentFolderName(objFile)
msgbox "El path completo del script es: " & strPath
msgbox "El folder del script es: " & strFolder
