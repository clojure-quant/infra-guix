

# login via ssh and keys to scaleway

https://console.scaleway.com/project/credentials

upload public key to scaleway

# ENABLE SMTP AT SCALEWAY
1) At 'Security tab, create your custom Security group with BLOCK SMTP = NO
2) Asign the new Security group to your MiaB server.
3) Right after 2) it is IMPORTANT to hard-reboot the server through your SCALEWAY admin panel to get the 1)  settings booked (soft-reboot through SSH is not enough)

