<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.182
	 Created on:   	11/18/2020 1:58 PM
	 Created by:   	max_t
	 Organization: 	max_t
	 Filename:   Sample_Oneliners_FindRecurringCharacter.ps1 	
	===========================================================================
	.DESCRIPTION
		Oneliners to find all recurring character(s) in a string object.
#>

## - Store the string in a variable:
$foo = 'abcdedcba';

## - Save string as a character array object:
[char[]]$foo = "AACBCDEDFFG";

## - Code block to list the first  all recurring character in a string with the help of the Group-Object cmdlet.
## - Results are saved in a PSObect, then displayed later:
[char[]]$foo = "ABCDEDFFG"; $rcObject = $null;
$rcObject = $foo | Select-object $_ | Group-Object $_;
$rcCharFound = foreach ($rchar in $rcObject)
{
	if ($rChar.Count -gt 1)
	{
		$rChar.Name;
		
		## - Exit foreach first recurring char found.
		break
	}
};

Write-Host "Recurring character found: `n`r $($rcCharFound) `n`r" -ForegroundColor Yellow;

## - Find All recurring characters in the string:
[char[]]$foo = "ABCDEDFFG"; $rcObject = $null;
$rcObject = $foo | Select-object $_ | Group-Object $_;
$rcCharFound = foreach ($rchar in $rcObject)
{
	if ($rChar.Count -gt 1)
	{
		$rChar.Name;
	}
};

Write-Host "Recurring character found: `n`r $($rcCharFound) `n`r" -ForegroundColor Yellow;

## ============================================================
## Another variation: 
[char[]]$foo = "AACBCDEDFFG";
[System.Collections.Generic.HashSet[char]]::new($foo2); #this list create a list of unique characters.
[array] $dup = foreach ($i in $foo2)
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

## - Duplicate characters found are stored in variable $dup:
$dup

## - List the first recurring character found:
$dup | select -first 1 $_
## ============================================================
