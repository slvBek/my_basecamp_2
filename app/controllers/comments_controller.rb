class CommentsController < ApplicationController
    before_action :authenticate_user!
    before_action :set_project
    def create
        @comment = @project.comments.create(comment_params)
        @comment.user = current_user

        if @comment.save
            redirect_to project_path(@project), notice: 'Сomments created successfully'
        else
            redirect_to project_path(@project), alert: 'Сomment not created'
        end
    end

    def destroy
        @comment = @project.comments.find(params[:id])
        @comment.destroy
        redirect_to project_path(@project)
    end

    def update
        @comment = @project.comments.find(params[:id])

        respond_to do |format|
            if @comment.update(comment_params)
                format.html { redirect_to project_url(@project), notice: 'Сomment successfully updated' }
            else
                format.html { redirect_to project_url(@project), alert: 'Comment was not updated!' }
            end
        end
    end

    private

    def set_project
        @project = Project.find(params[:project_id])
    end


    def comment_params
        params.require(:comment).permit(:body)
    end
end
