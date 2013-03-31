cls

function New-TranslationTable {
    <#
        .Synopsis
            Returns a translation table
        .Description
            Returns a translation table that maps each character in the InputTable
            string into the character at the same position in the OutputTable string.
            Then this table is passed to Invoke-Translate.

        .Notes
            Both InputTable and OutputTable must have the same length.
        .Example
            $InputTable = "aeiou"
            $OutputTable = "12345"
            $TranslationTable = New-TranslationTable $InputTable $OutputTable

            $string = "this is string example....wow!!!";

            Invoke-Translate -TargetString $string -TranslationTable $TranslationTable

            th3s 3s str3ng 2x1mpl2....w4w!!!
    #>
    param(
        # This is the string having actual characters.
        $InputTable,
        # This is the string having corresponding mapping character.
        $OutputTable
    )

    $count = $InputTable.Length
    $h = New-Object "System.Collections.Generic.Dictionary``2[System.String,System.String]"
    for($idx=0; $idx -lt $count; $idx+=1) {
        $h[$InputTable[$idx]]=$OutputTable[$idx]
    }
    return $h
}

function Invoke-Translate {
    <#
        .Synopsis
            Returns a string in which all characters have been translated using Translation Table
        .Description
            Returns a string in which all characters have been translated using Translation Table
            (constructed with the New-TranslationTable),
            optionally deleting all characters found in the string DeleteChars.
        .Example
            $InputTable = "aeiou"
            $OutputTable = "12345"
            $TranslationTable = New-TranslationTable $InputTable $OutputTable

            $string = "this is string example....wow!!!";

            Invoke-Translate -TargetString $string -TranslationTable $TranslationTable

            th3s 3s str3ng 2x1mpl2....w4w!!!
        .Example
            $InputTable = "aeiou"
            $OutputTable = "12345"
            $TranslationTable = New-TranslationTable $InputTable $OutputTable

            $string = "this is string example....wow!!!";

            Invoke-Translate -TargetString $string -TranslationTable $TranslationTable -DeleteChars 'xm'

            th3s 3s str3ng 21pl2....w4w!!!
    #>
    param(
        [string]$TargetString,
        # Use the New-TranslationTable create a translation table.
        [hashtable]$TranslationTable,
        # The list of characters to be removed from the source string.
        [string]$DeleteChars
    )

    if($DeleteChars) {
        $replace = $DeleteChars.ToCharArray() -join '|'
        $TargetString = $TargetString -replace $replace, ''
    }

    $count = $TargetString.Length
    $result = ""

    for($idx=0; $idx -lt $count; $idx+=1) {

        $char = $TargetString[$idx]
        $found = $TranslationTable[$char]

        if($found) {
            $result+=$found
        } else {
            $result+=$char
        }
    }

    $result
}
