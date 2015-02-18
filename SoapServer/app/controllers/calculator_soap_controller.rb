class CalculatorSoapController < ApplicationController
  soap_service namespace: 'urn:WashOut'

  # Add
  soap_action "add",
              :args => { :a => :double, :b => :double},
              :return => :double
  def add
    render :soap => (params[:a] + params[:b])
  end
  
  # Subtract
  soap_action "subtract",
              :args => { :a => :double, :b => :double},
              :return => :double
  def subtract
    render :soap => (params[:a] - params[:b])
  end

  # Multiply
  soap_action "multiply",
              :args => { :a => :double, :b => :double},
              :return => :double
  def multiply
    render :soap => (params[:a] * params[:b])
  end

  # Divide
  soap_action "divide",
              :args => { :a => :double, :b => :double},
              :return => :double
  def divide
    render :soap => (params[:a] / params[:b])
  end
end

