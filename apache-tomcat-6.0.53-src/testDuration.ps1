$table = @()
Get-ChildItem "output/build/logs" |
ForEach-Object {
    $log = Get-Content $_.FullName
    $testSuite = $log[0].Substring("Testsuite: ".Length)
    $deleteSuite = $false
    $log | Select-String -AllMatches -Pattern "Testcase: (.*) took (\d+\.?\d*) sec" | ForEach-Object {
        $item = New-Object PSObject
        $item | Add-Member -type NoteProperty -Name 'Suite' -Value $testSuite
        $item | Add-Member -type NoteProperty -Name 'Test' -Value $_.Matches.Groups[1]
        $item | Add-Member -type NoteProperty -Name 'Time' -Value ([float]($_.Matches.Groups[2].toString()))
        $table += $item

        if($item.Time -gt 0.100) {
            $deleteSuite = $true
        }
    }

    if($deleteSuite) {
        $a = "test/$($testSuite.Replace(".","/").Trim()).java"
        Remove-Item -Path $a
    }
}

$table | Export-Csv -Path "tests.csv"
