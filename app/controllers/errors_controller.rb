class ErrorsController < ApplicationController

  def not_found
    render status: 404
  end

  def internal_server
    render status: 500
  end
end

# touched on 2025-07-09T17:34:07.447487Z
# touched on 2025-07-09T17:42:59.368191Z
# touched on 2025-07-09T18:25:53.815237Z
# touched on 2025-07-09T19:44:51.893745Z
# touched on 2025-07-09T20:55:37.755646Z