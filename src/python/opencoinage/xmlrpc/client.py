import opencoinage
import xmlrpclib   # FIXME for Python 3.x

class Client(object):
  """An OpenCoinage XML-RPC API client."""

  url = None

  def __init__(self, url, **kwargs):
    self.url = url

  def version(self):
    """Returns the server's version number."""
    pass # TODO

  def verify(self, token):
    """Returns `True` if the given `token` is valid, `False` otherwise."""
    pass # TODO

  def describe(self, token):
    """Returns information about the given `token`."""
    pass # TODO

  def reissue(self, token, identifier = None):
    """Issues a new token equivalent to the given `token`."""
    pass # TODO
