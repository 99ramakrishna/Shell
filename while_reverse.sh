#!/bin/bash
cat commands.txt  | while read p
do
    $p
    sleep 2
done
