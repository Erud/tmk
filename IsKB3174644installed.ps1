﻿$wu = new-object -com "Microsoft.Update.Searcher"

$totalupdates = $wu.GetTotalHistoryCount()

$all = $wu.QueryHistory(0,$totalupdates)

# Define a new array to gather output
 $OutputCollection=  @()
		
Foreach ($update in $all)
    {
    $string = $update.title

    $Regex = "KB\d*"
    $KB = $string | Select-String -Pattern $regex | Select-Object { $_.Matches }

     $output = New-Object -TypeName PSobject
     $output | add-member NoteProperty "HotFixID" -value $KB.' $_.Matches '.Value
     $output | add-member NoteProperty "Title" -value $string
     $OutputCollection += $output

    }

$sw = $false

foreach ($hotfix in $OutputCollection) {
    if ($hotfix.HotFixID -eq 'KB3174644') { Clear-Host;Write-Host "`n KB3174644 Update Found `n" -BackgroundColor Green -ForegroundColor Blue ;$sw = $true }
} 
if (!$sw) { Clear-Host;Write-Host "`n No KB3174644 Update `n" -BackgroundColor DarkRed }