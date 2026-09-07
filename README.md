![Elite logo](elitelogo.png?raw=true)
# CMDRNerdyGriffin-T16000M-FCS-HOTAS v1.0
An ever expanding Elite Dangerous control scheme for the Thrustmaster T16000M FCS HOTAS system

This is CMDR NerdyGriffin's fork of [CMDRJamski-T16000M-FCS-HOTAS](https://github.com/jamsoft/CMDRJamski-T16000M-FCS-HOTAS).  The original files and notes are kept as-is below; see [Changes In This Fork](#changes-in-this-fork) for what is different.

This is a WIP control scheme for the Thrustmaster T.16000M FCS HOTAS system.  I really didn't like the layout of the default scheme provided by Elite Dangerous so I set about modifying it to my liking.

# Ship Controls

A fair number of the controls haven't changed but there were too many key functions for things like combat that were mapped to the buttons on the base of the stick, which in combat made them next to useless.

What was the ships dedicated boost button has been turned into an ALT button for allowing access to multiple functions on single buttons or hats.  Having a dedicated boost button was too ... er ... dangerous - it nearly cost me an Anaconda!

# SRV Controls

The SRV controls are almost identical to the ship controls.  The mapping for the ships boost function in the SRV switches to the turret control.

# Camera Controls

There is a pretty full compliment of camera controls included in the mapping, including control for the free camera.  See the cheat sheet for details on those.

# Unmapped Controllers

So far nothing has been mapped to the castle hat on the throttle but in a future version this could be used for the wingman controls.  There are also a number of unmapped buttons which will eventually get used for things as the mapping evolves over time.

# TARGET Software

This control scheme does not require the Thrustmaster TARGET software to be installed.  If you want to use this mapping you can safely uninstall the TARGET programming suite.

When I attempted to use the TARGET software the stick was rendered completely inoperable when using a TARGET profile.  The TARGET software installs and manages a virtual DirectX device and then controls the game through that device.  On many systems it seems that this virtual device is problematic and conflicts with Windows power management.

If I find the need in the future to go deeper into the programming of this HOTAS I will investigate the power management issues some more and offer up some kind of batch file or advice for configuring this correctly but so far I have been happy with just  mapping the physical controls of the HOTAS.

# Tweaks You May Need To Make

The index finger mini analogue joystick is a very nice feature (not in the right place, but hey we can't have it all) I have included in the mapping the smallest possible deadzone for my particular throttle.  Because this stick never quite manages to return to absolute zero every time without a deadzone this can result in constant ship movement, albeit slowly, this isn't ideal.

Your particular stick may need a slightly larger deadzone, or if you're really lucky you could get away with a smaller deadzone.  You can tweak this easily within Elite.

Currently the deadzone is tiny, the entries in the mapping file look like this:

```xml
<LateralThrustRaw>
	<Binding Device="T16000MTHROTTLE" Key="Joy_XAxis" />
	<Inverted Value="0" />
	<Deadzone Value="0.03000000" />
</LateralThrustRaw>
<VerticalThrustRaw>
	<Binding Device="T16000MTHROTTLE" Key="Joy_YAxis" />
	<Inverted Value="1" />
	<Deadzone Value="0.03000000" />
</VerticalThrustRaw>
```

# Installation Instructions

To install the mapping you need to find your local Elite Bindings directory.  You'll probably find it here:

`C:\Users\<your user name>\AppData\Local\Frontier Developments\Elite Dangerous\Options\Bindings`

Copy these three files into that location (or just run `Setup.bat`, which does the same and backs up any existing StartPreset files):

`CMDRNerdyGriffin-T16000M-FCS-HOTAS-V1.0.4.0.binds`

`StartPreset.4.start`

`StartPreset.start`

Then startup your game, this mapping will already be set as the default by including the StartPreset.4.start (the game's four-context selector since Odyssey; the older StartPreset.start is still read by tools such as EDDI and GameGlass).  These files simply configure the CMDRNerdyGriffin-T16000M-FCS-HOTAS-V1.0.4.0.binds mapping as the default one to use.  This wont overwrite any existing mapping files.  But as always MAKE BACKUPS ANYWAY.

# Cheat Sheet

I've created a cheat sheet that details all the included mappings which you can see below.  Download and keep it for reference.

![Cheat Sheet](CMDRJamski-TM-FCS-CheatSheet.png?raw=true "Cheat Sheet")

# Full Mapping

![Joystick Mapping](eybipp-t16000mfcs.jpg?raw=true "Joystick Mapping")
![Keyboard Mapping](eybipp-keyboard.jpg?raw=true "Keyboard Mapping")

Created with https://edrefcard.info/

# Changes In This Fork

The mapping started from CMDJamski V1.0.3.0 and was re-saved by the game in the 4.0 file format when Odyssey arrived (the `.4.0` in the file name is the game's format version, not part of the scheme name).  Since then: the keyboard side was merged with a GameGlass-compatible layout so nearly every HOTAS binding also has a keyboard secondary; yaw moved from the throttle rocker to the stick twist, with the rocker used for partial throttle and panel page cycling; the throttle `Joy_3` ALT layer carries more functions (chaff / heat sink / shield cell / ECM on the stick hat, subsystem and target cycling, wingmen, reverse throttle); FSS and DSS controls were added; the SRV turret moved to the stick axes; and on-foot is keyboard and mouse only.  The 2026-09 update added Frontier's default keys for the colonisation, on-foot suit module, vanity camera and focus distance actions that did not exist when the upstream file was made.  The cheat sheet and mapping images above are the upstream originals and do not reflect these changes.

# Reporting Issues

If you find any problems or what you consider to be a better idea for the mapping open a GitHub issue for discussion and/or fix.

HAPPY FLIGHTS AHOY!!

O7

# CMDRJamski over and out!