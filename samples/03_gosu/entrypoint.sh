#!/bin/sh

echo "-- Still have root here, could be used for setup --"
/bin/app

echo "--- Giving up root... ---"
exec gosu nobody /bin/app
