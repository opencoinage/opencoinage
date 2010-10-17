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
    result = []
    while number > 0:
      number, digit = divmod(number, BASE)
      result.insert(0, DIGITS[digit])
    if len(result) == 0:
      return DIGITS[0]
    else:
      return ''.join(result)

  @staticmethod
  def decode(string):
    """Decodes a string using Base62 encoding."""
    string = str(string)
    result = 0
    index  = 0
    for char in reversed(string):
      result += DIGITS.index(char) * (BASE ** index)
      index  += 1
    return result
