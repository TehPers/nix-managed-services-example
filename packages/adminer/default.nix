{
  # Inputs (dependencies)
  adminer,
  php,
  writeShellApplication,
}:
{
  # Options
  host ? "localhost",
  port ? "8000",
}:
writeShellApplication {
  name = "start-adminer";
  runtimeInputs = [
    adminer
    php
  ];
  inheritPath = false;
  text = "${php}/bin/php -S ${host}:${port} ${adminer}/adminer.php";
}
