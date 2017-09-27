#!/usr/bin/env bash
read char;
echo YES | grep -i $char;
echo NO | grep -i $char;
