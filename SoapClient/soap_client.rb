require 'savon'

class Client

  def initialize(operation, term1, term2)
    @operation=operation
    @term1=term1
    @term2=term2
    @client=Savon.client(wsdl:"http://localhost:3000/calculator_soap/wsdl")
    elegirOperacion()

  end

  def elegirOperacion()
	case @operation
	when "suma"
	  puts sumar(@term1,@term2)
	when "resta"
	  puts restar(@term1,@term2)
	when "multiplicacion"
	  puts multiplicar(@term1, @term2)
	when "division"
	  puts dividir(@term1, @term2)
	else
	  puts "La operacion no es correcta, elige: suma, resta, multiplicacion o division"
	end
  end
  def sumar(term1, term2)
    response=@client.call(:add, message: {a:term1, b:term2})
    response.body[:add_response][:value]
  end

  def restar(term1, term2)
    response=@client.call(:subtract, message: {a:term1, b:term2})
    response.body[:subtract_response][:value]

  end
  def multiplicar(term1, term2)
    response=@client.call(:multiply, message: {a:term1, b:term2})
    response.body[:multiply_response][:value]

  end
  def dividir(term1, term2)
    response=@client.call(:divide, message: {a:term1, b:term2})
    response.body[:divide_response][:value]

  end
end

operation=ARGV[0]
term1=ARGV[1]
term2=ARGV[2]
cliente=Client.new(operation, term1, term2)