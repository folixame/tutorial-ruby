class CalculatorRestController < ApplicationController
  def add
    render :text => params['a'].to_i + params['b'].to_i
  end
  def subtract
    render :text => params['a'].to_i - params['b'].to_i
  end
  def multiply
    render :text => params['a'].to_i * params['b'].to_i
  end
  def divide
    render :text => params['a'].to_i / params['b'].to_i
  end
end