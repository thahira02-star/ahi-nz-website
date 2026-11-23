# 1. Tailor predictive-maintenance.html
$p_path = "final output/predictive-maintenance.html"
$p = [System.IO.File]::ReadAllText($p_path, [System.Text.Encoding]::UTF8)

$p = $p.Replace('<h2 id="form-card-title" class="form-panel-title">Request Emergency HVAC Repair</h2>', '<h2 id="form-card-title" class="form-panel-title">Request Predictive Maintenance Service</h2>')
$p = $p.Replace("Tell us about your emergency and our specialists will coordinate the required technical response to restore your plant's performance.", "Tell us about your facility and our specialists will coordinate the required diagnostic telemetry and predictive monitoring for your plant.")
$p = $p.Replace('<span class="check" aria-hidden="true">&#10003;</span> 24/7 Emergency Repair', '<span class="check" aria-hidden="true">&#10003;</span> 24/7 Predictive Monitoring')
$p = $p.Replace("Thank you. Your emergency HVAC repair enquiry has been logged with our team.", "Thank you. Your predictive maintenance enquiry has been logged with our team.")
$p = $p.Replace('<div class="form-step-title">3. Nature of Urgent Fault *</div>', '<div class="form-step-title">3. Nature of Service Request *</div>')
$p = $p.Replace('<span>Complete Breakdown</span>', '<span>Condition Audit</span>')
$p = $p.Replace('<span>Partial System Fault</span>', '<span>Predictive Telemetry</span>')
$p = $p.Replace('<span>Urgent Inspection</span>', '<span>Long-term Monitoring</span>')
$p = $p.Replace('<span>Book emergency repair service</span>', '<span>Book predictive maintenance service</span>')

[System.IO.File]::WriteAllText($p_path, $p, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated predictive-maintenance.html"

# 2. Tailor preventative-maintenance.html
$pv_path = "final output/preventative-maintenance.html"
$pv = [System.IO.File]::ReadAllText($pv_path, [System.Text.Encoding]::UTF8)

$pv = $pv.Replace('<h2 id="form-card-title" class="form-panel-title">Request Emergency HVAC Repair</h2>', '<h2 id="form-card-title" class="form-panel-title">Request Preventative Maintenance Plan</h2>')
$pv = $pv.Replace("Tell us about your emergency and our specialists will coordinate the required technical response to restore your plant's performance.", "Tell us about your equipment and our specialists will coordinate a tailored preventative maintenance agreement to keep your plant at peak reliability.")
$pv = $pv.Replace('<span class="check" aria-hidden="true">&#10003;</span> 24/7 Emergency Repair', '<span class="check" aria-hidden="true">&#10003;</span> Scheduled Preventative Care')
$pv = $pv.Replace("Thank you. Your emergency HVAC repair enquiry has been logged with our team.", "Thank you. Your preventative maintenance enquiry has been logged with our team.")
$pv = $pv.Replace('<div class="form-step-title">3. Nature of Urgent Fault *</div>', '<div class="form-step-title">3. Service Agreement Level *</div>')
$pv = $pv.Replace('<span>Complete Breakdown</span>', '<span>Comprehensive Plan</span>')
$pv = $pv.Replace('<span>Partial System Fault</span>', '<span>Seasonal Maintenance</span>')
$pv = $pv.Replace('<span>Urgent Inspection</span>', '<span>Routine Inspection</span>')
$pv = $pv.Replace('<span>Book emergency repair service</span>', '<span>Book preventative maintenance service</span>')

[System.IO.File]::WriteAllText($pv_path, $pv, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated preventative-maintenance.html"

# 3. Tailor chiller-maintenance.html
$ch_path = "final output/chiller-maintenance.html"
$ch = [System.IO.File]::ReadAllText($ch_path, [System.Text.Encoding]::UTF8)

$ch = $ch.Replace('<h2 id="form-card-title" class="form-panel-title">Request Emergency HVAC Repair</h2>', '<h2 id="form-card-title" class="form-panel-title">Request Chiller Maintenance Service</h2>')
$ch = $ch.Replace("Tell us about your emergency and our specialists will coordinate the required technical response to restore your plant's performance.", "Tell us about your chiller plant and our factory-certified Carrier specialists will coordinate the required service plan to ensure peak performance.")
$ch = $ch.Replace('<span class="check" aria-hidden="true">&#10003;</span> 24/7 Emergency Repair', '<span class="check" aria-hidden="true">&#10003;</span> Certified Chiller Care')
$ch = $ch.Replace("Thank you. Your emergency HVAC repair enquiry has been logged with our team.", "Thank you. Your chiller maintenance enquiry has been logged with our team.")
$ch = $ch.Replace('<div class="form-step-title">3. Nature of Urgent Fault *</div>', '<div class="form-step-title">3. Nature of Chiller Service *</div>')
$ch = $ch.Replace('<span>Complete Breakdown</span>', '<span>Scheduled Overhaul</span>')
$ch = $ch.Replace('<span>Partial System Fault</span>', '<span>Routine Servicing</span>')
$ch = $ch.Replace('<span>Urgent Inspection</span>', '<span>Performance Audit</span>')
$ch = $ch.Replace('<span>Book emergency repair service</span>', '<span>Book chiller maintenance service</span>')

[System.IO.File]::WriteAllText($ch_path, $ch, (New-Object System.Text.UTF8Encoding($false)))
Write-Host "Updated chiller-maintenance.html"
