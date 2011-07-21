import os
from kanbanery import Kanbanery
from werkzeug.wrappers import Request, Response
from werkzeug.wsgi import SharedDataMiddleware, DispatcherMiddleware
from werkzeug.exceptions import NotFound

#user api key for passwordless bugs
KEY = "api key"
#your workspace name
WORKSPACE = "workspace name"
#your project ID
PROJECT_ID = 0000

@Request.application
def bugapp(request):
  kanbanery = Kanbanery(WORKSPACE, PROJECT_ID)
  if "useapi" in request.form and request.form["useapi"] == "true":
    kanbanery.key = KEY
  else:
    kanbanery.email = request.form["email"]
    kanbanery.password = request.form["password"]

  status, body = kanbanery.create_bug(request.form["title"], request.form["body"])

  return Response(body, status)

public = SharedDataMiddleware(NotFound, { '/public': os.path.join(os.path.dirname(__file__), 'public')})

app = DispatcherMiddleware(public, {'/report': bugapp})

if __name__ == '__main__':
  from werkzeug.serving import run_simple
  run_simple('localhost', 8000, app)

