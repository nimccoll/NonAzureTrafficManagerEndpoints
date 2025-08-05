# NonAzureTrafficManagerEndpoints
Sample PowerShell script to find all Traffic Manager Endpoints whose type is not "azureEndpoints"

The included PowerShell script, TrafficManagerNonAzureEndpoints.ps1, included in this repository can assist in identifying Traffic Manager Profiles that include endpoints of type externalEndpoints and nestedEndpoints. Traffic Manager Profiles with endpoints of this type are impacted by the DigiCert Issuance and Renewal Changes documented [here](https://techcommunity.microsoft.com/blog/appsonazureblog/important-changes-to-app-service-managed-certificates-is-your-certificate-affect/4435193). This script will help you identify resources impacted by scenario 2 in the blog post.

To make sure you identify all impacted resources, the account that executes this script must have at least Reader access to all of the subscriptions in your tenant.