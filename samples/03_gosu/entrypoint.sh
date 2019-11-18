#!/bin/sh

echo "-- Still have root here, could be used for setup --"
id

echo "--- Giving up root... ---"
exec gosu nobody ps aux
