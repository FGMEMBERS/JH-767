var FuelPayloadDialog = {


	buttons: [
			 [nil, nil, nil, nil, nil, nil],
			 [nil, nil, nil, nil, nil, nil],
			 [nil, nil, nil, nil, nil, nil],
			 [nil, nil, nil, nil, nil, nil],
			 [nil, nil, nil, nil, nil, nil],
			 [nil, nil, nil, nil, nil, nil]
		],

	listeners: [nil, nil, nil, nil, nil, nil],

	srow: -1,
	scol: -1,

	new: func(width=340,height=160) {
		var m = {
			parents: [SettingsDialog],
			_dlg: canvas.Window.new([width, height], nil)
		};

		m._dlg.getCanvas(1)
		.set("background", canvas.style.getColor("bg_color"));
		m._root = m._dlg.getCanvas().createGroup();

		var vbox = canvas.VBoxLayout.new();
		m._dlg.setLayout(vbox);

		var settings_base = props.globals.getNode("/consumables/fuel");
		if (settings_base != nil) {
			var tanks = settings_base.getChildren("tank");
		} else {
			var tanks = [];
		}
		var settings_base2=props.getNode("/fdm/jsbsim/propulsion");
		var jtanks=settings_base2.getChildren("tank");

		for (var i=0; i<size(tanks); i+=1) {
			var t1 = tanks[i];
			var tname = t1.getNode("name", 1).getValue();
			var t2 = jtanks[i];
			var tcontentlbs=t2.getNode("contents-lbs", 1).getValue();

			var hbox=canvas.HBoxLayout.new();
			vbox.addItem(hbox);
			var line1=canvas.gui.widgets.Label.new(m._root, canvas.style, {});
			line1.setText(tname);
			var line2=canvas.gui.widgets.Label.new(m._root, canvas.style, {});
			line2.setText(sprintf("%20.2f lbs", tcontentlbs));
			hbox.addItem(line1);
			hbox.addItem(line2);
		}

		var hbox2=canvas.HBoxLayout.new();
		vbox.addItem(hbox2);
		btnClose=canvas.gui.widgets.Button.new( m._root, canvas.style, {}).setText("Close Window");
		btnClose.listen("clicked", func{
print("pressed close");
			m._dlg.del();
		});

		hbox2.addItem(btnClose);
		var hint = vbox.sizeHint();
		hint[0] = math.max(width, hint[0]);
		m._dlg.setSize(hint);

		return m;
	} 

#	switch: func (row, col) {
#		if ((me.srow<0)) {
#			if ((me.scol<0)) {
#				me.srow=row;
#				me.scol=col;
#			}
#		}
#		for (var c=0; c<6; c+=1) {
#			if (me.buttons[row][c]!=nil) {
#				if (c!=col) {
#					me.buttons[row][c].setChecked(0);
#				} else {
#					if (me.srow==row) {
#						if (me.scol==col) {
#							setprop("/voodoomaster/pilots/setting["~row~"]/current", c);
#							var prop=getprop("/voodoomaster/pilots/setting["~row~"]/options/opt["~c~"]/pkey");
#							var val=getprop("/voodoomaster/pilots/setting["~row~"]/options/opt["~c~"]/value");
#							setprop(prop, val);
#						}
#					}
#				}
#			}
#		}
#		if (me.srow==row) {
#			if (me.scol==col) {
#				me.srow=-1;
#				me.scol=-1;
#			}
#		}
#	},
#
#	changed: func (row) {
#		if ((me.srow<0)) {
#			if ((me.scol<0)) {
#				print("prop changed");
#				for (var c=0; c<6; c+=1) {
#					if (me.buttons[row][c]!=nil) {
#						var val=getprop("/voodoomaster/pilots/setting["~row~"]/options/opt["~c~"]/value");
#						var slisten = getprop("/voodoomaster/pilots/setting/listen");
#						var slistenprop = getprop("/voodoomaster/pilots/setting/listenprop");
#						if (slisten==1) {
#							if (val==getprop(slistenprop)) {
#								me.buttons[row][c].setChecked(1);
#							}
#						}
#					}
#				}
#			}
#		}
#	}

};


