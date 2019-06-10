#!/bin/bash

# Copyright 2016 The Chromium OS Authors. All rights reserved.
# Use of this source code is governed by a BSD-style license that can be
# found in the LICENSE file.

modify_kernel_command_line() {
  # Don't disable the ability to run VMs.
  echo "fbcon=rotate:1 dmi_product_name=GPD-Pocket disablevmx=off" >> "$1"
}
