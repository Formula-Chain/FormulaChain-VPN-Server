# VPN Server for Formulachain.com

This repository contains the necessary files to create a Docker-based VPN server using OpenVPN and Let's Encrypt for the `vpn.formulachain.com` domain.

## Overview

The VPN server is set up in a Docker container using OpenVPN. Let's Encrypt is used for SSL certificate management to securely authenticate connections. The server is configured to listen on UDP port 1194.

## Prerequisites

- Docker installed on your server.
- Domain `vpn.formulachain.com` configured to point to your server's IP address.
- Access to your DNS provider for domain verification with Let's Encrypt.

## Files

- `Dockerfile`: Instructions for building the OpenVPN server Docker image.
- `server.conf`: OpenVPN server configuration.
- `request-renew-certificates.sh`: Script to request and renew SSL certificates from Let's Encrypt (not included in this README, needs to be created).

## Setup Instructions

### Clone Repository

Clone this repository to your server.

### Build Docker Image

```bash
docker build -t formulachain-vpn .
```

### Run Docker Container

```bash
docker run -d --name formulachain-vpn --cap-add=NET_ADMIN -p 1194:1194/udp formulachain-vpn
```

### Obtain SSL Certificate

- Run the `request-renew-certificates.sh` script to obtain SSL certificates from Let's Encrypt. This step involves domain verification.
- Set up a cron job or similar to automatically renew the certificates.

### Connect to VPN

Configure your VPN client with the provided SSL certificates and connect to `vpn.formulachain.com` on port 1194.

## Security Considerations

- Regularly update Docker images and containers for security.
- Manage SSL certificates securely and ensure they are renewed before expiration.
- Monitor VPN access and review security logs periodically.

## Troubleshooting

- If you encounter issues with SSL certificate generation, check your domain's DNS settings and ensure that the domain is correctly pointed to your server.
- For connection issues, verify the OpenVPN and firewall logs.
