---
title: "Pixel8 Pro - Tricks with a New Android phone."
date: 2024-04-27T23:20:21+01:00
draft: false
tags: ["Dev","Android","IMEI"]
description: 'Tricks for Google Pixel 8 Pro. Together with Android Apps I enjoy: Waydroid, Termux?'
url: 'pixel-8-pro-tricks'
---

I Got a new phone recently.

It promises **7 years of updates**. 

And have good rating here: https://www.kimovil.com/en/compare-smartphones/ also [here](https://www.mgsm.pl/pl/)

Will it be better value for money than the Xiami PocoPhone F1 I got in 2019 for ~325$?

With the poco, I had available:

1. https://wiki.lineageos.org/devices/beryllium/

{{< details title="What about LineageOS 📌" closed="true" >}}

LineageOS is a free and open-source operating system for smartphones and tablets, based on the Android mobile platform. It is the successor to CyanogenMod, from which it was forked in December 2016. 

**What is LineageOS?**

* **Custom Android:** LineageOS is essentially a modified version of Android. It takes the open-source code of Android and adds its own customizations and features.
* **Community-driven:** It's developed and maintained by a community of developers, rather than a single company like Google or a phone manufacturer.
* **Focus on customization:** LineageOS is known for its focus on user customization and privacy. It often includes features that aren't found in the stock version of Android.
* **Extending device lifespan:** It can breathe new life into older devices that may no longer receive updates from their manufacturers.

**Is it Google compatible?**

* **Mostly yes:** LineageOS itself doesn't come with Google apps (like the Play Store, Gmail, etc.) pre-installed. This is because these apps are proprietary to Google.
* **You can add Google services:** However, you can usually install Google services and apps separately if you want to use them. This involves a process called "flashing" a Google package (often called "GApps") onto your device.
* **Some limitations:** While most Google apps work fine, there might be occasional compatibility issues with some Google services.

**What's the difference with Android?**

* **Stock Android vs. LineageOS:** Think of stock Android as the "vanilla" version of Android, while LineageOS is a customized version with added features and tweaks.
* **Key differences:**
    * **Customization:** LineageOS typically offers more customization options than stock Android, allowing you to tweak things like themes, icons, and system behavior.
    * **Features:** It may include features not found in stock Android, such as enhanced privacy settings, advanced theming options, and performance improvements.
    * **Updates:** LineageOS often provides updates for devices that are no longer supported by their manufacturers, extending the lifespan of your device.
    * **Bloatware:** LineageOS generally doesn't include the bloatware (pre-installed, unnecessary apps) that often comes with stock Android from manufacturers.
    * **Google apps:** As mentioned earlier, Google apps are not pre-installed on LineageOS, giving you more control over what apps you have on your device.

**In summary:** LineageOS is a popular choice for Android enthusiasts who want more control over their devices, more customization options, and a potentially longer lifespan for their older devices.

{{< /details >}}

2. https://devices.ubuntu-touch.io/device/beryllium/release/xenial/

3. It was also interesting https://grapheneos.org/usage

Leeeet's see.

But there would always be time for the Pixel 8 Pro and https://calyxos.org/docs/guide/device-support/

## Pixel 8 Pro - How to

### Connecting Pixel 8 Pro to HDMI

1. **Activate developer mode** by: 

Go to `Settings->About phone`, scroll all the way down and tap the Build number 7 times. After entering your screen lock, developer options will be enabled.

You can access them from `Settings->System->Developer options`. 

2. **Then, activate the settings** as per: https://www.youtube.com/watch?v=Z0ausMrkrik

you will need to restart and HDMI cable to enjoy :)

### Connecting a external drive

* How To [Transfer Photos & Videos From Flash Drive To Google Pixel 8 / 8 Pro](https://www.youtube.com/watch?v=iF0mmzGUSnc)


## Pixel 8 Pro Conclusions



1. **For photos it is a beast**. 

And I had a Huawei P30 Pro before.

It can make **8160x4590 photos**, which you can apply zoom with easy and not loosing much quality.

I also enjoy the night mode (but make sure to have a tripod).

2. For videos, its up to **3840x2160 (4k UHD) at 60 fps** and 63.6 Mbit/s bitrate.

> Get ready for some serious **backup setup**!

>> EDIT: specially as [these things happen](https://kevquirk.com/blog/new-motorbike-broken-phone-drama)

3. The charging time is not the quickest. It can go up to ~25W.

> For comparison, a s6 lite tablet loads at 15w

I like that it charges slow during the night, according to your alarm time.

4. Its possible not only to connect the Pixel to HDMI, but also to control it with a keyboard *like the k400+*

5. It integrates perfectly with google services and its not bloated.

An interesting integration was the recorder app, to their service: https://recorder.google.com/

You might need: `https://imei24.com/` or `https://www.imei.info/`


### Fav Apps for the Pixel

> Hello from the future!

1. The GCam works really nice with the phone.

*They have included a cool astro mode recently*

{{< callout type="info" >}}
To make appear the option to save a photo while recording a video, you need to Turn off HDR and 60fps as per [this thread](https://www.reddit.com/r/GooglePixel/comments/ynckao/take_photo_while_recording_video/)
{{< /callout >}}

2. Security

* [2FAS](https://play.google.com/store/apps/details?id=com.twofasapp) which can be synced with Google Drive and recovers automatically

> You can also see Aegis, or Authy (but is not OSS)

* [Bitwarden](https://play.google.com/store/apps/details?id=com.x8bit.bitwarden)

3. Nextcloud / Immich: to sync your photos or to have a full cloud

**TIP**

If you are using **microsoft authenticator**, make sure to have cloud backup enabled for your company stuff.

When adding a new account on the phone, make sure to hit **restore from backup** (the last option below) instead of just sign in with MCSFT.

{{< callout type="warning" >}}
Make sure to have **proper backup codes stored** to enter your critical applications: gmail/microsoft/2fas/....
{{< /callout >}}

> You could also make sure to be logged in on those services at a tablet, if you have one.

---

## FAQ

* See information about your Android Phone with [CPU-Info](https://play.google.com/store/apps/details?id=com.kgurgul.cpuinfo&hl=es) or with [DevCheck](https://play.google.com/store/apps/details?id=flar2.devcheck)

* CPU: Tensor G3 (4x Cortex A510 + 4xCortex A715 + 1x Cortex X3) - ARMv8a 64bits
* GPU: Mali-G715

> Making [Android better](https://jalcocert.github.io/Linux/docs/privacy/android/#better-android-os)

### Android Apps I love!

But get them...in a cool way:

1. [Obtanium](https://github.com/ImranR98/Obtainium) - Android Apps from its Source, [in FDroid](https://f-droid.org/es/packages/dev.imranr.obtainium.fdroid/)

> Thanks to this one I could install Nextcloud App on an old Huawei Android. Add it with `https://github.com/nextcloud/android`

2. [F-Droid](https://f-droid.org/es/)

* Weather

* [OrganicMaps](https://f-droid.org/es/packages/app.organicmaps/)

* Sound [Recorder](https://f-droid.org/es/packages/com.danielkim.soundrecorder/)
* [Ultrasonic](https://f-droid.org/es/packages/org.moire.ultrasonic/)
* CAPod - It works for Airpods Pro and for Sony WF-1000XM3

* [Aegis 2fa](https://f-droid.org/es/packages/com.beemdevelopment.aegis/)

* [Mullvad](https://f-droid.org/es/packages/net.mullvad.mullvadvpn/)
* [TailScale](https://f-droid.org/es/packages/com.tailscale.ipn/)

* [Syncthing](https://f-droid.org/es/packages/com.nutomic.syncthingandroid/)

* [Element](https://f-droid.org/es/packages/im.vector.app/)

* [RSS - Wallabag](https://f-droid.org/es/packages/fr.gaulupeau.apps.InThePoche/)
* [RSS ReadDrops](https://f-droid.org/es/packages/com.readrops.app/)
* NFC Tools



### Other Android Stuff

#### Termux

You can also **emulate Linux inside Android**, like I did [with Termux, here](https://jalcocert.github.io/Linux/docs/privacy/android/#how-to-use-linux-on-android-with-termux).


#### Running Windows on Android

* https://github.com/brunodev85/winlator

#### Running Android on Linux

**Waydroid** is a software application that allows users to run Android operating systems within a Linux environment.

Here's a breakdown of what it is and its relationship to Wayland:

* **What Waydroid is:**
    * Waydroid uses Linux container **(LXC) technology** to run a full Android system. This allows Android applications to run on a Linux operating system.
    * The goal is to provide a way to run Android apps on Linux with **near-native performance**.

* **Waydroid and Wayland:**
    * Wayland is a communication protocol that specifies the communication between a display server and its clients.
    * Waydroid is designed to work within a Wayland environment. This means that it relies on Wayland to display the Android interface and applications.
    * A key aspect of Waydroid's design is its integration with Wayland, which contributes to its performance. Instead of relying on older display server technologies like X11, it takes advantage of Wayland's modern architecture.
    * Essentially Wayland is what Waydroid uses to display the android operating system graphical user interface.

In summary, Waydroid leverages the Wayland display server protocol to provide a smooth and integrated Android experience on Linux systems.

* https://github.com/waydroid/waydroid
    * https://docs.waydro.id/

> The Android runtime environment ships with a minimal customized Android system image **based on LineageOS**.

See how to install waydroid in linux: https://github.com/Aman9das/Waydroid_Setup_Guide

```sh
sudo apt install curl ca-certificates -y

curl -s https://repo.waydro.id | sudo bash

sudo apt install waydroid -y
```

This will download ~1gb of data.

![alt text](/blog_img/Android/waydroid-vanilla.png)

What can you do with Waydroid?

You can install the mentioned F-Droid and/or Obtanium as mentioned above with the Pixel.

Also, you can tell friends to send you their developed Android apks, for example from telegram: `/home/jalcocert/.var/app/org.telegram.desktop/data/TelegramDesktop/tdata/temp_data`.

```sh
cp ~/.var/app/org.telegram.desktop/data/TelegramDesktop/tdata/temp_data/sampleandroidapp.apk ~/Desktop/
```

Then, you can install a browser on **waydroid**, like duckduckgo and get the file transfered thanks to your local filebrowser instance.

```sh
# Initialize Waydroid (choose either 'FULL' for GApps or 'VANILLA' for a basic install):
sudo waydroid init #Follow the prompts.

#To start waydroid:
waydroid session
waydroid container start

#To open waydroid applications from your linux desktop:
waydroid show-full-ui

#Troubleshooting Play Store Device Certification:
#To get the android ID:
sudo waydroid prop get android_id

#Then follow the instructions for registering the android ID on google's website.
```

You can choose between VANILLA or GAPPS (with google apps, but requires to certify your device as mentioned on [this video](https://www.youtube.com/watch?v=FKnkIf9jb7U))

### Running mac

https://github.com/darlinghq/darling

>  Darwin/macOS emulation layer for Linux 

### Other Phones I Tried

I was very happy with both, the Huawei P30 Pro and the PocoPhone F1 (probably the best value for money I ever had til now).

The Poco F1 was quite an interesting one and also the first phone I changed its battery (13Wh, 3.85V, called BM4E, 3900mAh)