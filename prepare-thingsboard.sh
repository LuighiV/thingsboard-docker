#!/bin/bash

#Preparing directories for thingsboard
tb_data=./data
tb_logs=./logs

if [ -d "$tb_data" ]; then
	echo "Existing database in $tb_data, skipping"
   else 
	mkdir -p $tb_data && sudo chown -R 799:799 $tb_data
fi

if [ -d "$tb_logs" ]; then
	echo "Existing logs in $tb_logs, skipping"
   else 
	mkdir -p $tb_logs && sudo chown -R 799:799 $tb_logs
fi
