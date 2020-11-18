<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2020 v5.7.182
	 Created on:   	11/18/2020 1:58 PM
	 Created by:   	max_t
	 Organization: 	
	 Filename:   Sample_Oneliners_GetFirstCharInstance.ps1 	
	===========================================================================
	.DESCRIPTION
		Oneliners get first character instance.
#>

## - Store the string in a variable:
$foo = 'abcdedcba';

## - Get position of the first instance 'd" found:
$foo.indexof('d');

## - Use the position found to print the value:
$foo[$foo.indexof('d')];


