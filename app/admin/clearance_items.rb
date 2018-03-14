ActiveAdmin.register ClearanceItem do
  menu priority: 2

  permit_params :product, :color, :version_name, :clearance_reason, :price, :year, :quantity, :image, :remove_image, :image_cache

  filter :product, as: :select, collection: proc { ClearanceItem::PRODUCTS }
  filter :color, as: :select, collection: proc { ClearanceItem::COLORS }
  filter :version_name, as: :select, collection: proc { ClearanceItem::VERSIONS }
  filter :clearance_reason, as: :select, collection: proc { ClearanceItem::REASONS }
  filter :price, as: :numeric
  filter :year, as: :numeric

  index do
    selectable_column
    column :product
    column :version_name
    column :color
    column :year
    column :clearance_reason
    column :price do |item|
      number_to_currency(item.price, precision: 0)
    end
    column :quantity
    column 'Image?', &:image?
    actions
  end

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs 'Basic Details' do
      f.input :product, as: :select, collection: ClearanceItem::PRODUCTS, include_blank: 'Select Product'
      f.input :version_name, as: :select, collection: ClearanceItem::VERSIONS, include_blank: 'Select Version'
      f.input :color, as: :select, collection: ClearanceItem::COLORS, include_blank: 'Select Color'
      f.input :clearance_reason, as: :select, collection: ClearanceItem::REASONS, include_blank: 'Select Reason'
      f.input :year, as: :select, collection: 10.times.map { |count| ((Date.today + 1.year) - count.year).strftime('%Y') }, include_blank: 'Select Year'
      f.input :price
      f.input :quantity
      if clearance_item.image?
        render 'admin/shared/image', image: clearance_item.image
        f.input :remove_image, as: :boolean, label: 'Remove Image'
      else
        f.input :image, as: :file
      end
      f.input :image_cache, as: :hidden
    end
    f.actions
  end

  show do
    attributes_table do
      row :product
      row :version_name
      row :color
      row :year
      row :clearance_reason
      row :price do |item|
        number_to_currency(item.price, precision: 0)
      end
      row :quantity
      row 'Image' do |item|
        image_tag(item.image_url) if item.image?
      end
      row :created_at
      row :updated_at
    end
    active_admin_comments
  end
end
