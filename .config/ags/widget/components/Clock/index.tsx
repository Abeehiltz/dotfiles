import { Gtk } from "astal/gtk4"
import {GLib, Variable} from "astal"

export default function Clock() {
    let format = "%H:%M"

    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <menubutton
        cssClasses={["barClock"]}
        hexpand
	halign={Gtk.Align.CENTER}
	>
	<label label={time()} cssClasses={["testClock"]}/>
	<popover>
	    <label label="test" />
	</popover>
	</menubutton>
}
