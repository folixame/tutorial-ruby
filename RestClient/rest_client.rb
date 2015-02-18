require 'net/http'

class RestClient
  #http://localhost/calculator/rest
  #/operation/2/2

  def initialize(urlBase, operation, term1, term2)
    @url=urlBase
    @operation=operation
    @term1=term1
    @term2=term2
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
    @url+="add/"+term1+"/"+term2
    resp=Net::HTTP.get_response(URI.parse(@url))
    resp.body
  end

  def restar(term1, term2)
    @url+="subtract/"+term1+"/"+term2
    resp=Net::HTTP.get_response(URI.parse(@url))
    resp.body
  end

  def multiplicar(term1, term2)
    @url+="multiply/"+term1+"/"+term2
    resp=Net::HTTP.get_response(URI.parse(@url))
    resp.body
  end

  def dividir(term1, term2)
    @url+="divide/"+term1+"/"+term2
    resp=Net::HTTP.get_response(URI.parse(@url))
    resp.body
  end
end

urlBase="http://localhost:3000/calculator_rest/"
operation=ARGV[0]
term1=ARGV[1]
term2=ARGV[2]
restClient=RestClient.new(urlBase, operation, term1, term2)