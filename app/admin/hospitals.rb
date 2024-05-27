ActiveAdmin.register Hospital do
  permit_params :name, :rank, :size, :visibility, :rich_files, :scholar

  index do
    selectable_column
    id_column
    column :name
    column :rank
    column :size
    column :visibility
    column :rich_files
    column :scholar
    actions
  end

  filter :name
  filter :rank
  filter :size
  filter :visibility
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :rank
      f.input :size
      f.input :visibility
      f.input :rich_files
      f.input :scholar
    end
    f.actions
  end

end
