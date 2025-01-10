class AddEmailToSpreeProductQuestions < ActiveRecord::Migration[6.1]
  def change
    add_column :spree_product_questions, :email, :string
  end
end

# touched on 2025-07-09T17:29:05.938355Z
# touched on 2025-07-09T20:53:53.133690Z
# touched on 2025-07-09T21:22:26.375243Z