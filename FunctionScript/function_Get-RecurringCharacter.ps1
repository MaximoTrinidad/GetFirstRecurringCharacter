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

function Get-RecurringCharacter
{
	<#
	.SYNOPSIS
		Function Get-RecurringCharacter.
	
	.DESCRIPTION
		Get the first or all recurring character(s) in a string..
	
	.PARAMETER FullString
		FullString - Enter a full string value. (Mandatory field)
	
	.PARAMETER FindAll
		FindAll - Switch to used to find all recurring characters in a string. (Mandatory field)
	
	.EXAMPLE
		Sample code to list only the first recurring character:
		
		PS> [char[]]$foo = "ABCDEDFFG";
		PS> Get-RecurringCharacter -FullString $foo 
	
		-OR
	
		PS> Get-RecurringCharacter -FullString "ABCDEDFFG"
	
	.EXAMPLE
		Sample code to list all recurring characters:
		
		PS> [char[]]$foo = "ABCDEDFFG";
		PS> Get-RecurringCharacter -FullString $foo -FindAll
	
		-OR
	
		PS> Get-RecurringCharacter -FullString "ABCDEDFFG" -FindAll

	.NOTES
		N/A
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true, Position=0)]
		[char[]]$FullString,
		[switch]$FindAll
	)
	
	## - Code block to test trapping all recurring object in a string using the Group-Object cmdlet.
	## - Results are saved in a PSObect, then displayed later:
	$rcObject = $FullString | Select-object $_ | Group-Object $_;
	foreach ($rchar in $rcObject)
	{
		if ($FindAll)
		{
			## - Code to collect all recurring object:
			if ($rChar.Count -gt 1)
			{
				$rcAll = $rcAll + $rChar.Name;
			}
		}
		else
		{
			## - Code to only list collect the first recurring object:
			if ($rChar.Count -gt 1)
			{
				$rChar.Name;
				$outstring = "List first recurring character found: `n`r $($rChar.Name;) `n`r";
				break
			}
		}
		
		$outstring = "List all recurring characters found: `n`r $($rcAll) `n`r";
	};
	
	Write-Host "$outstring" -ForegroundColor Yellow;
	
};

## - Execute function:
[char[]]$foo = "ABCDEDFFG";
Get-RecurringCharacter -FullString $foo
Get-RecurringCharacter -FullString $foo -FindAll
Get-RecurringCharacter -FullString 'acdddeefghh' -FindAll
