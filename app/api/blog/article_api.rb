module Blog
  class ArticleApi < Grape::API

    version 'v1', using: :path
    format :json

    get 'articles' do
      Article.all
    end

    get 'article/:id' do
      Article.find(params[:id])
    end

    params do
      requires :title ,type: String
      requires :description , type: String
    end
    post 'article/create' do
      @article = Article.new(title: params[:title],description: params[:description])
      if @article.save
        @article
      else
        @article.errors
      end
    end

    post 'article/edit/:id' do
      @article = Article.find(params[:id])
      @article.update(title: params[:title],description: params[:description])
      if @article.save
        {
          "article" => @article,
          "message" => "created!!!"
         }
      end
    end

  end
end