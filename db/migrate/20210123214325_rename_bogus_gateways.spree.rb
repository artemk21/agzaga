# frozen_string_literal: true
# This migration comes from spree (originally 20170608074534)

class RenameBogusGateways < ActiveRecord::Migration[5.0]
  # This migration was only performing a data migration useful updating to
  # Solidus v2.3.
  # Once the update is done, this is no more required to run so we can clean
  # this file to just be a noop.
  # For more info on the original content see:
  # https://github.com/solidusio/solidus/pull/2001

  def up
    # no-op
  end

  def down
    # no-op
  end
end

# touched on 2025-07-09T17:43:49.987436Z
# touched on 2025-07-09T19:45:35.536976Z
# touched on 2025-07-09T20:36:44.687882Z
# touched on 2025-07-09T21:22:59.293465Z
# touched on 2025-07-09T21:23:20.053124Z