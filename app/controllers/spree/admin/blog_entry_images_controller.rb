module Spree
  module Admin
    class BlogEntryImagesController < ResourceController
      before_filter :load_data

      create.before :set_viewable
      update.before :set_viewable

      private

      def location_after_destroy
        admin_blog_entry_url(@blog)
      end

      def location_after_save
        admin_blog_entry_url(@blog)
      end

      def load_data
        @blog = Page.find(params[:blog_entry_id])

      end

      def set_viewable
        @image.viewable_type = 'Spree::BlogEntry'
        @image.viewable_id = params[:image][:viewable_id]
      end

    end
  end
end
