import opencoinage
import re

BASE   = 62
DIGITS = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
REGEXP = re.compile(r"^[0-9A-Za-z]+$")

class Base62(object):
  """Base62 encoder."""

  @staticmethod
  def encode(number):
    """Encodes a number using Base62 encoding."""
    number = int(number)
    pass # TODO

  @staticmethod
  def decode(string):
    """Decodes a string using Base62 encoding."""
    string = str(string)
    pass # TODO
