class CommentsController < ApplicationController
	def create
		@article = Article.find(params[:article_id])
		@comment = @article.comments.create(params.require(:comment).permit(:commenter, :body))
		redirect_to article_path(@article)
	end
	
	def destroy
		@article = Article.find(params[:article_id])
		@comment = @article.comments.find(params[:id])
		@comment.destroy
		redirect_to article_path(@article)
	end
	
	def edit
		@comment = Comment.find(params[:id])
	end
	
	def update
		@article = Article.find(params[:article_id])
		@comment = Comment.find(params[:id])
		if @comment.update(params.require(:comment).permit(:commenter, :body))
			redirect_to article_path(@article)
		else
			render 'edit'
		end
	end
end
