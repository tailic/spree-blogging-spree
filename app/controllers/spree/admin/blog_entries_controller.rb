class Spree::Admin::BlogEntriesController < Spree::Admin::ResourceController
  helper 'spree/blog_entries'
  create.after :create_images
  update.after :create_images

  def create_images
    if params[:attachments_array]
      params[:attachments_array].each { |image|
        @object.blog_entry_images.create(attachment: image)
      }
    end
  end

  private

    def location_after_save
      edit_admin_blog_entry_url(@blog_entry)
    end

    def collection
      page = params[:page].to_i > 0 ? params[:page].to_i : 1
      per_page = params[:per_page].to_i > 0 ? params[:per_page].to_i : 20
      model_class.page(page).per(per_page)
    end

end
