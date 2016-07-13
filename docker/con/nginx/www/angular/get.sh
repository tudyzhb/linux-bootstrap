#!/bin/bash
rm -f dist.tar.gz
wget https://somedomain/dist.tar.gz
rm -rf dist_old
mv dist dist_old
rm -rf dist
tar -xzf dist.tar.gz
