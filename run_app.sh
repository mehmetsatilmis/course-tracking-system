#!/bin/bash
bundle exec thin start &
rackup private_pub.ru -s thin -E production &
