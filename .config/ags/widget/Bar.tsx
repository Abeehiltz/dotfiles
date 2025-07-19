import { App, Astal, Gtk, Gdk } from "astal/gtk4"
import { Variable } from "astal"
import Workspaces from "./components/Workspaces"
import Clock from "./components/Clock"

const time = Variable("").poll(1000, "date")

export default function Bar(gdkmonitor: Gdk.Monitor) {
    const { TOP, LEFT, RIGHT } = Astal.WindowAnchor

    return  <window
        visible
        cssClasses={["Bar"]}
        gdkmonitor={gdkmonitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | RIGHT}
        application={App}>
        <centerbox cssName="centerbox">
	        <box halign={Gtk.Align.START} cssClasses={["leftBox"]}>
		        <Workspaces />
	        </box>
	        <box halign={Gtk.Align.CENTER}>
	        </box>
	        <box halign={Gtk.Align.END}>
		        <Clock />
	        </box>
        </centerbox>
    </window>
}
