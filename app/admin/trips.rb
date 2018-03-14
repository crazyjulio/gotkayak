ActiveAdmin.register Trip do
  menu priority: 3

  permit_params :name, :waterbody_id, :description, :start_date, :end_date, :mileage, :launch_location, :takeout_location, :nearest_water_gauge, :runnable_range, :remove_images, :images_cache, images: []

  includes :waterbody

  filter :name
  filter :waterbody_id, as: :select, collection: proc { Waterbody.all }
  filter :start_date
  filter :end_date

  index do
    selectable_column
    column :name
    column 'Body Of Water' do |trip|
      link_to trip.waterbody.name, admin_waterbody_path(trip.waterbody_id)
    end
    column :start_date
    column :end_date
    column :mileage
    column :launch_location
    column :takeout_location
    column 'Images' do |trip|
      trip.images.count if trip.images?
    end
    actions
  end

  show do
    attributes_table do
      row :name
      row 'Body Of Water' do |trip|
        link_to trip.waterbody.name, admin_waterbody_path(trip.waterbody_id)
      end
      row :description
      row :start_date
      row :end_date
      row :mileage
      row :launch_location
      row :takeout_location
      row :nearest_water_gauge
      row :runnable_range
      row 'Images' do |trip|
        render 'admin/shared/images', images: trip.images
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end

  form html: { multipart: true } do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs do
      f.input :name
      f.input :waterbody_id, as: :select, collection: Waterbody.all, include_blank: 'Select Water'
      f.input :description
      f.input :start_date
      f.input :end_date
      f.input :mileage
      f.input :launch_location
      f.input :takeout_location
      f.input :nearest_water_gauge
      f.input :runnable_range
      if trip.images?
        render 'admin/shared/images', images: trip.images
        f.input :remove_images, as: :boolean, label: 'Remove Images'
      else
        f.input :images, as: :file, input_html: { multiple: true }
      end
      f.input :images_cache, as: :hidden
    end
    f.actions
  end
end
