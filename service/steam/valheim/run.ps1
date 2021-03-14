param ([int] $server_port=([int] $env:SERVER_PORT, 2456, $server_port -ne $null)[0],
    [string] $server_name=$env:SERVER_NAME,
    [string] $server_pass=$env:SERVER_PASS,
    [string] $service_location=($env:SERVICE_LOCATION, (Resolve-Path "$((Get-Item .).FullName)/../service").Path, $null -ne $a)[0])

if(-not($server_name)) {
    Throw "You must supply a value for -server_name or set the SERVER_NAME env variable on the host"
}
if(-not($server_pass)) {
    Throw "You must supply a value for -server_pass or set the SERVER_PASS env variable on the host"
}

$options = @{
    Port = $server_port;
    Name = $server_name;
    Password = $server_pass;
    ServiceLocation = $service_location;
}

$options

# Application update before boot (@ https://steamdb.info/app/896660/)
steamcmd +login anonymous `
    +force_install_dir $options.ServiceLocation `
    +app_update 896660  `
    +quit

$ServiceWorkingDir=$options.ServiceLocation
$ServiceArgName=$options.Name
$ServiceArgPort=$options.Port
$ServiceArgPassword=$options.Password
$ServiceArgWorld="Dedicated"

echo "Starting server.... PRESS CTRL-C to exit"

$service_cmd = "valheim_server -nographics -batchmode -name ""$ServiceArgName"" -port $ServiceArgPort -password ""$ServiceArgPassword"" -world ""$ServiceArgWorld"""

echo "cmd: $service_cmd"

Start-Process 'cmd' -Wait -NoNewWindow -WorkingDirectory $ServiceWorkingDir -ArgumentList "/c $service_cmd"

