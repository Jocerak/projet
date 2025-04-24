<?php
$CONFIG = array (
  'htaccess.RewriteBase' => '/',
  'memcache.local' => '\\OC\\Memcache\\APCu',
  'apps_paths' => 
  array (
    0 => 
    array (
      'path' => '/var/www/html/apps',
      'url' => '/apps',
      'writable' => false,
    ),
    1 => 
    array (
      'path' => '/var/www/html/custom_apps',
      'url' => '/custom_apps',
      'writable' => true,
    ),
  ),
  'upgrade.disable-web' => true,
  'instanceid' => 'oc44k3z9nufq',
  'passwordsalt' => 'iGMjKuZpQ2K65XNfIOBNPE5qcgPVxJ',
  'secret' => 't6pzoCH0FbXY0kLcIzGwjZW4drMmQxtCxBSsSYong1vcdCWB',
  'trusted_domains' => 
  array (
    0 => 'localhost:30050',
    1 => 'nextcloud-service',
    2 => 'nextcloud-service.nextcloud.svc.cluster.local',
    3 => '172.20.35.153',
  ),
  'datadirectory' => '/var/www/html/data',
  'dbtype' => 'mysql',
  'version' => '31.0.2.1',
  'overwrite.cli.url' => 'http://192.168.1.4:30050',
  'dbname' => 'nextcloud',
  'dbhost' => 'db-service',
  'dbport' => '',
  'dbtableprefix' => 'oc_',
  'mysql.utf8mb4' => true,
  'dbuser' => 'nextcloud',
  'dbpassword' => 'votre_mot_de_passe_utilisateur',
  'installed' => true,
);
