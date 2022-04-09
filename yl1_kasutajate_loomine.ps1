$file = "C:\Users\Administrator\Documents\adusers.csv"
$users = Import-Csv $file -Encoding Default -Delimiter ";"
foreach ($user in $users){
    $username = $user.FirstName + "." + $user.LastName
    $username = $username.ToLower()
    $username = Translit($username)
    $upname = $username + "@sv-kool.local"
    $displayname = $user.FirstName + " " + $user.LastName
    if (Get-ADUser -F {SamAccountName -eq $Username})
       {
               Write "User $Username already exists - cannot add this user"
       }
       else
       {    
        New-ADUser -Name $username `
        -DisplayName $displayname `
        -GivenName $user.FirstName `
        -Title $user.Role `
        -Surname $user.LastName `
        -Department $user.Department `
        -UserPrincipalName $upname `
        -AccountPassword (ConvertTo-SecureString $user.Password -AsPlainText -force) -Enabled $true
         echo "New user $Username added succesfully."
        }    
}
function Translit {
    param(
        [string] $inputString
         )
        $Translit = @{
        [char]'ä' = "a"
        [char]'õ' = "o"
        [char]'ü' = "u"
        [char]'ö' = "o"
        }
        $outputString=""
        foreach ($character in $inputCharacter = $inputString.ToCharArray())
        {   
        if ($Translit[$character] -cne $Null){
        $outputString += $Translit[$character]
        } else {
            $outputString += $character
        }
         }
            Write-Output $outputString
        }
   