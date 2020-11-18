Technical Assessment.md

Try the Jupyter Interactive Notebooks in MyBinder. No installs needed.

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/MaximoTrinidad/SampleAssessment_11182020/master)

# Exercise

Create a powershell function or cmdlet that takes an arbitrarily long string parameter $foo (e.g. 'abcdedcba') and returns the first recurring character in that Input string.

In 'abcdedcba', 'd' would be the first recurring character, so the cmdlet/function should return 'd' for that sample input.

Be mindful of the runtime of your solution.


# Sample with one-liners:
## - Store the string in a variable:
$foo = 'abcdedcba';

## - Get position of the first instance 'd" found:
$foo.indexof('d');

## - Use the position found to print the value:
$foo[$foo.indexof('d')];


# Sample function:
##===== Function Get-FirstCharInstance =====#
function Get-FirstCharInstance
{
	[CmdletBinding()]
	param (
		[Parameter(Mandatory=$true, Position=0)][string]$FullString,
		[Parameter(Mandatory=$true, Position=1)][string]$FindInString
	)
	
	## - Get position of the first instance 'd" found:
	$FindInStringPosition = $FullString.indexof($FindInString);
	
	## - Use the position found to print the value:
	$foundChar = $FullString[$FindInStringPosition];
	
	Write-Host "Found String $($foundChar) at string position $($FindInStringPosition)" -ForegroundColor Yellow;
}

## - Execute function:
#Get-FirstCharInstance -FullString 'abcdedcba' -FindInString 'd'
