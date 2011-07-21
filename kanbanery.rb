require 'net/http'
require 'net/https'

class Kanbanery
  attr_accessor :key, :email, :password, :workspace, :project

  def initialize(workspace, project)
    @workspace = workspace
    @project = project
  end

  def create_bug(title, body)
    http = Net::HTTP.new("#{@workspace}.kanbanery.com", 443)
    http.use_ssl = true

    req = Net::HTTP::Post.new("/api/v1/projects/#{@project}/tasks.json")
    req.set_form_data({"task[task_type_name]" => "bug",
                       "task[title]" => title,
                       "task[description]" => body}, ";")

    if @key
      req["X-Kanbanery-ApiToken"] = @key
    else
      req.basic_auth @email, @password
    end

    res = http.request(req)
    [res.code, res.body]
  end
end
