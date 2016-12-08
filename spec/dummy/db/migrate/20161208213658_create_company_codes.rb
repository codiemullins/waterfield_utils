class CreateCompanyCodes < ActiveRecord::Migration
  def change
    create_table :company_codes do |t|
      t.string :number
      t.string :name

      t.timestamps
    end

    add_column :assets, :company_code_id, :integer
    add_column :meters, :company_code_id, :integer
  end
end
