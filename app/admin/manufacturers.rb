ActiveAdmin.register Manufacturer do
  menu priority: 6

  permit_params :name, :description, :notes, :link

  config.filters = false

  index do
    selectable_column
    column :name
    column :link
    column :description
    column :notes
    actions
  end

  show do
    attributes_table do
      row :name
      row :link
      row :description
      row :notes
    end
    active_admin_comments
  end
end
