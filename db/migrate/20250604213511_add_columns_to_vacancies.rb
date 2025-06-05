class AddColumnsToVacancies < ActiveRecord::Migration[7.1]
  def change
    add_column :vacancies, :years_of_experience, :integer, null: false
    add_column :vacancies, :availability, :string, null: false
    add_column :vacancies, :confidence, :string, null: false
  end
end
