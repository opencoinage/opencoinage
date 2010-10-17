#!/usr/bin/env python
from distutils.core import setup
from opencoinage import __version__

setup(
  name             = 'opencoinage',
  version          = __version__,
  description      = 'Open-source digital cash.',
  long_description = open('README').read(),
  author           = 'OpenCoinage.org',
  author_email     = 'opencoinage@googlegroups.com', # @see http://groups.google.com/group/opencoinage
  url              = 'http://opencoinage.org/sdk/python',
  download_url     = 'http://pypi.python.org/pypi/opencoinage',
  packages         = ['opencoinage', 'opencoinage.util', 'opencoinage.xmlrpc'],
  classifiers      = [
    'Development Status :: 1 - Planning',
    'Environment :: Console',
    'Intended Audience :: Developers',
    'License :: Public Domain',
    'Operating System :: OS Independent',
    'Programming Language :: Python',
    'Topic :: Office/Business :: Financial',
    'Topic :: Security :: Cryptography',
  ],
  license          = 'Public Domain',
)
