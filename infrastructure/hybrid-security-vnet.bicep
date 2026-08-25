// Enterprise Hybrid Security Perimeter: Border Firewall & NSG Configuration
param location string = resourceGroup().location
param onPremCiscoSubnet string = '192.168.10.0/24'

resource hybridNsg 'Microsoft.Network/networkSecurityGroups@2023-05-01' = {
  name: 'nsg-hybrid-enterprise-border'
  location: location
  properties: {
    securityRules: [
      {
        name: 'Allow-Cisco-OnPrem-SSH-HTTPS'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRanges: [
            '22'
            '443'
          ]
          sourceAddressPrefix: onPremCiscoSubnet
          destinationAddressPrefix: 'VirtualNetwork'
        }
      }
      {
        name: 'Deny-All-Direct-Internet'
        properties: {
          priority: 4000
          direction: 'Inbound'
          access: 'Deny'
          protocol: '*'
          sourcePortRange: '*'
          destinationPortRange: '*'
          sourceAddressPrefix: 'Internet'
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}
