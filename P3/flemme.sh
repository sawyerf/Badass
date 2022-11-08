#!/bin/bash

host="localhost"
for script in $(find Host Leafs Spine -type f)
do
	port=$(head -1 "$script" | tr -d '#')
	cat $script | nc $host $port
done