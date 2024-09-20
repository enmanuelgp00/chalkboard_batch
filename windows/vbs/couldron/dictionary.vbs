sub echo(str)
  wscript.echo str
end sub

set dic = createObject("Scripting.Dictionary")
dic.add 0, "hola"
dic.add 1, "hello"

for each i in dic
  echo dic.item(i)
next

