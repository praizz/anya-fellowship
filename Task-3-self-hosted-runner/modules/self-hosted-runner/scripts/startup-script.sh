#!/bin/bash
cat <<EOF >/home/ubuntu/user-data.sh
#!/bin/bash
mkdir ~/actions-runner
cd ~/actions-runner
curl -O -L https://github.com/actions/runner/releases/download/v2.291.1/actions-runner-linux-x64-2.291.1.tar.gz
tar xzf ~/actions-runner/actions-runner-linux-x64-2.291.1.tar.gz
rm ~/actions-runner/actions-runner-linux-x64-2.291.1.tar.gz
~/actions-runner/config.sh --url ${repo_url} --token ${github_access_token} --name "Github EC2 Runner" --unattended
~/actions-runner/run.sh
EOF
cd /home/ubuntu
chmod +x user-data.sh
sudo /bin/su -c "./user-data.sh" - ubuntu | sudo tee /home/ubuntu/user-data.log
