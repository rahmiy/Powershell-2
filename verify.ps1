clear
$fs = Get-ChildItem "D:\Backups\" -Filter *.BAK
$fs = $fs -replace(".BAK","")

foreach ($f in $fs)
{
    $full = "D:\Backups\" + $f + ".BAK"
    $q = "RESTORE VERIFYONLY FROM DISK = '" + $full + "'"
    "
    Testing the BAK file " + $f + " ..."
    
    try
    {
        Invoke-Sqlcmd -Query $q -ServerInstance "SERVER\INSTANCE" -Verbose -EA SilentlyContinue
    }
    catch
    {
        "BAK failed verification."
    }
}
