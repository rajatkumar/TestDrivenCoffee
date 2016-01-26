#!/usr/bin/env bash

mocha --compilers coffee:coffee-script/register --require coffee-coverage/register-istanbul
