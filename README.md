# HelloID-Conn-Prov-Target-AD-CheckOnExternalSystems-Csv

## Before you start
Be sure to read the information about checking external systems on <a href="https://docs.helloid.com/hc/en-us/articles/360012421460-Configure-the-on-premises-Microsoft-Active-Directory-target-system#2.4" target="_blank">the documentation page</a>. On "Account.5" you can find the full explanation on how this check works.

## Example 1
In this example SamAccountName is used in these other attributes: 'CommonName','AdditionalFields.proxyAddresses','AdditionalFields.userPrincipalName','AdditionalFields.mail'.
So when SamAccountName is not unique, all these fields need to be iterated to be the same as SamAccountName. 

## Example 2
In this example only SamAccountName needs to be checked and iterated. 

## HelloID Docs
The official HelloID documentation can be found at: https://docs.helloid.com/
