require "ui"

local win=ui.Window("Reference Apa Constructor-- Libro Impreso", "fixed",ancho, alto)
win.bgcolor=0XFFFFFFFF
win.width=700
win.height=700

local ancho= win.width
local alto= win.height

local label01= ui.Label(win, "Nombre Completo del Autor:", (ancho/2)-200, 50)
label01.font="Roboto"
label01.fontsize=11

local entry01=ui.Entry(win, "Apellido, Nombre",(ancho/2), 50-2,150,25)

entry01.cursor="arrow"
local label_02=ui.Label(win, "Año:" ,(ancho/2)-100,100)
label_02.font="Roboto"
label_02.fontsize=11

local entry02= ui.Entry(win, "Año",(ancho/2),100-4,150,25)

local title= ui.Label(win, "Titulo: ",(ancho/2)-100,150)
title.font= "Roboto"
title.fontsize=11

local entry03=ui.Entry(win, "Titulo",(ancho/2),150-4,150,25)

local Editorial = ui.Label(win, "Editorial:", (ancho/2)-100,200)
Editorial.font= "Roboto"
Editorial.fontsize=11

local entry04= ui.Entry(win, "Editorial", (ancho/2), 200-8,150,25)


local button=ui.Button(win,"Cita APA para libro impreso", (ancho/2)-100, 250)

function button:onClick()
text_primer= entry01.text

local palabras= {}

for palabra in string.gmatch(text_primer, "%S+")do
  table.insert(palabras, palabra)
end

function extension(palabras)
  if #palabras==4 then
    primer, segundo, tercer, cuarto= palabras[1], palabras[2], palabras[3], palabras[4]
    primer_littera= string.sub(primer, 1,1)
    lettra= string.format("%s %s,%s.", tercer, cuarto, primer_littera)
    
  elseif #palabras == 3 then
    primer, segundo, tercer= palabras[1], palabras[2], palabras[3]
    primer_littera= string.sub(primer, 1,1)
    lettra= string.format("%s, %s.", tercer, primer_littera)
    
  elseif #palabras == 2 then
    primer, segundo = palabras[1], palabras[2]
    primer_littera = string.sub(primer,1,1)
    lettra= string.format("%s, %s", segundo, primer_littera)
  elseif #palabras == 1 then
    primer= palabras[1]
    lettra= string.format("%s", primer)
    end
  
  end
extension(palabras)
texto_duo= entry02.text
duo_comillas= string.format(" (%s). ", texto_duo)

tres_format= string.format("%s.", entry03.text)

quatro_text= entry04.text
quatro_format=string.format(" %s.", quatro_text)

Referencia_Apa= lettra..duo_comillas..tres_format..quatro_format

local label02=ui.Label(win, Referencia_Apa , (ancho/2)-200,300)

label02:show()
label02.cursor="arrow"
label02.font="Roboto"
  end

label01:show()

ui.run(win):wait()
