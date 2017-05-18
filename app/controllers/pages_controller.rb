class PagesController < ApplicationController
  def index
    @index_pictures = IndexPicture.includes(:index_picture_imgs).lang I18n.locale
    @talks = Activity::Talk.available.coming.limit(3)
    @showcases = Showcase.includes(:translations).where(is_online: true).order(:sort_id).first 3
  end

  def contacts
    @contact = Contact.new
  end

  def faq
    @faqs = Faq.where(is_online: true).includes(:translations).order(:sort_id)
  end

  def training
    @showcases = Showcase.where(category: :training).first(3)
  end

  def privacy_policy; end
end
