class HelloController < ApplicationController
  def index
  	flash[:notice] = "早安！你好！"
  end
  
  def test
  end

end
