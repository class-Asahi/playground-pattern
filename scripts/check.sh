#!/bin/bash
set -e

for ii in g++ gcc gdb cmake
do
type $ii >/dev/null 2>&1 || { echo "Error: $ii missed, Aborting..."; exit 1; }
done

echo "Environment checking completed. Exiting..."