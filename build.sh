#!/bin/bash

packer build basic.json
vagrant box add basic packer_basic_virtualbox.box
vagrant up basic
