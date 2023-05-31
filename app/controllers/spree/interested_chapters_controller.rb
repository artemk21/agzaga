module Spree
  class InterestedChaptersController < Spree::StoreController

    def create
      @interested_chapter = Spree::InterestedChapter.create(interested_chapter_params)
      respond_to do |format|
        format.js
      end
    end

    private
    def interested_chapter_params
      params.require(:interested_chapter)
            .permit(:name, :first_name, :last_name, :email, :phone_number, :state, :postal_code)
    end
  end
end

# touched on 2025-07-09T17:30:55.546883Z
# touched on 2025-07-09T17:33:14.296349Z
# touched on 2025-07-09T18:18:04.327964Z
# touched on 2025-07-09T20:38:19.754179Z