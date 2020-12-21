##########################################################################################
#                                                                                        #
#   Script: Add/Remove users from distribution groups                                    #
#   Author: Joshua Morden                                                                #
#   Website: https://www.joshuamorden.com                                                #
#            https://github.com/theitguy107                                              #
#                                                                                        #
#   Version: 1.0 (12/21/2020)                                                            #
#                                                                                        #
#   Description                                                                          #
#   This script automates the process of adding or removing a user from a distribution   #
#   group in Exchange Online. The script begins with importing the Exchange Online       #
#   PowerShell module and signing into Exchange via Modern Authentication. If you are    #
#   already connected to Exchange Online in your PowerShell session, you will have the   #
#   option to skip the sign-in process.                                                  #
#                                                                                        #
##########################################################################################


#Import the Exchange Online PowerShell Modules
Import-Module -Name ExchangeOnlineManagement

#Connect to Office 365
Clear-Host
Write-Host "Are you connected to Exchange Online?"
Write-Host ""
$EXOconnect = Read-Host -Prompt '[Y] Yes   [N] No'

if ($EXOconnect -eq 'N') {Connect-ExchangeOnline}
elseif ($EXOconnect -eq 'Y') {}

#Request parameters for script
Clear-Host
Write-Host "Select an option below:"
Write-Host ""
$Action = Read-Host -Prompt '[A] Add user to distribution group   [R] Remove user from distribution group'
Clear-Host
$User = Read-Host -Prompt 'Please enter the email address of the user you wish to add.'
$Distro = Read-Host -Prompt 'Enter the display name of the distribution group to which the user will be added.'


#Add or remove user from distribution group
if ($Action -eq 'A') {
    Add-DistributionGroupMember -Identity $Distro -Member $User
    Write-Host ""
    Write-Host "'$User' has been added to the '$Distro' distribution group."}
elseif ($Action -eq 'R') {
    Remove-DistributionGroupMember -Identity $Distro -Member $User -Confirm:$false
    Write-Host ""
    Write-Host "'$User' has been removed from the '$Distro' distribution group."}