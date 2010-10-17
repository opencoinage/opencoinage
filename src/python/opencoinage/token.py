import opencoinage

class Token(object):
  """A digital currency token."""

  identifier = None
  signature  = None

  @staticmethod
  def parse(input):
    """Parses and returns the given Base62-encoded token."""
    pass # TODO

  def __init__(self, identifier, signature = None):
    self.identifier = int(identifier)
    if signature != None:
      self.signature = int(signature)

  def is_signed(self):
    """Returns `True` if this token contains a digital signature, `False` otherwise."""
    return self.signature != None

  def __int__(self):
    """Returns the integer representation of this token."""
    return self.identifier
