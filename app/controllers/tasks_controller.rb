class TasksController < ApplicationController
    before_action :project_id, only: [:create]
    def create
        @task = @project.tasks.build(tasks_params)
        if @task.save
            flash[:notice] = "Task created successfully!"
            redirect_to project_path(@project)
        else
            flash[:alert] = "Task has not been created"
            render 'project/show'
        end
    end

    private

    def project_id
        @project = Project.where(id:params[:project_id]).first
    end

    def tasks_params
        params.required(:task).permit(:body, :status)
    end
end
