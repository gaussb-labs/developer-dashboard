#!/bin/sh
#ssh-copy-id -i ~/.ssh/id_ed25519.pub ssh-user@3.109.184.146

#cat ~/.ssh/id_ed25519.pub | ssh ssh-user@13.232.164.233 'cat >> ~/.ssh/authorized_keys'

 ssh ssh-user@13.232.164.233 'echo "sandeep_saini" >> ~/.ssh/authorized_keys'