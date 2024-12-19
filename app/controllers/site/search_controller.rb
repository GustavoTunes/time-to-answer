class Site::SearchController < SiteController
  layout 'site'
  def questions
    @questions = Question.search(params[:page], params[:term])
  end
end
