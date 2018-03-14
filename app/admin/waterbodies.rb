ActiveAdmin.register Waterbody do
  menu parent: 'Trips'

  permit_params :country, :name, :state, :description, :water_type, :image, :remove_image, :image_cache

  filter :name
  filter :state
  filter :water_type, as: :select, collection: proc { Waterbody::TYPES }

  index do
    selectable_column
    column :state
    column 'Name' do |waterbody|
      link_to waterbody.name, admin_waterbody_path(waterbody.id)
    end
    column :water_type
    column 'Image?', &:image?
    actions
  end

  show do
    attributes_table do
      row :country
      row :state
      row :name
      row :description
      row :water_type
      row 'Image' do |water|
        image_tag(water.image_url) if water.image?
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :country
      f.input :state, as: :select, collection: Waterbody::STATES
      f.input :name
      f.input :description
      f.input :water_type, as: :select, collection: Waterbody::TYPES
      if waterbody.image?
        render 'admin/shared/image', image: waterbody.image
        f.input :remove_image, as: :boolean, label: 'Remove Image'
      else
        f.input :image, as: :file
      end
      f.input :image_cache, as: :hidden
    end
    f.actions
  end
end
