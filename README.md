The Python language has a **_translate_** and **_maketrans_** function that are typically used in substitution ciphers.

Using it in PowerShell
===

The following example shows the usage of Invoke-Translate. Here, every vowel in a string is replaced by its vowel position.
```powershell
$InputTable = "aeiou"            
$OutputTable = "12345"            
$TranslationTable = New-TranslationTable $InputTable $OutputTable            
            
$string = "this is string example....wow!!!";            
            
Invoke-Translate $string $TranslationTable             
                      
th3s 3s str3ng 2x1mpl2....w4w!!!            
```

This example deletes all 'x' and 'm' characters from the string before doing the translate.
```
$InputTable = "aeiou"            
$OutputTable = "12345"            
$TranslationTable = New-TranslationTable $InputTable $OutputTable            
            
$string = "this is string example....wow!!!";            
            
Invoke-Translate $string $TranslationTable 'xm'             
            
th3s 3s str3ng 21pl2....w4w!!!
```
