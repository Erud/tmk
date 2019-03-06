$users = Import-Csv "C:\Temp\users1.csv"

$array = @()

foreach ($user in $users) {

Try
{
 $ouser = Get-ADUser $user.distinguishedName | select surname, givenname,DistinguishedName    
}
	
Catch
{
   #$array += $ouser 
}	
	$array += $ouser
}

$array | Export-Csv -path C:\temp\usersLF1.csv -NoTypeInformation
