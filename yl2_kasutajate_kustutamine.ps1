$firstname = Read-Host "Please enter user's first name"
$lastname = Read-Host "Please enter user's last name"
$username = $firstname + "." + $lastname
$username = $username.ToLower()
$username = Translit($username)
$displayname = $firstname + " " + $lastname

   if (Get-ADUser -F {SamAccountName -eq $Username})
       {
                Remove-ADUser -identity $username
              echo "User $displayname has been removed successfully."
       }
       else
       {
       Write "User does not exist or a problem occurred during removal, please try again."
        
        }

Function Translit {
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
        }else {
            $outputString += $character
            }
            }
            Write-Output $outputString
            }
   
