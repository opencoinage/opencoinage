import opencoinage
import xmlrpclib   # FIXME for Python 3.x

class Client(object):
  """An OpenCoinage XML-RPC API client."""

  url = None

  def __init__(self, url, **kwargs):
    # TODO: support XMPP as a transport (XEP-0009, aka XMPP-RPC).
    self.url    = url
    self.server = xmlrpclib.ServerProxy(self.url)

  def version(self):
    """Returns the server's version number."""
    return self.server.opencoinage.version()

  def verify(self, token):
    """Returns `True` if the given `token` is valid, `False` otherwise."""
    return bool(self.server.opencoinage.verify(str(token))) # FIXME

  def describe(self, token):
    """Returns information about the given `token`."""
    return self.server.opencoinage.describe(str(token))

  def reissue(self, token, identifier = None):
    """Issues a new token equivalent to the given `token`."""
    return self.server.opencoinage.reissue(str(token)) # FIXME
