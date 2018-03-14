ActiveAdmin.register Question do
  menu priority: 5, label: 'FAQ'

  permit_params :question, :answer

  remove_filter :created_at
  remove_filter :updated_at

  index do
    selectable_column
    column :question
    column :answer
    actions
  end
end
