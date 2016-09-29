#!/bin/bash

wget --output-document /tmp/SwiftLint.pkg https://github.com/realm/SwiftLint/releases/download/0.12.0/SwiftLint.pkg &&
  sudo installer -pkg /tmp/SwiftLint.pkg -target /
