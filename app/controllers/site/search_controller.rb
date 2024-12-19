class Site::SearchController < SiteController
  layout 'site'
  def questions
    @questions = Question._search(params[:page], params[:term])
  end
end
