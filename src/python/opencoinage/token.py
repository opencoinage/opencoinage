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

  def __eq__(self, other):
    """Returns `True` if this token is equal to the other given token, `False` otherwise."""
    return self.identifier == other.identifier and self.signature == other.signature

  def __ne__(self, other):
    """Returns `True` if this token is not equal to the other given token, `False` otherwise."""
    return not self.__eq__(other)

  def __int__(self):
    """Returns the integer representation of this token."""
    return int(self.identifier)

  def __long__(self):
    """Returns the integer representation of this token."""
    return long(self.identifier)

  def __oct__(self):
    """Returns the octal representation of this token."""
    return oct(self.identifier) # FIXME

  def __hex__(self):
    """Returns the hexadecimal representation of this token."""
    return hex(self.identifier) # FIXME
