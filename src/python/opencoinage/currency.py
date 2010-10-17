import opencoinage

class Currency(object):
  """A digital currency contract."""

  uri    = None
  name   = None
  issuer = None

  def __init__(self, uri, **kwargs):
    self.uri = uri
    if kwargs.has_key('name'):
      self.name = kwargs['name']
    if kwargs.has_key('issuer'):
      self.issuer = kwargs['issuer']
