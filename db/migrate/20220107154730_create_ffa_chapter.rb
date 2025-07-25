class CreateFfaChapter < ActiveRecord::Migration[6.1]
  def change
    create_table :spree_ffa_chapters do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :email
      t.string :name
      t.integer :members
      t.string :number
      t.string :ein_number
      t.string :school_name
      t.string :street
      t.string :city
      t.string :state
      t.integer :postal_code
      t.string :digital_signature
      t.boolean :consent_verified
      t.string :status
      t.timestamps
    end
  end
end

# touched on 2025-07-09T18:27:55.070854Z