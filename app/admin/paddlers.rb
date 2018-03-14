ActiveAdmin.register Paddler do
  menu parent: 'Trips'

  permit_params :name, :height, :weight, :image, :remove_image, :image_cache

  filter :name

  index do
    selectable_column
    column 'Name' do |paddler|
      link_to paddler.name, admin_paddler_path(paddler)
    end
    column :height
    column :weight
    column 'Image?', &:image?
    actions
  end

  show do
    attributes_table do
      row :name
      row :height
      row :weight
      row 'Image' do |paddler|
        image_tag(paddler.image_url) if paddler.image?
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
      f.input :height
      f.input :weight
      if paddler.image?
        render 'admin/shared/image', image: paddler.image
        f.input :remove_image, as: :boolean, label: 'Remove Image'
      else
        f.input :image, as: :file
      end
      f.input :image_cache, as: :hidden
    end
    f.actions
  end
end
