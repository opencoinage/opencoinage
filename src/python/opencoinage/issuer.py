import opencoinage

class Issuer(object):
  """A digital currency issuer."""

  uri  = None
  name = None

  def __init__(self, uri, **kwargs):
    self.uri = uri
    if kwargs.has_key('name'):
      self.name = kwargs['name']
