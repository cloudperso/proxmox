# Follow Soyoustart menu and complete as screenshots below
## Select template
![base_install_nodes_001](../pics/base_install_nodes_001.png)

## Partionning
![base_install_nodes_002](../pics/base_install_nodes_002.png)

## Options
![base_install_nodes_003](../pics/base_install_nodes_003.png)

## Finishing install
Once the 2 proxmox nodes are installed. SSH with root user into it an run the following command:
```bash 
bash -c "$(wget https://raw.githubusercontent.com/cloudperso/proxmox/master/scripts/post-install-soyoustart.sh -qO -)"
```
Then `reboot` your server.
