> The Following guide demonstrates how to pair and access media on an iphone that when connected doesnt show the mount with the DCIM folderfiles

# Pair

- install necessary deps `sudo apt-get install libimobiledevice-utils ifuse`
- pair your iPhone `idevicepair pair`
- allow multiple connections between your iPhone and your Ubuntu installation `sudo usbmuxd -f -v`

# Mount
- create a mounting point while replacing {drivename} with the name you desire
```
sudo mkdir /media/{username}/{drivename}
```
- mount the drive
```
sudo ifuse /media/{username}/{drivename}
```

# Copy/Access

- copy the DCIM folder to the destination you desire
```
sudo cp -rf /media/{username}/{drivename}/DCIM ~/Documents/some-folder
```

# Unmount
- unmount the drive when your done
```
sudo umount /media/{username}/{drivename}
```
