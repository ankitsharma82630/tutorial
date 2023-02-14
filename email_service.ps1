Param(
	
	[Parameter(Mandatory)]
	[string] $customer_email,
	
    [Parameter(Mandatory)]
	[string] $vm_public_dns_address,

    [Parameter(Mandatory)]
	[string] $datbase_address,

	[Parameter(Mandatory)]
	[string] $smtppass
)

$Username="username@domain.com"
$password = ConvertTo-SecureString "$smtppass" -AsPlainText -Force
$Cred = New-Object System.Management.Automation.PSCredential ($Username,$password)

$From = "username@domain.com"
$To = $customer_email
$Subject = "EC2 and RDS IS Provisioned"

$Body = "Dear User,`
<br><br>AWS EC2 and RDS has been successfully provisioned.`
<br>Please find thedetails as below:<ul>`
<li>EC2 DNS ADDRESS: <b>$vm_public_dns_address</b></li>`
<li>RDS DNS ADDRESS: <b>$datbase_address</b></li>`
<span style='color: #1E90FF'><b>Ankit Sharma</b></span>"

$SMTPServer = "outlook.office365.com"
$SMTPPort = "587"
Send-MailMessage -From $From -to $To -Subject $Subject -Body $Body -SmtpServer $SMTPServer -port $SMTPPort -BodyAsHtml -UseSsl -Credential $Cred