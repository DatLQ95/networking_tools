sudo apt update
sudo apt install software-properties-common
sudo add-apt-repository ppa:wireguard/wireguard
sudo apt install wireguard

# Generate the key: 
wg genkey | sudo tee /etc/wireguard/privatekey | wg pubkey | sudo tee /etc/wireguard/publickey
