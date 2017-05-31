class WelcomeController < ApplicationController
  
  def index
    @articles = Article.all
    @sponsors = Sponsor.all
  end
end
