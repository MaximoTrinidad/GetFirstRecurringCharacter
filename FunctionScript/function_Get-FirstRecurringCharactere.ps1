<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.182
	 Created on:   	11/18/2020 12:33 PM
	 Created by:   	max_t
	 Organization: 	max_t
	 Filename:     function_Get-FirstRecurringCharacter.ps1
	===========================================================================
	.DESCRIPTION
		Get the first recurring character in a string.
#>

function Get-FirstRecurringCharacter
{
	<#
	.SYNOPSIS
		Function Get-FirstRecurringCharacterfunction.
	
	.DESCRIPTION
		Get the first recurring character in a string..
	
	.PARAMETER FullString
		FullString - Enter a full string value. (Mandatory field)
	
	.PARAMETER DisplayGridview
		FindInString - Enter the character to search in the full string. (Mandatory field)
	
	.NOTES
		N/A
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true, Position=0)][string]$FullString,
		[Parameter(Mandatory=$true, Position=1)][string]$FindInString
	)
	
	## - Get position of the first instance 'd" found:
	$FindInStringPosition = $FullString.indexof($FindInString);
	
	## - Use the position found to print the value:
	$foundChar = $FullString[$FindInStringPosition];
	
	Write-Host "Found String = $($foundChar), at string position $($FindInStringPosition)" -ForegroundColor Yellow;
}

## - Execute function:
#Get-FirstRecurringCharacter -FullString 'abcdedcba' -FindInString 'd'

## - Test mandatory parameter:
#Get-FirstRecurringCharacter 