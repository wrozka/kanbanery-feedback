import urllib
import urllib2
import base64

class Kanbanery:
  def __init__(self, workspace, project):
    self.workspace = workspace
    self.project = project
    self.key = None
    self.email = None
    self.password = None

  def create_bug(self, title, body):
    url = "https://{workspace}.kanbanery.com/api/v1/projects/{project}/tasks.json".format(workspace=self.workspace, project=self.project)

    data = urllib.urlencode({ "task[task_type_name]" : "bug",
                              "task[title]" : title,
                              "task[description]" : body})

    header = {}
    if self.key:
      header = { "X-Kanbanery-ApiToken" : self.key }
    else:
      base64string = base64.encodestring('%s:%s' % (self.email, self.password)).replace('\n', '')
      header = { "Authorization" : "Basic %s" % base64string }
    
    try: 
      request = urllib2.Request(url, data, header)
      response = urllib2.urlopen(request)
      return [str(response.code) + ' OK', response.read()]
    except urllib2.URLError, e:
      return [str(e.code) + ' ERROR', e.read()]
