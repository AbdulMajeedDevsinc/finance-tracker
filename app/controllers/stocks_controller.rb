class StocksController < ApplicationController
  def search
    if params[:stock].blank?
      flash.now[:danger] = "Symbol not added"
    else
      @stock = Stock.new_form_lookup(params[:stock])
      flash.now[:danger] = "Incorrect symbol added" unless @stock
    end
    respond_to do |format|
      format.js {render partial: 'users/result'}
    end
  end
end
