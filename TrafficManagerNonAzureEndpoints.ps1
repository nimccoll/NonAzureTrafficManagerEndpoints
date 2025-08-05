#===============================================================================
# Microsoft Azure Customer Advisory and Resiliency Engineering
# Find all Traffic Manager Endpoints whose type is not "azureEndpoints"
#===============================================================================
# Copyright © Microsoft Corporation.  All rights reserved.
# THIS CODE AND INFORMATION IS PROVIDED "AS IS" WITHOUT WARRANTY
# OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
# FITNESS FOR A PARTICULAR PURPOSE.
#===============================================================================
Connect-AzAccount
$endPointInfo = @()
$subscriptions = Get-AzSubscription

$subscriptions | ForEach-Object {
    $subscriptionId = $_.SubscriptionId
    $subscriptionName = $_.Name
    Set-AzContext -Subscription $_.SubscriptionId

    $profiles = Get-AzTrafficManagerProfile
    
    $profiles | ForEach-Object {
        $endPoints = $_.Endpoints
        $endPoints | ForEach-Object {
            If ($_.Type -ne "azureEndpoints") {
                
                $endPointInfo += [PSCustomObject]@{
                    SubscriptionId = $subscriptionId
                    SubscriptionName = $subscriptionName
                    ResourceGroupName = $_.ResourceGroupName
                    ProfileName = $_.ProfileName
                    EndpointName = $_.Name
                    EndpointType = $_.Type
                    Target = $_.Target
                }
            }
        }
    }
}
$endPointInfo | Format-Table