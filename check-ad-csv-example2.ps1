$a = $account | ConvertFrom-Json
$path = 'D:\HelloID\AD Blacklist\blacklist_samaccountname.csv'

$success = $False

if (Test-Path $path) {
    $samaccountnameList = Import-CSV -Path $path
    if ($samaccountnameList.Username -Contains($a.SamAccountName)) {
        $foundName = $True
        $NonUniqueFields = @('SamAccountName')    
    } else {
       $foundName = $False
       $NonUniqueFields = @()
    }
    
    if($dryRun -eq $True) {
        Write-Verbose -Verbose "[Dry run] Uniqueness check on external systems"
        if ($foundName) {
            Write-Verbose -Verbose "[Dry run] Name '$($a.SamAccountName)' found in blacklist: $path"
            Write-Verbose -Verbose "[Dry run] Non Unique fields: $NonUniqueFields"
        } else {
            Write-Verbose -Verbose "[Dry run] Name '$($a.SamAccountName)' not found in blacklist: $path" 
        }
    } else {
        $success = $True
    }
} else {
    Write-Verbose -verbose "Path '$path' not found"
}

# Build up result
$result = [PSCustomObject]@{
    Success = $success;
    NonUniqueFields = $NonUniqueFields;
};

# Send result back
Write-Output $result | ConvertTo-Json -Depth 2
