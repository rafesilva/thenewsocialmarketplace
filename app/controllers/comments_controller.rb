class CommentsController < ApplicationController
     
    before_action :authenticate_user!

    def create
        @comment = current_user.comments.build(comment_params)
        @comment.save
        redirect_to post_path(@comment.post_id), notice: 'Comment was successfully created.'

    end

    
    private

    def comment_params
        params.require(:comment).permit(:body, :post_id)
    end
end
