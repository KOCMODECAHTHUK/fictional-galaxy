#Generated Form Function 
function GenerateForm { 
    ######################################################################## 
    # Code Generated By: SAPIEN Technologies PrimalForms (Community Edition) v1.0.10.0 
    # Generated On: 7/15/2013 12:28 PM 
    # Generated By: Chendrayan Venkatesan 
    ######################################################################## 
     
    #region Import the Assemblies 
    [reflection.assembly]::loadwithpartialname("System.Drawing") |  Out-Null
    [reflection.assembly]::loadwithpartialname("System.Windows.Forms") |  Out-Null 
    #endregion 
     
    #region Generated Form Objects 
    $mainform= New-Object System.Windows.Forms.Form 
    $reboot= New-Object System.Windows.Forms.Button 
    $label4= New-Object System.Windows.Forms.Label 
    $regedit= New-Object System.Windows.Forms.Button 
    $label3= New-Object System.Windows.Forms.Label 
    $tempclear= New-Object System.Windows.Forms.Button 
    $label2= New-Object System.Windows.Forms.Label 
    $groupBox1= New-Object System.Windows.Forms.GroupBox 
    $TroubleShoot= New-Object System.Windows.Forms.Button 
    $cmd= New-Object System.Windows.Forms.Button 
    $eventvwr= New-Object System.Windows.Forms.Button 
    $perfmon= New-Object System.Windows.Forms.Button 
    $msinfo32 = New-Object System.Windows.Forms.Button 
    $iprenew= New-Object System.Windows.Forms.Button 
    $iprelease= New-Object System.Windows.Forms.Button 
    $WinVer= New-Object System.Windows.Forms.Button 
    $label1= New-Object System.Windows.Forms.Label 
    $InitialFormWindowState= New-Object System.Windows.Forms.FormWindowState 
    #endregion Generated Form Objects 
     
    #---------------------------------------------- 
    #Generated Event Script Blocks 
    #---------------------------------------------- 
    #Provide Custom Code for events specified in PrimalForms. 
    $perfmon_OnClick= 
    { 
    #TODO: Open Perfomance Monitoring Tool 
    Invoke-Item "$ENV:windir\System32\perfmon.exe" 
    } 
     
    $msinfo32_OnClick= 
    { 
    #TODO: Open System Information Window 
    Invoke-Item "$ENV:windir\System32\msinfo32.exe" 
    } 
     
    $eventvwr_OnClick= 
    { 
    #TODO: To Open Event Viewer 
    Invoke-Item "$ENV:Windir\System32\Eventvwr.exe" 
    } 
     
    $tempclear_OnClick= 
    { 
    #TODO: To Clear Temporary Files 
    Get-ChildItem "$ENV:Windir\Temp" | Remove-Item -Force -ErrorAction SilentlyContinue -Confirm $false 
    Write-Host "C:\Windows\Temp were cleared" - ForegroundColor Yellow 
    Start-Sleep2 
    Get-ChildItem $ENV:TEMP /  Remove-Item -Force -ErrorAction SilentlyContinue -Confirm $false 
    Write-Host "%temp% files were cleared" - ForegroundColor Yellow 
    } 
     
    $WinVer_OnClick= 
    { 
    #TODO: To view Windows version (About Windows) 
    Invoke-Item "$ENV:Windir\System32\Winver.exe" 
    } 
     
    $reboot_OnClick= 
    { 
    #TODO: Reboot the Computer 
    Restart-Computer -Force 
    } 
     
    $TroubleShoot_OnClick= 
    { 
    #TODO: To Open Windows TroubleShooter 
    C:\Windows\System32\control.exe / name Microsoft.Troubleshooting 
    } 
     
    $cmd_OnClick= 
    { 
    #TODO: To Open Command Prompt 
    Invoke-Item "$ENV:Windir\System32\cmd.exe" 
    } 
     
    $regedit_OnClick= 
    { 
    #TODO: To Open Registry Editor 
    Invoke-Item "$ENV:Windir\System32\regedt32.exe" 
    } 
     
    $OnLoadForm_StateCorrection= 
    { #Correct the initial state of the form to prevent the .Net maximized form issue 
        $mainform.WindowState = $InitialFormWindowState 
    } 
     
    #----------------------------------------------  
    #region Generated Form Code 
    $mainform.BackColor = [System.Drawing.Color]::FromArgb(255,255,255,255) 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 495 
    $System_Drawing_Size.Width = 439 
    $mainform.ClientSize = $System_Drawing_Size 
    $mainform.DataBindings.DefaultDataSourceUpdateMode = 0 
    $mainform.ForeColor = [System.Drawing.Color]::FromArgb(255,0,0,0) 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 533 
    $System_Drawing_Size.Width = 455 
    $mainform.MaximumSize = $System_Drawing_Size 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 533 
    $System_Drawing_Size.Width = 455 
    $mainform.MinimumSize = $System_Drawing_Size 
    $mainform.Name = "mainform" 
    $mainform.Text = "Quick Tools" 
     
     
    $reboot.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 241 
    $System_Drawing_Point.Y = 448 
    $reboot.Location = $System_Drawing_Point 
    $reboot.Name = "reboot" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 75 
    $reboot.Size = $System_Drawing_Size 
    $reboot.TabIndex = 7 
    $reboot.Text = "Restart" 
    $reboot.UseVisualStyleBackColor = $True 
    $reboot.add_Click($reboot_OnClick) 
     
    $mainform.Controls.Add($reboot) 
     
    $label4.DataBindings.DefaultDataSourceUpdateMode = 0 
    $label4.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 117 
    $System_Drawing_Point.Y = 453 
    $label4.Location = $System_Drawing_Point 
    $label4.Name = "label4" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 118 
    $label4.Size = $System_Drawing_Size 
    $label4.TabIndex = 6 
    $label4.Text = "Reboot Computer" 
     
    $mainform.Controls.Add($label4) 
     
     
    $regedit.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 241 
    $System_Drawing_Point.Y = 406 
    $regedit.Location = $System_Drawing_Point 
    $regedit.Name = "regedit" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 75 
    $regedit.Size = $System_Drawing_Size 
    $regedit.TabIndex = 5 
    $regedit.Text = "Regedit" 
    $regedit.UseVisualStyleBackColor = $True 
    $regedit.add_Click($regedit_OnClick) 
     
    $mainform.Controls.Add($regedit) 
     
    $label3.DataBindings.DefaultDataSourceUpdateMode = 0 
    $label3.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 116 
    $System_Drawing_Point.Y = 406 
    $label3.Location = $System_Drawing_Point 
    $label3.Name = "label3" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 100 
    $label3.Size = $System_Drawing_Size 
    $label3.TabIndex = 4 
    $label3.Text = "Registry Edit" 
     
    $mainform.Controls.Add($label3) 
     
     
    $tempclear.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 241 
    $System_Drawing_Point.Y = 360 
    $tempclear.Location = $System_Drawing_Point 
    $tempclear.Name = "tempclear" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 75 
    $tempclear.Size = $System_Drawing_Size 
    $tempclear.TabIndex = 3 
    $tempclear.Text = "Temp" 
    $tempclear.UseVisualStyleBackColor = $True 
    $tempclear.add_Click($tempclear_OnClick) 
     
    $mainform.Controls.Add($tempclear) 
     
    $label2.DataBindings.DefaultDataSourceUpdateMode = 0 
    $label2.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 117 
    $System_Drawing_Point.Y = 363 
    $label2.Location = $System_Drawing_Point 
    $label2.Name = "label2" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 118 
    $label2.Size = $System_Drawing_Size 
    $label2.TabIndex = 2 
    $label2.Text = "Clear Temp Files" 
     
    $mainform.Controls.Add($label2) 
     
     
    $groupBox1.DataBindings.DefaultDataSourceUpdateMode = 0 
    $groupBox1.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 117 
    $System_Drawing_Point.Y = 58 
    $groupBox1.Location = $System_Drawing_Point 
    $groupBox1.Name = "groupBox1" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 274 
    $System_Drawing_Size.Width = 200 
    $groupBox1.Size = $System_Drawing_Size 
    $groupBox1.TabIndex = 1 
    $groupBox1.TabStop = $False 
    $groupBox1.Text = "Windows Tool" 
     
    $mainform.Controls.Add($groupBox1) 
     
    $TroubleShoot.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 238 
    $TroubleShoot.Location = $System_Drawing_Point 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 184 
    $TroubleShoot.MaximumSize = $System_Drawing_Size 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 184 
    $TroubleShoot.MinimumSize = $System_Drawing_Size 
    $TroubleShoot.Name = "TroubleShoot" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 184 
    $TroubleShoot.Size = $System_Drawing_Size 
    $TroubleShoot.TabIndex = 7 
    $TroubleShoot.Text = "Windows TroubleShooter" 
    $TroubleShoot.UseVisualStyleBackColor = $True 
    $TroubleShoot.add_Click($TroubleShoot_OnClick) 
     
    $groupBox1.Controls.Add($TroubleShoot) 
     
     
    $cmd.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 208 
    $cmd.Location = $System_Drawing_Point 
    $cmd.Name = "cmd" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $cmd.Size = $System_Drawing_Size 
    $cmd.TabIndex = 6 
    $cmd.Text = "Command Prompt" 
    $cmd.UseVisualStyleBackColor = $True 
    $cmd.add_Click($cmd_OnClick) 
     
    $groupBox1.Controls.Add($cmd) 
     
     
    $eventvwr.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 177 
    $eventvwr.Location = $System_Drawing_Point 
    $eventvwr.Name = "eventvwr" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $eventvwr.Size = $System_Drawing_Size 
    $eventvwr.TabIndex = 5 
    $eventvwr.Text = "Event Viewer" 
    $eventvwr.UseVisualStyleBackColor = $True 
    $eventvwr.add_Click($eventvwr_OnClick) 
     
    $groupBox1.Controls.Add($eventvwr) 
     
     
    $perfmon.DataBindings.DefaultDataSourceUpdateMode = 0 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 147 
    $perfmon.Location = $System_Drawing_Point 
    $perfmon.Name = "perfmon" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $perfmon.Size = $System_Drawing_Size 
    $perfmon.TabIndex = 4 
    $perfmon.Text = "Performance Monitor" 
    $perfmon.UseVisualStyleBackColor = $True 
    $perfmon.add_Click($perfmon_OnClick) 
     
    $groupBox1.Controls.Add($perfmon) 
     
     
    $msinfo32.DataBindings.DefaultDataSourceUpdateMode = 0 
    $msinfo32.Font = New-Object System.Drawing.Font("Microsoft Sans Serif",8.25,1,3,0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 116 
    $msinfo32.Location = $System_Drawing_Point 
    $msinfo32.Name = "msinfo32" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $msinfo32.Size = $System_Drawing_Size 
    $msinfo32.TabIndex = 3 
    $msinfo32.Text = "System Information" 
    $msinfo32.UseVisualStyleBackColor = $True 
    $msinfo32.add_Click($msinfo32_OnClick) 
     
    $groupBox1.Controls.Add($msinfo32) 
     
     
    $iprenew.DataBindings.DefaultDataSourceUpdateMode = 0 
    $iprenew.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 86 
    $iprenew.Location = $System_Drawing_Point 
    $iprenew.Name = "iprenew" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $iprenew.Size = $System_Drawing_Size 
    $iprenew.TabIndex = 2 
    $iprenew.Text = "IP Renew" 
    $iprenew.UseVisualStyleBackColor = $True 
    $iprenew.add_Click($iprenew_OnClick) 
     
    $groupBox1.Controls.Add($iprenew) 
     
     
    $iprelease.DataBindings.DefaultDataSourceUpdateMode = 0 
    $iprelease.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 56 
    $iprelease.Location = $System_Drawing_Point 
    $iprelease.Name = "iprelease" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $iprelease.Size = $System_Drawing_Size 
    $iprelease.TabIndex = 1 
    $iprelease.Text = "IP Release" 
    $iprelease.UseVisualStyleBackColor = $True 
    $iprelease.add_Click($iprelease_OnClick) 
     
    $groupBox1.Controls.Add($iprelease) 
     
     
    $WinVer.DataBindings.DefaultDataSourceUpdateMode = 0 
    $WinVer.Font = New-Object System.Drawing.Font("Microsoft Sans Serif", 8.25, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 7 
    $System_Drawing_Point.Y = 27 
    $WinVer.Location = $System_Drawing_Point 
    $WinVer.Name = "WinVer" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 187 
    $WinVer.Size = $System_Drawing_Size 
    $WinVer.TabIndex = 0 
    $WinVer.Text = "Windows Version" 
    $WinVer.UseVisualStyleBackColor = $True 
    $WinVer.add_Click($WinVer_OnClick) 
     
    $groupBox1.Controls.Add($WinVer) 
     
     
    $label1.DataBindings.DefaultDataSourceUpdateMode = 0 
    $label1.Font = New-Object System.Drawing.Font("Calibri", 12, 1, 3, 0) 
     
    $System_Drawing_Point= New-Object System.Drawing.Point 
    $System_Drawing_Point.X = 128 
    $System_Drawing_Point.Y = 22 
    $label1.Location = $System_Drawing_Point 
    $label1.Name = "label1" 
    $System_Drawing_Size= New-Object System.Drawing.Size 
    $System_Drawing_Size.Height = 23 
    $System_Drawing_Size.Width = 183 
    $label1.Size = $System_Drawing_Size 
    $label1.TabIndex = 0 
    $label1.Text = "Windows 7 Quick Tools" 
     
    $mainform.Controls.Add($label1) 
     
    #endregion Generated Form Code 
     
    #Save the initial state of the form 
    $InitialFormWindowState= $mainform.WindowState 
    #Init the OnLoad event to correct the initial state of the form 
    $mainform.add_Load($OnLoadForm_StateCorrection) 
    #Show the Form 
    $mainform.ShowDialog()|  Out-Null 
     
    } #End Function 
     
    #Call the Function 
    GenerateForm 
    