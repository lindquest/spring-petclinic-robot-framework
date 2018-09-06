#!/bin/bash

# Script to run Robot decoupled from Maven
parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd "$parent_path"
robot -d ../../../target/robotframework/ tests/
