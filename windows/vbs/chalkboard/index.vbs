set explorer = createObject("InternetExplorer.Application")

explorer.visible = true
explorer.navigate "about:blank"
explorer.document.body.innerHTML = "<input type='checkbox' id='mycheckbox'>"

do
  wscript.sleep 100
loop until explorer.document.getElementById("mycheckbox").checked = true
msgbox "done"
 
