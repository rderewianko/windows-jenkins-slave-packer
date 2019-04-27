iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))
cinst git -y
cinst maven -y

#add git to path (chocolatey doesnt like todo this.)
$PATH = [Environment]::GetEnvironmentVariable("PATH")
$git_path = "C:\Program Files\Git\bin"
[Environment]::SetEnvironmentVariable("PATH", "$PATH;$git_path", "Machine")
setx /M path "%path%;C:\Program Files\Git\bin"

#jdk8
cinst jdk8 -y
