#!/bin/bash
ps aux | sort -nrk +4 | head -n 20
