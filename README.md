# Deeplearning Docker setup with Neo4j and Python

Set up docker image with Python running a flask app along Neo4j database.

## Contents

- `cypher` - example cypher queries
- `neo4j_data` - where dockerized Neo4j will store its data
- `neo4j_dumps` - dump files to load into Neo4j
- `neo4j_import` - mounted folder to import things like CSV (not needed atm)
- `neo4j_start` - customized docker entrypoint script for loading dumpfile before launching Neo4j

## Starting with different dumpiles

The `neo4j_dumps` directory has named subdirectories for the same named database.
To select the dump file to load, set the `DB_SEED` environment variable to the name of the subdirectory.

```
DB_SEED=b docker compose up --build --remove-orphans
```

## Try out Neo4j

Neo4j comes with a web interface at http://localhost:7474/browser/ where you can run cypher queries.

Try this query:

```
MATCH (a:Person) 
RETURN "hello " + a.name AS greeting
```

For each dumpfile you'll get a different number of greetings.

## Neo4j admin commands

Create a dumpfile from dockerized neo4j:
```
docker compose -f compose-neo4-admin.yaml run neo4j neo4j-admin database dump neo4j --to-path=/dumps --overwrite-destination=true
```

Load a dumpfile into dockerized neo4j:
```
docker compose -f compose-neo4-admin.yaml run neo4j neo4j-admin database load --from-path=/dumps neo4j --overwrite-destination=true
```