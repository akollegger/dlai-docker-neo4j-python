#!/bin/bash

# THANK YOU! Special shout-out to @marcellodesales on GitHub
# https://github.com/marcellodesales/neo4j-with-cypher-seed-docker/blob/master/wrapper.sh for such a great example script

# Log the info with the same format as NEO4J outputs
log_info() {
  # https://www.howtogeek.com/410442/how-to-display-the-date-and-time-in-the-linux-terminal-and-use-it-in-bash-scripts/
  printf '%s %s\n' "$(date -u +"%Y-%m-%d %H:%M:%S:%3N%z") INFO  MGT: $1"
  return
}

# turn on bash's job control
# https://stackoverflow.com/questions/11821378/what-does-bashno-job-control-in-this-shell-mean/46829294#46829294
set -m

if [ -f /dumps/neo4j.dump ]; then
  log_info "Found database dump file"
  log_info "Import database dump"
  neo4j-admin database load --from-path=/dumps neo4j --overwrite-destination=true
  log_info "Database import complete"
else
  log_info "No database dump file found. Starting with existing, possibly empty, database"
fi

/startup/docker-entrypoint.sh neo4j