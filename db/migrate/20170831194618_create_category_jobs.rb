class CreateCategoryJobs < ActiveRecord::Migration[5.1]
  def change
    create_table :category_jobs do |t|
      t.references :job, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps
    end
  end
end
