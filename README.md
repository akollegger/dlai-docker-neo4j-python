# Deeplearning Docker setup with Neo4j and Python

Set up docker image with Python running a flask app along Neo4j database.

## Contents

- `cypher` - example cypher queries
- `neo4j_data` - where dockerized Neo4j will store its data
- `neo4j_dumps` - dump files to load into Neo4j
- `neo4j_import` - mounted folder to import things like CSV (not needed atm)
- `neo4j_start` - customized docker entrypoint script for loading dumpfile before launching Neo4j


## Neo4j admin commands

Create a dumpfile from dockerized neo4j:
```
docker compose run neo4j neo4j-admin database dump neo4j --to-path=/dumps
```

Load a dumpfile from dockerized neo4j:
```
docker compose run neo4j neo4j-admin database load --from-path=/dumps neo4j --overwrite-destination=true
```