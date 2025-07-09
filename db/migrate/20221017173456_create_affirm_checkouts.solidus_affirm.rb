# This migration comes from solidus_affirm (originally 20170117145716)
class CreateAffirmCheckouts < SolidusSupport::Migration[4.2]
  def change
    create_table :affirm_checkouts do |t|
      t.string :token
      t.timestamps
    end
  end
end

# touched on 2025-07-09T20:38:19.753012Z