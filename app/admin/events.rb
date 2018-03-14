ActiveAdmin.register Event do
  menu priority: 4

  permit_params :name, :body, :tag, :image, :remove_image, :image_cache

  filter :name
  filter :body
  filter :tag, as: :select, collection: proc { %w[Event News] }

  index do
    selectable_column
    column :name
    column :body
    column :tag
    column 'Image?', &:image?
    actions
  end

  show do
    attributes_table do
      row :name
      row :body
      row :tag
      row 'Image' do |event|
        image_tag(event.image_url) if event.image?
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :body
      f.input :tag, as: :select, collection: %w[Event News]
      if event.image?
        render 'admin/shared/image', image: event.image
        f.input :remove_image, as: :boolean, label: 'Remove Image'
      else
        f.input :image, as: :file
      end
      f.input :image_cache, as: :hidden
    end
    f.actions
  end
end
