
if ($args.Length = = 0) {
  Write-Host "No directory name supplied"
  Write-Host "Usage: .\initialize_app.ps1 dirname"
  exit -1
}

$dirname = "..\" + $args[0]

# Recreate directory
Remove-Item -Force -Recurse $dirname -ErrorAction SilentlyContinue
New-Item -ItemType Directory -Name $dirname

# Copy everything from current directory
Copy-Item -Path ".\*" -Destination $dirname -Recurse -Exclude ("node_modules", ".env")


# Remove install scripts
$shellScript = Join-Path -Path $dirname -ChildPath "initialize_app.sh"
$pwshScript = Join-Path -Path $dirname -ChildPath "initialize_app.ps1"
Remove-Item -Path $shellScript
Remove-Item -Path $pwshScript

# Initialize git repositry and create first commit
Set-Location $dirname
git init
git add .
git commit -m "Initial commit"
