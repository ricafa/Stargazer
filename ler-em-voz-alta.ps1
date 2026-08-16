# Le um arquivo de texto em voz alta usando a voz em portugues do Windows.
#
# Uso:  powershell -ExecutionPolicy Bypass -File .\ler-em-voz-alta.ps1
#       powershell -ExecutionPolicy Bypass -File .\ler-em-voz-alta.ps1 -Arquivo "outro.txt" -Velocidade 2
#
# Sem -Arquivo, le o primeiro .txt da pasta do script.
# Obs.: este script e mantido sem acentos de proposito. O Windows PowerShell 5.1
# le arquivos .ps1 sem BOM como ANSI, e acentos aqui dentro chegariam corrompidos.
param(
	[string]$Arquivo,
	[int]$Velocidade = 1
)

Add-Type -AssemblyName System.Speech

if (-not $Arquivo) {
	$encontrado = Get-ChildItem -LiteralPath $PSScriptRoot -Filter '*.txt' | Select-Object -First 1
	if (-not $encontrado) { throw "Nenhum .txt encontrado em $PSScriptRoot" }
	$Arquivo = $encontrado.FullName
}

# O texto e lido explicitamente como UTF-8 para os acentos serem pronunciados certo.
$texto = [System.IO.File]::ReadAllText($Arquivo, [System.Text.Encoding]::UTF8)
if ([string]::IsNullOrWhiteSpace($texto)) { throw "Arquivo vazio: $Arquivo" }

$voz = New-Object System.Speech.Synthesis.SpeechSynthesizer
$voz.SelectVoice('Microsoft Maria Desktop')
$voz.Rate = $Velocidade
$voz.Volume = 100
$voz.Speak($texto)
$voz.Dispose()
