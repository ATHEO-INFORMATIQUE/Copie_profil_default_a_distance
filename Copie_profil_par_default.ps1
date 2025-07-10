Add-Type -AssemblyName System.Windows.Forms

# Crée la fenêtre
$form = New-Object System.Windows.Forms.Form
$form.Text = "Copie profil par default"
$form.Size = New-Object System.Drawing.Size(500,200)

# Crée le label d'instruction
$instructionLabel = New-Object System.Windows.Forms.Label
$instructionLabel.Text = "Entrer le nom du PC:"
$instructionLabel.Size = New-Object System.Drawing.Size(480,20)
$instructionLabel.Location = New-Object System.Drawing.Point(10,10)
$form.Controls.Add($instructionLabel)

# Crée le champ de texte pour entrer le nom du PC
$label = New-Object System.Windows.Forms.Label
$label.Text = "Nom du PC :"
$label.Location = New-Object System.Drawing.Point(10,50)
$form.Controls.Add($label)

$textBox = New-Object System.Windows.Forms.TextBox
$textBox.Location = New-Object System.Drawing.Point(150,50)
$textBox.Size = New-Object System.Drawing.Size(300,20)
$form.Controls.Add($textBox)

# Crée le bouton pour lancer la copie
$button = New-Object System.Windows.Forms.Button
$button.Text = "Copier"
$button.Location = New-Object System.Drawing.Point(200,100)
$form.Controls.Add($button)

# Action du bouton
$button.Add_Click({
    $pcName = $textBox.Text
    $scriptPath = $PSScriptRoot
    $sourcePath = "$scriptPath\default"
    $destinationPath = "\\$pcName\c$\Users"

    if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        [System.Windows.Forms.MessageBox]::Show("Veuillez exécuter ce script en tant qu'administrateur.")
        return
    }

    if ($pcName -match "^(W10-|W11-)[A-Z0-9]+$") {
        try {
            Copy-Item -Path $sourcePath -Destination $destinationPath -Recurse -Force
            [System.Windows.Forms.MessageBox]::Show("Le dossier a été copié avec succès.")
        } catch {
            [System.Windows.Forms.MessageBox]::Show("Une erreur s'est produite : $_")
        }
    } else {
        [System.Windows.Forms.MessageBox]::Show("Le nom du PC n'est pas valide. Il doit être identique à l'original.")
    }
})

# Affiche la fenêtre
$form.ShowDialog()
