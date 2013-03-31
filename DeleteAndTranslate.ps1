$InputTable = "aeiou"
$OutputTable = "12345"
$TranslationTable = New-TranslationTable $InputTable $OutputTable

$string = "this is string example....wow!!!";

Invoke-Translate $string $TranslationTable 'xm'


#th3s 3s str3ng 21pl2....w4w!!!