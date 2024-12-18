class Site::SearchController < SiteController
  def questions
    @questions = Question.includes(:answers).page(params[:page]).per(15)
  end
end
