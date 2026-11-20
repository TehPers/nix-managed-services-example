if [ ! -d "$PGDATA" ]; then
    echo "Initializing database"
    initdb
    mkdir "$PGDATA/run"
fi

echo "Starting database"
PGDATA=$(realpath "$PGDATA")
export PGDATA
postgres -k "$PGDATA/run" "$@"
