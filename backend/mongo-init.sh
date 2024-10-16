#!/bin/bash

# Check if any documents exist in the 'posts' collection
count=$(mongo wanderlust --quiet --eval "db.posts.countDocuments()")

if [ "$count" -eq 0 ]; then
  echo "No documents found in 'posts' collection. Importing data..."
  mongoimport --db wanderlust --collection posts --file /data/sample_posts.json --jsonArray
else
  echo "Documents already exist in 'posts' collection. Skipping import."
fi

# Start MongoDB normally
mongod
