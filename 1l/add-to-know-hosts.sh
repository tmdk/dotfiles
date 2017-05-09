# for automatically exiting ssh environments (bitbucket, ssh)
ssh -o StrictHostKeyChecking=no -T git@bitbucket.org

# for normal ssh envs
ssh -o StrictHostKeyChecking=no -T user@example.org exit
