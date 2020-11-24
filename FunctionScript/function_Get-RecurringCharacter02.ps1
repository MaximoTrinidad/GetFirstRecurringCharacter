<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.182
	 Created on:   	11/23/2020 6:58 PM
	 Created by:   	max_t
	 Organization: 	max_t
	 Filename:     function_Get-FirstRecurringCharacter02.ps1
	===========================================================================
	.DESCRIPTION
		Get the first recurring character in a string.
#>

function Get-RecurringCharacter02
{
	<#
	.SYNOPSIS
		Function Get-RecurringCharacter02.
	
	.DESCRIPTION
		Get the first or all recurring character(s) in a string..
	
	.PARAMETER FullString
		FullString - Enter a full string value. (Mandatory field)
	
	.PARAMETER FindAll
		FindAll - Switch to used to find all recurring characters in a string. (Mandatory field)
	
	.EXAMPLE
		Sample code to list only the first recurring character:
		
		PS> [char[]]$foo = "ABCDEDFFG";
		PS> Get-RecurringCharacter02 -FullString $foo 
	
		-OR
	
		PS> Get-RecurringCharacter02 -FullString "ABCDEDFFG"
	
	.EXAMPLE
		Sample code to list all recurring characters:
		
		PS> [char[]]$foo = "ABCDEDFFG";
		PS> Get-RecurringCharacter02 -FullString $foo -FindAll
	
		-OR
	
		PS> Get-RecurringCharacter02 -FullString "ABCDEDFFG" -FindAll

	.NOTES
		N/A
#>
	[CmdletBinding()]
	param (
		[Parameter(Mandatory = $true, Position = 0)]
		[char[]]$FullString,
		[switch]$FindAll
	)
	
	[char[]]$foo = $FullString;
	$foo2 = [System.Collections.Generic.HashSet[char]]::new($foo); #this list create a list of unique characters.
	[array]$dupChar = foreach ($i in $foo2)
	{
		$global:cntFound = 1
		foreach ($f in $foo)
		{
			if ($i -eq $f)
			{
				#Write-Host "Reading = cnt - [$($global:cntFound)] -> Found $i = $f";
				$global:cntFound++;
			};
		};
		#Write-Host "<Total found $i is $global:cntFound>"
		
		if ($global:cntFound -ge 3)
		{
			$i
		};
	};
	
	if ($FindAll)
	{
		$outstring = "List all recurring characters found: `n`r $($dupChar | Select-Object $_) `n`r";
	}
	else
	{
		## - Code to only list collect the first recurring object:
		$outstring = "List first recurring character found: `n`r $($dupChar | Select-Object -first 1 $_) `n`r";
	};
	
	Write-Host "$outstring" -ForegroundColor Yellow;
	
};

## - Execute function:
[char[]]$foo = "ABCDEDFFG";
Get-RecurringCharacter02 -FullString $foo
Get-RecurringCharacter02 -FullString $foo -FindAll
Get-RecurringCharacter02 -FullString 'acdddeefghh' -FindAll

