# Use an official OpenVPN image as a parent image
FROM kylemanna/openvpn

# Environment variables
ENV OPENVPN /etc/openvpn

# OpenVPN configuration
RUN mkdir -p $OPENVPN

# Generate DH parameters
RUN openssl dhparam -out $OPENVPN/dhparam.pem 2048

# Copy the OpenVPN server configuration file
COPY ./server.conf $OPENVPN/server.conf

# Copy certificate files
COPY ./cert/fullchain.pem $OPENVPN/cert/fullchain.pem
COPY ./cert/cert.pem $OPENVPN/cert/cert.pem
COPY ./cert/privkey.pem $OPENVPN/cert/privkey.pem
COPY ./cert/chain.pem $OPENVPN/cert/chain.pem

# Expose necessary ports
EXPOSE 1194/udp

# Set working directory
WORKDIR $OPENVPN

# Entry point and command to run the OpenVPN server
ENTRYPOINT ["openvpn"]
CMD ["server.conf"]
