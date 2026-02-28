#!/bin/bash

lsof -i | grep '(ESTABLISHED)' | sed -n '/TCP/p' > test_3.txt