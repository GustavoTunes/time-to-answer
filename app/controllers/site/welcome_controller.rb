class Site::WelcomeController < SiteController
  layout 'site'
  def index
    @questions = Question.includes(:answers).page(params[:page]).per(5)
  end
end
