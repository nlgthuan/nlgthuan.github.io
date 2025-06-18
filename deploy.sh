#!/bin/bash
hugo && rsync -avz --delete public/ root@thuanngo.dev:/var/www/blog
