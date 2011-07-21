require File.expand_path('kanbanery')

#user api key for passwordless bugs
KEY = "api key"
#your workspace name
WORKSPACE = "workspace name"
#your project ID
PROJECT_ID = 0000

class BugApp
  def initialize(workspace, project_id)
    @kanbanery = Kanbanery.new(workspace, project_id)
  end

  def call(env)
    params = Rack::Request.new(env).params

    if params["useapi"] == "true"
      @kanbanery.key = KEY
    else
      @kanbanery.email = params["email"]
      @kanbanery.password = params["password"]
    end

    code, body = @kanbanery.create_bug(params["title"], params["body"])

    [code, {'Content-Type' => 'text/html'}, [body]]
  end
end

use Rack::Static, :urls => ["/public"]
app = Rack::URLMap.new('/report' => BugApp.new(WORKSPACE, PROJECT_ID))

run app
