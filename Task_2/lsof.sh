#!/bin/bash

lsof -i | grep '(ESTABLISHED)' | sed -n '/TCP/p'