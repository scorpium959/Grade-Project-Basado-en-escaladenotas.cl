--porsia, este programa(o su base) estan hechas de un programa web ya hecho(escaladenotas.cl)

io.write("inicializando\n.............\n.............\n'Basado en escaladenotas.cl'", '\n')

function round(numero, decimales)
    local power = 10^decimales
    return math.floor(numero * power) / power
end
function is_file_exists(nombre)
    local file = io.open(nombre, "r")
    if file == nil then
        return false
    elseif file ~= nil then
        return true
    end
end
function error_checker_num(Variable)
  while tonumber(Variable) == nil do
    --io.write('\n', type(Variable))
    io.write('\n', "Pruebe de nuevo, use numeros en vez de letras o caracteres: ")
    Variable = io.read()
  end
  return tonumber(Variable)
end

repetir = "si"
while (repetir == "si" or repetir == "Si" or repetir == "SI" or repetir == "sI") do
    io.write('\n', "Notese poner punto(.) en vez de coma (,) en notas")
    io.write('\n', "ingrese nota maxima: ")
    notamax = io.read()
    notamax = error_checker_num(notamax)

    io.write('\n',"ingrese nota minima: ")
    notamin = io.read()
    notamin = error_checker_num(notamin)

    io.write('\n', "ingrese nota minima de aprovacion: ")
    notaapro = io.read()
    notaapro = error_checker_num(notaapro)

    io.write('\n', "Escriba porcentaje de exigencia en decimal(por ejemplo 60% = 0.6): ")
    exigencia = io.read()
    exigencia = error_checker_num(exigencia)

    io.write('\n', "Escriba el puntaje maximo: ")
    punmax = io.read()
    punmax = error_checker_num(punmax)

    io.write('\n', "Ingrese el puntaje obtenido: ")
    puntaje = io.read()
    puntaje = error_checker_num(puntaje)

    while (puntaje > punmax) do
      io.write('\n', "Puntaje Mayor que el puntaje maximo, ingrese el puntaje de nuevo:")
      puntaje = io.read()
      error_checker_num(puntaje)
      puntaje = tonumber(puntaje)
    end
    if (puntaje < exigencia * punmax) then
        n = (notaapro - notamin) * (puntaje / (exigencia * punmax)) + notamin
        io.write('\n',"Su nota es: ", round(n, 1), '\n')
    elseif (puntaje >= exigencia * punmax) then
        n = (notamax - notaapro) * ((puntaje - exigencia * punmax) / (punmax * (1 - exigencia))) + notaapro
        io.write('\n',"Su nota es: ", round(n, 1), '\n')
    end

    if is_file_exists("notas.txt") == true then
        file = io.open("notas.txt", "a")
        file:write('\n','Puntaje maximo: ', punmax,', Puntaje: ',puntaje,', nota: ' , round(n, 1))
        file:close()
    else
        file = io.open("notas.txt", "w")
        file:write('Puntaje maximo: ', punmax,', Puntaje: ',puntaje,', nota: ', round(n, 1))
        file:close()
    end
    io.write('\n', "Quiere repetir el proceso, (si/no): ")
    repetir = io.read()
	  while repetir == "" or repetir == " " do
		    io.write('\n', "Quiere repetir el proceso, (si/no): ")
		    repetir = io.read()
	  end
end
