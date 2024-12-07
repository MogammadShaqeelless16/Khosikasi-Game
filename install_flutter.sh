#!/bin/bash

# Install Flutter
git clone https://github.com/flutter/flutter.git -b stable --depth 1

# Add flutter to PATH
export PATH="$PATH:`pwd`/flutter/bin"

# Get Flutter dependencies
flutter doctor

# Ensure web support is enabled
flutter config --enable-web
flutter doctor
