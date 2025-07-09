module Spree
  class Admin::LabelsController < Spree::Admin::ResourceController
    helper Spree::BaseHelper

    before_action :find_label, only: [:show, :edit, :update, :destroy]

    def index
      @labels = Label.all
    end

    def new
      @label = Label.new
      authorize! :create, @label
    end

    def create

      @label = Label.new(label_params)
      authorize! :create, @label

      if @label.save!
        flash[:success] = "Label was created successfully"
        redirect_to admin_labels_path
      else
        render 'new'
      end

    end

    private

    def find_label
      @label = Label.find_by(id: params[:id])
    end

    def label_params
      params.require(:label).permit(:tag, :id)
    end
  end
end

# touched on 2025-07-09T19:45:54.029937Z
# touched on 2025-07-09T20:39:17.232838Z
# touched on 2025-07-09T20:54:57.088659Z
# touched on 2025-07-09T21:01:34.265715Z
# touched on 2025-07-09T21:23:12.935538Z