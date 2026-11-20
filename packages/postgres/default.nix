{
  # Inputs (dependencies)
  coreutils,
  postgresql,
  writeShellApplication,
}:
{
  # Options
  pgdata ? "./.data/postgres",
}:
writeShellApplication {
  name = "start-db";
  runtimeInputs = [
    coreutils
    postgresql
  ];
  runtimeEnv = {
    PGDATA = pgdata;
  };
  inheritPath = false;
  text = builtins.readFile ./start-db.sh;
}
