> The Following guide demonstrates how to partition an external harddrive on linux using `ext4` format, mount it and set it's permissions for reading/writing by the current user

# Partition

- with the drive plugged in and mounted run `lsblk -f`
- identify the partition for this drive (example: `sdb1`, or `sdb2`, or ...)
- now unmount it (right+click "unmount")
- type the following while replacing `{partition}` with the one you identified earlier
```
sudo mkfs -t ext4 /dev/{partition}
```
- if prompted for confirmation, press `y` and hit enter
- `Creating journal (... blocks):` could take a min. just wait
- verify it worked `lsblk -f`

# Mount

- create a mounting point while replacing {drivename} with the name you desire
```
sudo mkdir -p /media/{username}/{drivename}
```
- mount the partition by using the following command:
```
sudo mount -t auto /dev/{partition} /media/{username}/{drivename}
```
- verify it worked `lsblk -f`

# Privledges

give yourself owner privs to the file so you can write to it (its currently set to `root`)
```
sudo chown {username}:{username} /media/{username}/{drivename}
```

# Profit

you should now be able to modify the drive
```
touch /media/{username}/{drivename}/foo
```
