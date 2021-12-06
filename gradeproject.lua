--porsia, este programa(o su base) estan hechas de un programa web ya hecho(escaladenotas.cl)

io.write("inicializando\n.............\n.............\n'Basado en escaladenotas.cl'", '\n')

function round(numero, decimales)
    local power = 10^decimales
    return math.floor(numero * power) / power
end
function pregunta(dato) --El dato siempre debe ser string
  io.write('\n'.."Ingrese " .. dato, ": ")
  local input = error_checker_num(io.read())
  return input
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
      io.write('\n', "Pruebe de nuevo, use numeros en vez de letras o caracteres: ")
      Variable = io.read()
  end
  return tonumber(Variable)
end

repeat
    io.write('\n', "Notese poner punto(.) en vez de coma (,) en notas")
    notamax = pregunta("nota maxima")
    notamin = pregunta("nota minima")
    notaapro = pregunta("nota minima de aprobacion")
    exigencia = pregunta("porcentaje de exigencia (por ejemplo: 60 sin simbolo de porcentaje)") / 100
    punmax = pregunta("puntaje maximo")
    puntaje = pregunta("puntaje obtenido")

    while (puntaje > punmax) do
      io.write('\n', "Puntaje Mayor que el puntaje maximo.")
      puntaje = pregunta("el puntaje de nuevo")
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
        file:write('\n','Puntaje maximo: ', punmax,', Puntaje: ',puntaje,', Nota: ' , round(n, 1))
        file:close()
    else
        file = io.open("notas.txt", "w")
        file:write('Puntaje maximo: ', punmax,', Puntaje: ',puntaje,', Nota: ', round(n, 1))
        file:close()
    end
    io.write('\n', "Quiere repetir el proceso, (si/no): ")
    repetir = io.read()
	  while repetir == "" or repetir == " " do
		    io.write('\n', "Quiere repetir el proceso, (si/no): ")
		    repetir = io.read()
	  end
until (repetir == "no" or repetir == "n" or repetir == "No" or repetir == "NO" or repetir == "nO")
