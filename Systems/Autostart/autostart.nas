#*****************************************************************************************************
#* Generic Autostart Sequence for Jets                                                               *
#* Peter Brendt (JWocky 2015)                             					     *
#*                                                                                                   *
#* This file is licensed under GPL V2 or later. Feel free to copy it, use it, change it or adapt it  *
#* to your needs in your own projects.                                                               *
#*****************************************************************************************************

#*****************************************************************************************************
#* Enabling autostart only 1 second after the FDM is initialized to make sure, all properties are    *
#* set.                                                                                              *
#*****************************************************************************************************

var enabled=0;

var enable_autostart=func {
print("autostart enabled");
	enabled=1;
}

#*****************************************************************************************************
#* Initialization part, wait for the start-idling property which is set from the plane's menu when   *
#* the user presses "Autostart"                                                                      *
#*****************************************************************************************************

setlistener("/aircraft/start-idling", func(idle) {
	if (enabled) {
		var run= idle.getBoolValue();
		#*****************************************************************
		#* if idling was switched on, start engines, otherwise stop them *
		#*****************************************************************
		if (run) {
			Startup();
		} else {
			Shutdown();
		}
	}
},0,0);

var batstart= func {
	setprop("controls/electric/battery-switch",1);
	gui.popupTip("System on battery, starting APU!");
}

var apustart= func {
	setprop("controls/APU/off-start-run", 1);
	setprop("controls/electric/APU-generator", 1);
	gui.popupTip("APU starting!");
}

var pump0start= func {
	setprop("controls/fuel/tank[0]/boost-pump[0]", 1);
	setprop("controls/fuel/tank[0]/boost-pump[1]", 1);
	gui.popupTip("Fuel pumps wing tank left starting!");
}

var pump2start= func {
	setprop("controls/fuel/tank[2]/boost-pump[0]", 1);
	setprop("controls/fuel/tank[2]/boost-pump[1]", 1);
	gui.popupTip("Fuel pumps wing tank right starting!");
}

var pump1start= func {
	setprop("controls/fuel/tank[1]/boost-pump[0]", 1);
	setprop("controls/fuel/tank[1]/boost-pump[1]", 1);
	gui.popupTip("Fuel pumps center tank starting!");
}

var eng1start= func {
	setprop("controls/electric/engine[0]/bus-tie",1);
	setprop("controls/electric/engine[0]/generator",1);
	setprop("controls/engines/engine[0]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[0]/fuel-pump", 1);
	setprop("controls/engines/engine[0]/ignition", 1);
	setprop("controls/engines/engine[0]/starter", 1);
	gui.popupTip("Engine 1 starting!");
	settimer(eng1norm, 2);
}

var eng2start= func {
	setprop("controls/electric/engine[1]/bus-tie",1);
	setprop("controls/electric/engine[1]/generator",1);
	setprop("controls/engines/engine[1]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[1]/fuel-pump", 1);
	setprop("controls/engines/engine[1]/ignition", 1);
	setprop("controls/engines/engine[1]/starter", 1);
	gui.popupTip("Engine 2 starting!");
	settimer(eng2norm, 2);
}

var eng3start= func {
	setprop("controls/electric/engine[2]/bus-tie",1);
	setprop("controls/electric/engine[2]/generator",1);
	setprop("controls/engines/engine[2]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[2]/fuel-pump", 1);
	setprop("controls/engines/engine[2]/ignition", 1);
	setprop("controls/engines/engine[2]/starter", 1);
	gui.popupTip("Engine 3 starting!");
	settimer(eng3norm, 2);
}

var eng4start= func {
	setprop("controls/electric/engine[3]/bus-tie",1);
	setprop("controls/electric/engine[3]/generator",1);
	setprop("controls/engines/engine[3]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[3]/fuel-pump", 1);
	setprop("controls/engines/engine[3]/ignition", 1);
	setprop("controls/engines/engine[3]/starter", 1);
	gui.popupTip("Engine 4 starting!");
	settimer(eng4norm, 2);
}

var eng5start= func {
	setprop("controls/electric/engine[4]/bus-tie",1);
	setprop("controls/electric/engine[4]/generator",1);
	setprop("controls/engines/engine[4]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[4]/fuel-pump", 1);
	setprop("controls/engines/engine[4]/ignition", 1);
	setprop("controls/engines/engine[4]/starter", 1);
	gui.popupTip("Engine 5 starting!");
	settimer(eng5norm, 2);
}

var eng6start= func {
	setprop("controls/electric/engine[5]/bus-tie",1);
	setprop("controls/electric/engine[5]/generator",1);
	setprop("controls/engines/engine[5]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[5]/fuel-pump", 1);
	setprop("controls/engines/engine[5]/ignition", 1);
	setprop("controls/engines/engine[5]/starter", 1);
	gui.popupTip("Engine 6 starting!");
	settimer(eng6norm, 2);
}

var eng7start= func {
	setprop("controls/electric/engine[6]/bus-tie",1);
	setprop("controls/electric/engine[6]/generator",1);
	setprop("controls/engines/engine[6]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[6]/fuel-pump", 1);
	setprop("controls/engines/engine[6]/ignition", 1);
	setprop("controls/engines/engine[6]/starter", 1);
	gui.popupTip("Engine 7 starting!");
	settimer(eng7norm, 2);
}

var eng8start= func {
	setprop("controls/electric/engine[7]/bus-tie",1);
	setprop("controls/electric/engine[7]/generator",1);
	setprop("controls/engines/engine[7]/cutoff", 1);	# needs to be true for JSB to spin up with starter
	setprop("controls/engines/engine[7]/fuel-pump", 1);
	setprop("controls/engines/engine[7]/ignition", 1);
	setprop("controls/engines/engine[7]/starter", 1);
	gui.popupTip("Engine 8 starting!");
	settimer(eng8norm, 2);
}

var eng1norm= func {
	setprop("controls/engines/engine[0]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 1 spinning up!");
	settimer(eng1watch, 2);
}

var eng2norm= func {
	setprop("controls/engines/engine[1]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 2 spinning up!");
	settimer(eng2watch, 2);
}

var eng3norm= func {
	setprop("controls/engines/engine[2]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 3 spinning up!");
	settimer(eng3watch, 2);
}

var eng4norm= func {
	setprop("controls/engines/engine[3]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 4 spinning up!");
	settimer(eng4watch, 2);
}

var eng5norm= func {
	setprop("controls/engines/engine[4]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 5 spinning up!");
	settimer(eng5watch, 2);
}

var eng6norm= func {
	setprop("controls/engines/engine[5]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 6 spinning up!");
	settimer(eng6watch, 2);
}

var eng7norm= func {
	setprop("controls/engines/engine[6]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 7 spinning up!");
	settimer(eng7watch, 2);
}

var eng8norm= func {
	setprop("controls/engines/engine[7]/cutoff", 0);	# now cutoff to false to make her run on her own
	gui.popupTip("Engine 8 spinning up!");
	settimer(eng8watch, 2);
}

var eng1watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[0]/n2");
	if (n2<59) {
		settimer(eng1watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[0]/cutoff", 0);
			setprop("controls/engines/engine[0]/cutoff", 1);
			gui.popupTip("Engine 1 retrigger!");
		}
	} else {
		gui.popupTip("Engine 1 running!");
	}
}

var eng2watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[1]/n2");
	if (n2<59) {
		settimer(eng2watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[1]/cutoff", 1);
			setprop("controls/engines/engine[1]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 2 running!");
	}
}

var eng3watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[2]/n2");
	if (n2<59) {
		settimer(eng3watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[2]/cutoff", 1);
			setprop("controls/engines/engine[2]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 3 running!");
	}
}

var eng4watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[3]/n2");
	if (n2<59) {
		settimer(eng4watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[3]/cutoff", 1);
			setprop("controls/engines/engine[3]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 4 running!");
	}
}

var eng5watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[4]/n2");
	if (n2<59) {
		settimer(eng5watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[4]/cutoff", 1);
			setprop("controls/engines/engine[4]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 5 running!");
	}
}

var eng6watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[5]/n2");
	if (n2<59) {
		settimer(eng6watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[5]/cutoff", 1);
			setprop("controls/engines/engine[5]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 6 running!");
	}
}

var eng7watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[6]/n2");
	if (n2<59) {
		settimer(eng7watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[6]/cutoff", 1);
			setprop("controls/engines/engine[6]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 7 running!");
	}
}

var eng8watch= func {
	var n2=getprop("fdm/jsbsim/propulsion/engine[7]/n2");
	if (n2<59) {
		settimer(eng8watch, 5);
		if (n2<1) {
			# re-trigger jsbsim to spin this engine up
			setprop("controls/engines/engine[7]/cutoff", 1);
			setprop("controls/engines/engine[7]/cutoff", 2);
		}
	} else {
		gui.popupTip("Engine 8 running!");
	}
}

var Startup = func {
	settimer(batstart, 1);
	settimer(apustart, 6);
	settimer(pump0start, 8);
	settimer(pump2start, 10);
	settimer(pump1start, 12);
	if (getprop("voodoomaster/engines")>0) {
		settimer(eng1start, 12);
	}
	if (getprop("voodoomaster/engines")>1) {
		settimer(eng2start, 14);
	}
	if (getprop("voodoomaster/engines")>2) {
		settimer(eng3start, 16);
	}
	if (getprop("voodoomaster/engines")>3) {
		settimer(eng4start, 18);
	}
	if (getprop("voodoomaster/engines")>4) {
		settimer(eng5start, 20);
	}
	if (getprop("voodoomaster/engines")>5) {
		settimer(eng6start, 22);
	}
	if (getprop("voodoomaster/engines")>6) {
		settimer(eng7start, 24);
	}
	if (getprop("voodoomaster/engines")>7) {
		settimer(eng8start, 24);
	}

	# connect avionics, lights, etc

#**************************************************************
#* #### to do                                                 *
#* What of those other properties can be generalized?         *
#**************************************************************
#	setprop("controls/electric/avionics-switch",1);
#	setprop("controls/electric/inverter-switch",1);
#	setprop("controls/lighting/instrument-norm",0.8);
#	setprop("controls/lighting/nav-lights",1);
#	setprop("controls/lighting/beacon",1);
#	setprop("controls/lighting/strobe",1);
#	setprop("controls/lighting/wing-lights",1);
#	setprop("controls/lighting/taxi-lights",1);
#	setprop("controls/lighting/logo-lights",1);
#	setprop("controls/lighting/cabin-lights",1);
#	setprop("controls/lighting/landing-light[0]",1);
#	setprop("controls/lighting/landing-light[1]",1);
#	setprop("controls/lighting/landing-light[2]",1);
#	setprop("controls/engines/engine[1]/cutoff",0);

#	setprop("controls/lighting/instruments-norm",0.8);
#	setprop("controls/lighting/instrument-lights-norm",0.8);
#	setprop("controls/lighting/efis-norm",0.8);
#	setprop("controls/lighting/panel-norm",0.8);
#	setprop("systems/electrical/volts",28);
}

var Shutdown = func{
	setprop("controls/electric/engine[0]/generator",0);
	setprop("controls/electric/engine[1]/generator",0);
	setprop("controls/electric/engine[0]/bus-tie",0);
	setprop("controls/electric/engine[1]/bus-tie",0);
	setprop("controls/electric/APU-generator",0);
	setprop("controls/electric/avionics-switch",0);
	setprop("controls/electric/battery-switch",0);
	setprop("controls/electric/inverter-switch",0);
	setprop("controls/lighting/instruments-norm",0);
	setprop("controls/lighting/instrument-norm",0.0);
	setprop("controls/lighting/nav-lights",0);
	setprop("controls/lighting/beacon",0);
	setprop("controls/lighting/strobe",0);
	setprop("controls/lighting/wing-lights",0);
	setprop("controls/lighting/taxi-lights",0);
	setprop("controls/lighting/logo-lights",0);
	setprop("controls/lighting/cabin-lights",0);
	setprop("controls/lighting/landing-light[0]",0);
	setprop("controls/lighting/landing-light[1]",0);
	setprop("controls/lighting/landing-light[2]",0);
	setprop("controls/engines/engine[0]/cutoff",1);
	setprop("controls/engines/engine[1]/cutoff",1);
	setprop("controls/fuel/tank/boost-pump",0);
	setprop("controls/fuel/tank/boost-pump[1]",0);
	setprop("controls/fuel/tank[1]/boost-pump",0);
	setprop("controls/fuel/tank[1]/boost-pump[1]",0);
	setprop("controls/fuel/tank[2]/boost-pump",0);
	setprop("controls/fuel/tank[2]/boost-pump[1]",0);
	setprop("controls/lighting/instrument-lights-norm",0.0);
	setprop("controls/lighting/efis-norm",0.0);
	setprop("controls/lighting/panel-norm",0.0);
	setprop("systems/electrical/volts",0.0);
}

# enable 1 second after the FDM initializes
setlistener("sim/signals/fdm-initialized", func {
	settimer(enable_autostart, 1);
});


